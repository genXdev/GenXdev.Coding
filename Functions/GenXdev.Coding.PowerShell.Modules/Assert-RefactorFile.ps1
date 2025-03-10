################################################################################
<#
.SYNOPSIS
Assists in refactoring PowerShell source code files using AI assistance.

.DESCRIPTION
This function automates the process of refactoring PowerShell code using AI.
It manages prompt templates, detects the active IDE (VS Code or Visual Studio),
and orchestrates the refactoring workflow through keyboard automation.

.PARAMETER RefactorDefinition
A configuration object that contains settings for the refactoring process,
including prompt templates, IDE preferences, and keyboard commands.

.PARAMETER Path
The full file system path to the PowerShell source code file that needs to be
refactored. Can be a relative or absolute path.

.PARAMETER EditPrompt
When enabled, only opens the prompt template for editing without executing the
actual refactoring process.

.EXAMPLE
# Refactor a script with full parameter names
Assert-RefactorFile -RefactorDefinition $def -Path "./MyScript.ps1"

.EXAMPLE
# Only edit the prompt template using positional parameters
Assert-RefactorFile $def "./MyScript.ps1" -EditPrompt
#>
function Assert-RefactorFile {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The refactor definition"
        )]
        [ValidateNotNull()]
        [GenXdev.Helpers.RefactorDefinition] $RefactorDefinition,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "The path to the sourcefile to improve"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("FullName")]
        [string] $Path,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Switch to only edit the AI prompt"
        )]
        [switch] $EditPrompt
        ########################################################################
    )

    begin {

        # prepare paths for scripts and modules
        $scriptsPath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\..\..\..\Scripts\" -CreateDirectory
        $modulesPath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\..\..\" -CreateDirectory
        $Path = GenXdev.FileSystem\Expand-Path $Path

        # extract settings from refactor definition
        $prompt = $RefactorDefinition.RefactorSettings.Prompt
        $promptKey = $RefactorDefinition.RefactorSettings.PromptKey

        # detect which IDE is currently active
        [System.Diagnostics.Process] $hostProcess = Get-PowershellMainWindowProcess
        $isCode = $hostProcess.Name -eq "Code"
        $isVisualStudio = $hostProcess.Name -eq "devenv"

        # if no active IDE found, check settings for preferred IDE
        if (-not ($isCode -or $isVisualStudio)) {

            # check code preference
            if ($RefactorDefinition.RefactorSettings.Code -ge 0) {
                $isCode = $RefactorDefinition.RefactorSettings.Code -eq 1
            }

            # check visual studio preference
            if ($RefactorDefinition.RefactorSettings.VisualStudio -ge 0) {
                $isVisualStudio = $RefactorDefinition.RefactorSettings.VisualStudio -eq 1
            }

            # attempt to find any running IDE as fallback
            if (-not ($isCode -or $isVisualStudio)) {

                Write-Verbose "Attempting to detect running IDE instances"

                # try to find VS Code
                [System.Diagnostics.Process] $hostProcess = Get-Process "Code" `
                    -ErrorAction SilentlyContinue |
                Sort-Object |
                Select-Object -First 1

                $isCode = $null -ne $hostProcess

                # try to find Visual Studio
                $hostProcess = Get-Process "devenv" -ErrorAction SilentlyContinue |
                Sort-Object |
                Select-Object -First 1

                $isVisualStudio = $null -ne $hostProcess
            }
        }

        # prompt user to select IDE if no clear choice determined
        if (-not ($isCode -bxor $isVisualStudio)) {

            Write-Verbose "Prompting user to select IDE"
            $userAnswer = $null -ne $Global:_CodeOrVisualStudioRefactor ?
            $Global:_CodeOrVisualStudioRefactor :
            ($host.ui.PromptForChoice(
                "Make a choice",
                "What IDE to use for refactoring?",
                @("Visual Studio &Code", "&Visual Studio"),
                0))

            $Global:_CodeOrVisualStudioRefactor = $userAnswer

            # set IDE flags based on user selection
            switch ($userAnswer) {
                0 {
                    $isCode = $true
                    $isVisualStudio = $false
                    break;
                }
                1 {
                    $isCode = $false
                    $isVisualStudio = $true
                    break;
                }
            }
        }

        # process prompt template if specified
        if (-not [string]::IsNullOrWhiteSpace($PromptKey)) {

            # determine appropriate prompt template path based on file location
            $promptFilePath = GenXdev.FileSystem\Expand-Path `
                "$PSScriptRoot\..\..\Prompts\GenXdev.Coding.PowerShell.Modules\" `
                -CreateDirectory

            $promptFilePath = Join-Path $promptFilePath "Assert-$PromptKey.txt"

            # use script-specific template if file is in scripts folder
            if ($Path -like "$scriptsPath\*.ps1") {
                $promptFilePath = GenXdev.FileSystem\Expand-Path `
                    "$PSScriptRoot\..\..\Prompts\GenXdev.Coding.PowerShell.Modules\" `
                    "Assert-$PromptKey-script.txt" -CreateFile
            }

            # load template and replace placeholder
            $Prompt = [System.IO.File]::ReadAllText($promptFilePath).Replace(
                "`$Prompt",
                $Prompt
            )
        }

        # replace template variables in prompt text
        $Prompt = $Prompt.Replace(
            "`$CmdletName",
            [System.IO.Path]::GetFileNameWithoutExtension($Path)
        )

        $Prompt = $Prompt.Replace(
            "`$CmdLetNoTestName",
            [System.IO.Path]::GetFileNameWithoutExtension($Path).Replace(
                ".Tests", ""
            )
        )

        $Prompt = $Prompt.Replace(
            "`$ScriptFileName",
            [System.IO.Path]::GetFileName($Path)
        )
        $Prompt = $Prompt.Replace("`t", "  ")

        if ($Path.ToLowerInvariant().StartsWith($scriptsPath.ToLowerInvariant())) {

            $Prompt = $Prompt.Replace(
                "`$FullModuleName",
                "GenXdev.Scripts"
            )

            $Prompt = $Prompt.Replace(
                "`$BaseModuleName",
                ""
            )
        }
        else {

            $baseModuleName = "$($Path.Substring($modulesPath.Length + 1).Split("\")[0])"
            $functionsPath = GenXdev.FileSystem\Expand-Path "$modulesPath\$baseModuleName\1.118.2025\Functions\" -CreateDirectory
            $testsPath = GenXdev.FileSystem\Expand-Path "$modulesPath\$baseModuleName\1.118.2025\Tests\" -CreateDirectory

            if ($Path.ToLowerInvariant().StartsWith($functionsPath.ToLowerInvariant())) {

                $Prompt = $Prompt.Replace(
                    "`$FullModuleName",
                    "$($Path.Substring($functionsPath.Length + 1).Split("\")[0])"
                )
            }
            elseif ($Path.ToLowerInvariant().StartsWith($testsPath.ToLowerInvariant())) {

                $Prompt = $Prompt.Replace(
                    "`$FullModuleName",
                    "$($Path.Substring($testsPath.Length + 1).Split("\")[0])"
                )
            }
            else {

                $Prompt = $Prompt.Replace(
                    "`$FullModuleName",
                    "$baseModuleName"
                )
            }

            $Prompt = $Prompt.Replace(
                "`$BaseModuleName",
                "$baseModuleName"
            )
        }

        $Prompt = $Prompt.Replace("`t", "  ")

        # copy final prompt to clipboard
        $previousClipboard = Get-Clipboard
        $null = Set-Clipboard -Value $prompt

        Write-Verbose "Prepared prompt and copied to clipboard:"
        Write-Verbose $prompt

        # determine keyboard sequence based on IDE
        $keysToSend = $RefactorDefinition.RefactorSettings.KeysToSend

        if (($null -eq $keysToSend) -or ($keysToSend.Count -eq 0)) {

            # set default key sequences for each IDE
            if ($isCode) {

                $keysToSend = @("^``", "^+i", "^l", "^a", "{DELETE}", "^+i", "{ESCAPE}", "^{F12}", "^v", "{ENTER}")
            }
            elseif ($isVisualStudio) {

                $keysToSend = @("^\", "^c", "^a", " {DELETE}", "^v", "{ENTER}")
            }
        }
    }

    process {

        # exit if only editing prompt
        if ($EditPrompt) {
            return
        }

        Write-Verbose "Opening file in IDE for refactoring"

        # prepare parameters for IDE invocation
        $invocationParams = @{
            Path       = $Path
            KeysToSend = $keysToSend
        }

        # add optional IDE parameters if specified
        $invocationParams.Code = $Code
        $invocationParams.VisualStudio = $VisualStudio

        # open file in selected IDE
        Open-SourceFileInIde @invocationParams
    }

    end {

        # restore previous clipboard content
        $null = Set-Clipboard -Value $previousClipboard
    }
}
################################################################################
