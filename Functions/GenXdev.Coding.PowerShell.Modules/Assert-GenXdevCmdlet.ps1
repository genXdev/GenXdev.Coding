<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Assert-GenXdevCmdlet.ps1
Original author           : René Vaessen / GenXdev
Version                   : 2.1.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Improves GenXdev cmdlet documentation and implementation through AI assistance.

.DESCRIPTION
This function enhances GenXdev cmdlets by analyzing and improving their code
through AI prompts. It can integrate cmdlets into modules, update documentation,
and verify proper implementation. The function supports custom prompt templates
and can open files in Visual Studio Code or Visual Studio.

.PARAMETER CmdletName
The name or search pattern of the cmdlet to improve. Supports wildcards.

.PARAMETER BaseModuleName
Array of GenXdev module names to search within. Must match pattern
"GenXdev.*".

.PARAMETER PromptKey
The key identifying which AI prompt template to use for improvements.

.PARAMETER Prompt
Custom prompt text to override the template prompt.

.PARAMETER NoLocal
Skip searching local module versions.

.PARAMETER OnlyPublished
Only search published module versions.

.PARAMETER FromScripts
Search in script files rather than module files.

.PARAMETER Code
Opens the cmdlet in Visual Studio Code.

.PARAMETER VisualStudio
Opens the cmdlet in Visual Studio.

.PARAMETER EditPrompt
Only edit the AI prompt template without processing the cmdlet.

.PARAMETER Integrate
Integrate the cmdlet into a module if it's currently a standalone script.

.EXAMPLE
Assert-GenXdevCmdlet -CmdletName "Get-Something" -PromptKey "CheckDocs" -Code

.EXAMPLE
improvecmdlet Get-Something CheckDocs -c
#>
function Assert-GenXdevCmdlet {

    [CmdletBinding()]
    [Alias('improvecmdlet')]
    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'Search pattern to filter cmdlets'
        )]
        [Alias('Filter', 'CmdLet', 'Cmd', 'FunctionName', 'Name')]
        [SupportsWildcards()]
        [ValidateNotNullOrEmpty()]
        [string] $CmdletName,
        ########################################################################
        [parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'GenXdev module names to search'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Module', 'BaseModuleName', 'SubModuleName')]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.[\w\*\[\]\?]*)+)+$')]
        [SupportsWildcards()]
        [string[]] $ModuleName,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The AI prompt key to use for template selection'
        )]
        [ValidateNotNull()]
        [string] $PromptKey = 'CheckAllRequirements',
        ########################################################################
        [parameter(
            Position = 2,
            HelpMessage = 'Custom AI prompt text to use'
        )]
        [AllowEmptyString()]
        [string] $Prompt = '',
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Skip local module versions'
        )]
        [switch] $NoLocal,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only include published versions'
        )]
        [switch] $OnlyPublished,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Search in script files'
        )]
        [switch] $FromScripts,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open in Visual Studio Code'
        )]
        [Alias('c')]
        [switch] $Code,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open in Visual Studio'
        )]
        [Alias('vs')]
        [switch] $VisualStudio,
        ########################################################################
        [parameter(
            ParameterSetName = 'PromptKey',
            HelpMessage = 'Only edit the AI prompt'
        )]
        [switch] $EditPrompt,
        ########################################################################
        [parameter(
            HelpMessage = 'Integrate cmdlet into module'
        )]
        [switch] $Integrate
    )

    begin {
        try {
            # retrieve and validate target cmdlet existence
            $invocationParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                -FunctionName 'GenXdev.Helpers\Get-GenXDevCmdlet' `
                -BoundParameters $PSBoundParameters
            $invocationParams.ExactMatch = $true
            $invocationParams.CmdletName = $CmdletName`

            # select first matching cmdlet
            $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlet @invocationParams |
                Microsoft.PowerShell.Utility\Select-Object -First 1

            # validate cmdlet was found
            if ($null -eq $cmdlet) {
                throw [System.ArgumentException]::new(
                    "Could not find GenXdev cmdlet matching filter: $CmdletName")
            }

            # initialize core variables
            $CmdletName = $cmdlet.Name

            Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet: $CmdletName"

            # check if integration is needed based on script location
            $requiresIntegration = $Integrate -and ($cmdlet.ScriptFilePath.StartsWith(
                    (GenXdev.FileSystem\Expand-Path (
                        "$PSScriptRoot\..\..\..\..\..\Scripts\"))))

            # warn if integration not needed
            if ($Integrate -and -not $requiresIntegration) {
                Microsoft.PowerShell.Utility\Write-Warning ('Cmdlet already integrated into module. ' +
                    'Integration step will be skipped.')
                $Integrate = $false
            }

            Microsoft.PowerShell.Utility\Write-Verbose "Integration required: $requiresIntegration"

            # handle module integration if requested
            if ($Integrate) {

                # get full official cmdlet name
                $CmdletName = [IO.Path]::GetFileNameWithoutExtension(($cmdlet.Name))

                # integrate the cmdlet into a module
                $options = [System.Management.Automation.Host.ChoiceDescription[]] @(
                    . GenXdev.Helpers\Invoke-OnEachGenXdevModule {
                        Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath '.\' -Filter *.psm1 |
                            Microsoft.PowerShell.Core\ForEach-Object { [IO.Path]::GetFileNameWithoutExtension($_) }
                    }
                )

                $selected = @($options |
                        Microsoft.PowerShell.Utility\Out-GridView -Title 'Select a module' -PassThru)

                if ($null -eq $selected) {

                    throw 'No module selected'
                }
                if ($selected.Count -ne 1) {

                    throw 'You should only select a single module'
                }

                # move the script file to the module
                $baseDestinationParts = "$($($selected)[0].Label)".Split('.');
                $baseDestinationModule = $baseDestinationParts[0] + '.' + $baseDestinationParts[1];
                $ModuleName = "$($($selected)[0].Label)"
                $destination = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\Modules\$baseDestinationModule\2.1.2025\Functions\$ModuleName\$CmdletName.ps1" -CreateDirectory

                # move the script file
                GenXdev.FileSystem\Move-ItemWithTracking -Path $cmdlet.ScriptFilePath -Destination $destination
                [IO.File]::WriteAllText(
                    $destination,
                    (
                        "function $CmdletName {`r`n" +
                        (GenXdev.Helpers\alignScript -script (
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

                    GenXdev.FileSystem\Move-ItemWithTracking -Path $cmdlet.ScriptTestFilePath -Destination ([IO.Path]::ChangeExtension($destination, '.Tests.ps1')) -Force
                }

                # add dot source reference to corresponding psm1 file
                GenXdev.Coding\SplitUpPsm1File -Path "$PSScriptRoot\..\..\..\..\..\Modules\$baseDestinationModule\2.1.2025\$ModuleName.psm1"

                . GenXdev.Helpers\Invoke-OnEachGenXdevModule {

                    Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath '.\' -Filter '*.ps1' -File -Recurse | Microsoft.PowerShell.Core\ForEach-Object {
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
                $params = GenXdev.FileSystem\Copy-IdenticalParamValues `
                    -FunctionName 'GenXdev.Helpers\Get-GenXDevCmdlet' `
                    -BoundParameters $PSBoundParameters
                $params.ExactMatch = $true
                $params.CmdletName = $CmdletName
                $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlet @params

                # retrieve and validate the target cmdlet exists
                $invocationParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                    -FunctionName 'GenXdev.Helpers\Get-GenXDevCmdlet' `
                    -BoundParameters $PSBoundParameters

                $invocationParams.CmdletName = $CmdletName
                $invocationParams.ModuleName = $($ModuleName)
                $invocationParams.ExactMatch = $true

                $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlet @invocationParams | Microsoft.PowerShell.Utility\Select-Object -First 1
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

                [string]::Join('.', ($cmdlet.ModuleName.Split('.') | Microsoft.PowerShell.Utility\Select-Object -First 2 -ErrorAction SilentlyContinue))
            )

            $Prompt = $Prompt.Replace(
                "`$ScriptFileName",
                [System.IO.Path]::GetFileName($cmdlet.ScriptFilePath)
            )
            $Prompt = $Prompt.Replace("`t", '  ')

            # copy final prompt to clipboard for use
            $previousClipboard = Microsoft.PowerShell.Management\Get-Clipboard
            $Prompt | Microsoft.PowerShell.Management\Set-Clipboard

            Microsoft.PowerShell.Utility\Write-Verbose 'Prepared prompt and copied to clipboard:'
            Microsoft.PowerShell.Utility\Write-Verbose $Prompt
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error -Exception $_.Exception `
                -Message 'Failed to initialize Assert-GenXdevCmdlet'
            throw
        }
    }


    process {
        try {
            # handle prompt editing if requested
            if ($EditPrompt) {
                p -c
                GenXdev.Coding\VSCode $promptFilePath
                return
            }

            # open cmdlet in vscode and insert prompt
            $invocationParams = GenXdev.FileSystem\Copy-IdenticalParamValues `
                -FunctionName 'GenXdev.Coding\Show-GenXdevCmdLetInIde' `
                -BoundParameters $PSBoundParameters

            $invocationParams.CmdletName = $CmdletName
            $invocationParams.KeysToSend = @(
                "^``", "^``", '^+i', '^n', '^a', '{DELETE}', '^%b',
                '^+%{F12}', '{ENTER}', '^v', '{ENTER}', '^{ENTER}', "^``"
            )

            GenXdev.Coding\Show-GenXdevCmdLetInIde @invocationParams
            Microsoft.PowerShell.Utility\Start-Sleep 4;
            # handle unit test scenarios based on test file existence
            if ([IO.File]::Exists($cmdlet.ScriptTestFilePath)) {
                switch ($host.ui.PromptForChoice(
                        'Make a choice',
                        'What to do next?',
                        @('&Stop', "&Run unit-tests for $CmdletName", 'Redo &Last'),
                        1)) {
                    0 { throw 'Stopped' }
                    1 { return GenXdev.Coding\Assert-GenXdevTest -CmdletName $CmdletName -TestFailedAction SolveWithAI -IncludeScripts }
                    2 {
                        return GenXdev.Coding\Assert-GenXdevCmdlet @PSBoundParameters
                    }
                }
            }
            else {
                switch ($host.ui.PromptForChoice(
                        'Make a choice',
                        'What to do next?',
                        @('&Stop', "&Create unit tests for $CmdletName", 'Redo &Last'),
                        0)) {
                    0 { throw 'Stopped' }
                    1 { return GenXdev.Coding\Assert-GenXdevCmdletTests -CmdletName $CmdletName }
                    2 {
                        return GenXdev.Coding\Assert-GenXdevCmdlet @PSBoundParameters
                    }
                }
            }
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error -Exception $_.Exception -Message 'Failed to process cmdlet improvements'
            throw
        }
    }

    end {
        # restore original clipboard content
        $null = Microsoft.PowerShell.Management\Set-Clipboard -Value $previousClipboard
    }
}