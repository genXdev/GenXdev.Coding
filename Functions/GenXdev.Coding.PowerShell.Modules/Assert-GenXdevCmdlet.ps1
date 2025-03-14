################################################################################
<#
.SYNOPSIS
Asserts and improves a specified GenXdev cmdlet by updating its documentation
and AI prompts.

.DESCRIPTION
Opens a specified GenXdev cmdlet in Visual Studio Code and updates its AI prompt.
The function can integrate cmdlets into modules, use predefined prompt templates,
apply custom prompts, or edit prompt templates directly.

.PARAMETER Filter
Search pattern to filter cmdlets for processing. Wildcards are supported.

.PARAMETER BaseModuleName
Array of GenXdev module names to search within.

.PARAMETER PromptKey
The AI prompt template key to use for selecting the appropriate template.

.PARAMETER Prompt
Custom AI prompt text to use instead of a template.

.PARAMETER NoLocal
Skip local module versions when searching for cmdlets.

.PARAMETER OnlyPublished
Only include published module versions in search.

.PARAMETER FromScripts
Search in script files instead of module files.

.PARAMETER Code
Opens the cmdlet in Visual Studio Code.

.PARAMETER VisualStudio
Opens the cmdlet in Visual Studio.

.PARAMETER EditPrompt
Switch to only edit the AI prompt template.

.PARAMETER Integrate
Switch to integrate the cmdlet into a module.

.EXAMPLE
Assert-GenXdevCmdlet -CmdletName "Get-Something" -PromptKey "CheckAllRequirements"
-Code

.EXAMPLE
improvecmdlet Get-Something CheckAllRequirements -c

@see https://github.com/genXdev/GenXdev.Coding
@author René Vaessen
@version 1.0.0
#>
function Assert-GenXdevCmdlet {

    [CmdletBinding()]
    [Alias("improvecmdlet")]
    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = "Search pattern to filter cmdlets"
        )]
        [Alias("Filter", "CmdLet", "Cmd", "FunctionName", "Name")]
        [SupportsWildcards()]
        [string] $CmdletName = "*",
        ########################################################################
        [parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "GenXdev module names to search"
        )]
        [Alias("Module", "ModuleName")]
        [SupportsWildcards()]
        [string[]] $BaseModuleName = @("GenXdev*"),
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "The AI prompt key to use for template selection"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey = "CheckAllRequirements",
        ########################################################################
        [parameter(
            Position = 2,
            HelpMessage = "Custom AI prompt text to use"
        )]
        [AllowEmptyString()]
        [string] $Prompt = "",
        ########################################################################
        [Parameter(Mandatory = $false)]
        [switch] $NoLocal,
        ########################################################################

        [Parameter(Mandatory = $false)]
        [switch] $OnlyPublished,
        ########################################################################

        [Parameter(Mandatory = $false)]
        [switch] $FromScripts,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The ide to open the file in"
        )]
        [Alias("c")]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open in Visual Studio"
        )]
        [Alias("vs")]
        [switch] $VisualStudio,
        ########################################################################
        [parameter(
            ParameterSetName = "PromptKey",
            HelpMessage = "Switch to only edit the AI prompt"
        )]
        [switch] $EditPrompt,
        ########################################################################
        [parameter(
            HelpMessage = "Switch to integrate the cmdlet into a module"
        )]
        [switch] $Integrate
    )

    begin {
        try {
            # retrieve and validate target cmdlet existence
            $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -FunctionName "GenXdev.Helpers\Get-GenXDevCmdlets" `
                -BoundParameters $PSBoundParameters

            # select first matching cmdlet
            $cmdlet = Get-GenXDevCmdlets @invocationParams |
            Select-Object -First 1

            # validate cmdlet was found
            if ($null -eq $cmdlet) {
                throw [System.ArgumentException]::new(
                    "Could not find GenXdev cmdlet matching filter: $CmdletName")
            }

            # initialize core variables
            $CmdletName = $cmdlet.Name
            $moduleName = ""

            Write-Verbose "Processing cmdlet: $CmdletName"

            # check if integration is needed based on script location
            $requiresIntegration = $Integrate -and ($cmdlet.ScriptFilePath.StartsWith(
                (GenXdev.FileSystem\Expand-Path (
                        "$PSScriptRoot\..\..\..\..\..\Scripts\"))))

            # warn if integration not needed
            if ($Integrate -and -not $requiresIntegration) {
                Write-Warning ("Cmdlet already integrated into module. " +
                    "Integration step will be skipped.")
                $Integrate = $false
            }

            Write-Verbose "Integration required: $requiresIntegration"

            # handle module integration if requested
            if ($Integrate) {

                # get full official cmdlet name
                $CmdletName = [IO.Path]::GetFileNameWithoutExtension(($cmdlet.Name))

                # integrate the cmdlet into a module
                $options = [System.Management.Automation.Host.ChoiceDescription[]] @(
                    . GenXdev.Helpers\Invoke-OnEachGenXdevModule {
                        Get-ChildItem *.psm1 |
                        ForEach-Object { [IO.Path]::GetFileNameWithoutExtension($_) }
                    }
                )

                $selected = @($options |
                    Out-GridView -Title "Select a module" -PassThru)

                if ($null -eq $selected) {

                    throw "No module selected"
                }
                if ($selected.Count -ne 1) {

                    throw "You should only select a single module"
                }

                # move the script file to the module
                $baseDestinationParts = "$($($selected)[0].Label)".Split(".");
                $baseDestinationModule = $baseDestinationParts[0] + "." + $baseDestinationParts[1];
                $ModuleName = "$($($selected)[0].Label)"
                $destination = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\Modules\$baseDestinationModule\1.128.2025\Functions\$ModuleName\$CmdletName.ps1" -CreateDirectory

                # move the script file
                Move-ItemWithTracking -Path $cmdlet.ScriptFilePath -Destination $destination
                [IO.File]::WriteAllText(
                    $destination,
                    (
                        "function $CmdletName {`r`n" +
                        (alignScript -script (
                            [IO.File]::ReadAllText($destination).Replace(
                                "`$PSScriptRoot\..",
                                "`$PSScriptRoot\..\..\..\..\.."
                            ).Replace(
                                "$($CmdletName).ps1",
                                "$($CmdletName)"
                            ) + "`r`n}"
                        ) -spaces 4)
                    )
                );

                # also move the test script file if it exists
                if ([IO.Path]::Exists($cmdlet.ScriptTestFilePath)) {

                    Move-ItemWithTracking -Path $cmdlet.ScriptTestFilePath -Destination ([IO.Path]::ChangeExtension($destination, ".Tests.ps1")) -Force
                }

                # add dot source reference to corresponding psm1 file
                SplitUpPsm1File -Path "$PSScriptRoot\..\..\..\..\..\Modules\$baseDestinationModule\1.128.2025\$ModuleName.psm1"

                . GenXdev.Helpers\Invoke-OnEachGenXdevModule {

                    Get-ChildItem ".\*.ps1" -File -Recurse | ForEach-Object {
                        [IO.File]::WriteAllText(
                            $PSItem.FullName,
                            [IO.File]::ReadAllText(($PSItem.FullName)).Replace(
                                "$($CmdletName).ps1",
                                "$($CmdletName)"
                            )
                        )
                    }
                }

                # retrieve information about the target cmdlet
                $cmdlet = Get-GenXDevCmdlets -CmdletName $CmdletName

                # retrieve and validate the target cmdlet exists
                $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -FunctionName "GenXdev.Helpers\Get-GenXDevCmdlets" `
                    -BoundParameters $PSBoundParameters

                $invocationParams.CmdletName = $CmdletName
                $invocationParams.BaseModuleName = $($ModuleName)

                $cmdlet = Get-GenXDevCmdlets @invocationParams | Select-Object -First 1
                if ($null -eq $cmdlet) {

                    throw "Could not find GenXdev cmdlet $CmdletName"
                }
            }

            # process prompt template if specified
            if (-not [string]::IsNullOrWhiteSpace($PromptKey)) {

                # determine template path based on location
                $promptFilePath = GenXdev.FileSystem\Expand-Path -CreateFile -FilePath (
                    "$PSScriptRoot\..\..\Prompts\GenXdev.Coding.PowerShell.Modules\" +
                    "Assert-$PromptKey.txt")

                # check for script-specific template
                $scriptsPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\Scripts\" `
                    -CreateDirectory

                if ($cmdlet.ScriptFilePath -like "$scriptsPath\*.ps1") {

                    $promptFilePath = GenXdev.FileSystem\Expand-Path -CreateFile -FilePath (
                        "$PSScriptRoot\..\..\Prompts\GenXdev.Coding.PowerShell." +
                        "Modules\Assert-$PromptKey-script.txt")

                }

                # load and process template
                $Prompt = [System.IO.File]::ReadAllText($promptFilePath).Replace(
                    "`$Prompt",
                    $Prompt
                )
            }

            # replace template variables in prompt text
            $Prompt = $Prompt.Replace("`$CmdletName", $cmdlet.Name)
            $Prompt = $Prompt.Replace("`$CmdLetNoTestName", $cmdlet.Name)
            $Prompt = $Prompt.Replace(
                "`$FullModuleName",
                $cmdlet.ModuleName
            )

            $Prompt = $Prompt.Replace(
                "`$BaseModuleName",

                [string]::Join(".", ($cmdlet.ModuleName.Split(".") | Select-Object -First 2 -ErrorAction SilentlyContinue))
            )

            $Prompt = $Prompt.Replace(
                "`$ScriptFileName",
                [System.IO.Path]::GetFileName($cmdlet.ScriptFilePath)
            )
            $Prompt = $Prompt.Replace("`t", "  ")

            # copy final prompt to clipboard for use
            $previousClipboard = Get-Clipboard
            $Prompt | Set-Clipboard

            Write-Verbose "Prepared prompt and copied to clipboard:"
            Write-Verbose $Prompt
        }
        catch {
            Write-Error -Exception $_.Exception `
                -Message "Failed to initialize Assert-GenXdevCmdlet"
            throw
        }
    }

    process {
        try {
            # handle prompt editing if requested
            if ($EditPrompt) {
                p -c
                code $promptFilePath
                return
            }

            # open cmdlet in vscode and insert prompt
            $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -FunctionName "GenXdev.Coding\Show-GenXdevCmdLetInIde" `
                -BoundParameters $PSBoundParameters

            $invocationParams.CmdletName = $CmdletName
            $invocationParams.KeysToSend = @(
                "^``", "^+i", "^l", "^a", "{DELETE}", "^+i", "{ESCAPE}", "^{F12}", "^v", "{ENTER}"
            )

            Show-GenXdevCmdLetInIde @invocationParams
            Start-Sleep 4;
            # handle unit test scenarios based on test file existence
            if ([IO.File]::Exists($cmdlet.ScriptTestFilePath)) {
                switch ($host.ui.PromptForChoice(
                        "Make a choice",
                        "What to do next?",
                        @("&Stop", "&Run unit-tests for $CmdletName", "Redo &Last"),
                        0)) {
                    0 { throw "Stopped" }
                    1 { return Run-UnitTests.ps1 -CmdletName $CmdletName -DebugFailedTests }
                    2 {
                        return Assert-GenXdevCmdlet @PSBoundParameters
                    }
                }
            }
            else {
                switch ($host.ui.PromptForChoice(
                        "Make a choice",
                        "What to do next?",
                        @("&Stop", "&Create unit tests for $CmdletName", "Redo &Last"),
                        0)) {
                    0 { throw "Stopped" }
                    1 { return Assert-GenXdevCmdletTests -CmdletName $CmdletName }
                    2 {
                        return Assert-GenXdevCmdlet @PSBoundParameters
                    }
                }
            }
        }
        catch {
            Write-Error -Exception $_.Exception -Message "Failed to process cmdlet improvements"
            throw
        }
    }

    end {
        $null = Set-Clipboard -Value $previousClipboard
    }
}
################################################################################