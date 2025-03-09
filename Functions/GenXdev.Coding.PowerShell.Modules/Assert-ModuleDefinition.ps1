################################################################################
<#
.SYNOPSIS
Assists in refactoring PowerShell source code files using AI assistance.

.DESCRIPTION
This function automates the process of refactoring PowerShell code using AI.
It manages prompt templates, detects the active IDE (VS Code or Visual Studio),
and orchestrates the refactoring workflow through keyboard automation.

.PARAMETER ModuleName
The name of the module which definition to refactor.

.PARAMETER EditPrompt
When enabled, only opens the prompt template for editing without executing the
actual refactoring process.
#>
function Assert-ModuleDefinition {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name of the module"
        )]
        [ValidateNotNull()]
        [string] $ModuleName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The AI prompt"
        )]
        [string] $Prompt,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Switch to only edit the AI prompt"
        )]
        [switch] $EditPrompt
        ########################################################################
    )

    begin {
        if ([string]::IsNullOrWhiteSpace($Prompt)) {

            $Prompt = "Could not load module definition for `$ModuleName"
        }

        # catch the errors from the import-module operation
        try {

            $null = Import-Module $ModuleName `
                -Scope Global `
                -ErrorVariable ImportError `
                -Force

            if (($null -ne $ImportError) -and ($importError.Length -gt 0)) {

                throw ($ImportError | ConvertTo-Json -Depth 4 -ErrorAction SilentlyContinue -WarningAction SilentlyContinue)
            }
        }
        catch {

            $Prompt = $_.Exception.Message
        }

        # extract settings from refactor definition
        $promptKey = "ModuleDefinition"

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

        # determine appropriate prompt template path based on file location
        $promptFilePath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\Prompts\GenXdev.Coding.PowerShell.Modules\" `
            -CreateDirectory

        $promptFilePath = Join-Path $promptFilePath "Assert-$PromptKey.txt"

        # load template and replace placeholder
        $Prompt = [System.IO.File]::ReadAllText($promptFilePath).Replace(
            "`$Prompt",
            $Prompt
        )

        # replace template variables in prompt text
        $Prompt = $Prompt.Replace(
            "`$ModuleName",
            $ModuleName
        )

        $Prompt = $Prompt.Replace("`t", "  ")

        # copy final prompt to clipboard
        $previousClipboard = Get-Clipboard
        $null = Set-Clipboard -Value $prompt

        Write-Verbose "Prepared prompt and copied to clipboard:"
        Write-Verbose $prompt
    }

    process {

        # exit if only editing prompt
        if ($EditPrompt) {

            return
        }

        Write-Verbose "Opening file in IDE for refactoring"

        . GenXdev.Helpers\foreach-genxdev-module-do -BaseModuleName $ModuleName -Script {

            $files = Get-ChildItem .\*.psm1, .\*.psd1 -File -ErrorAction SilentlyContinue;

            foreach ($file in $files) {

                $keysToSend = @()
                $isFirst = $file -eq $files[0]
                $isLast = $file -eq $files[-1]

                # set default key sequences for each IDE
                if ($isCode) {

                    if ($isFirst) {

                        $keysToSend = @("^``", "^+i", "^l", "^a", "{DELETE}", "^+i", "{ESCAPE}")
                    }

                    if ($isLast) {

                        $keysToSend = @("^{F12}", "^v", "{ENTER}")
                    }
                    else {

                        $keysToSend = @("^{F12}", "^+i")
                    }
                }
                elseif ($isVisualStudio) {

                    if ($isFirst) {

                        $keysToSend = @("^``", "^+i", "^n")
                    }

                    if ($isLast) {

                        $keysToSend = @("^``", "^+i", "^v", "{ENTER}")
                    }
                    else {

                        $keysToSend = @("^``", "^+i")
                    }
                }

                # prepare parameters for IDE invocation
                $invocationParams = @{

                    Path       = $file.FullName
                    KeysToSend = $keysToSend
                }

                # add optional IDE parameters if specified
                $invocationParams.Code = $Code
                $invocationParams.VisualStudio = $VisualStudio

                # open file in selected IDE
                Open-SourceFileInIde @invocationParams

                Start-Sleep 4;
            }

            # set IDE flags based on user selection
            switch (($host.ui.PromptForChoice(
                        "Make a choice",
                        "What to do next?",
                        @("&Stop", "&Reload"),
                        0))) {
                0 {
                    return;
                }
                1 {
                    return (Assert-ModuleDefinition @PSBoundParameters)
                }
            }
        }
    }

    end {

        # restore previous clipboard content
        $null = Set-Clipboard -Value $previousClipboard
    }
}
################################################################################
