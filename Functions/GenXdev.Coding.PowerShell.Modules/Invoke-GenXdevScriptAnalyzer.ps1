<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Invoke-GenXdevScriptAnalyzer.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
################################################################################
<#
.SYNOPSIS
Invokes PowerShell Script Analyzer to analyze PowerShell scripts for compliance
and best practices.

.DESCRIPTION
This function provides a wrapper around PSScriptAnalyzer to analyze PowerShell
scripts for compliance issues, best practices violations, and potential bugs.
It supports both file-based analysis and string-based script analysis with
customizable rules and settings.

.PARAMETER Path
Specifies the path to the script file to analyze. This parameter is mandatory
when using the Path parameter set.

.PARAMETER ScriptDefinition
Specifies the script definition as a string to analyze. This parameter is
mandatory when using the Script parameter set.

.PARAMETER EnableExit
Specifies that the tool should exit on error during analysis.

.PARAMETER Fix
Enables automatic fixing of violations where possible.

.PARAMETER Recurse
Recursively processes files in subdirectories when analyzing a directory path.

.PARAMETER ReportSummary
Reports a summary after analysis showing the total number of issues found.

.EXAMPLE
Invoke-GenXdevScriptAnalyzer -Path "C:\Scripts\MyScript.ps1"

.EXAMPLE
Invoke-GenXdevScriptAnalyzer -ScriptDefinition "Get-Process | Where-Object {$_.Name -eq 'notepad'}"

.EXAMPLE
Invoke-GenXdevScriptAnalyzer -Path "C:\Scripts\" -Recurse -Fix
#>
function Invoke-GenXdevScriptAnalyzer {

    [CmdletBinding(DefaultParameterSetName = 'Path')]
    param (
        #
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'Path',
            HelpMessage = 'Specifies the path to the script file.'
        )]
        [string] $Path,
        #
        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'Script',
            HelpMessage = 'Specifies the script definition as a string.'
        )]
        [string] $ScriptDefinition,
        #
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Specifies that the tool should exit on error.'
        )]
        [switch] $EnableExit,
        #
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Enables automatic fixing of violations.'
        )]
        [switch] $Fix,
        #
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Recursively process files.'
        )]
        [switch] $Recurse,
        #
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Reports a summary after analysis.'
        )]
        [switch] $ReportSummary
        #
    )

    begin {

        $loaded = Microsoft.PowerShell.Core\Get-Module -Name PSScriptAnalyzer -ErrorAction SilentlyContinue

        if (-not $loaded) {

            $folder = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\PSScriptAnalyzer\1.24.0\"
            $path = GenXdev.FileSystem\Expand-Path "$folder\PSv7\GenXdev.Coding.PowerShell.Modules.ScriptAnalyzer.dll"

            if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $folder)) {

                $null = PowerShellGet\Install-Module -Name PSScriptAnalyzer -RequiredVersion 1.24.0 -Scope CurrentUser -Force
            }

            if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $path)) {

                $source = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\assets\Modules\PSScriptAnalyzer\1.24.0\*"

                $null = GenXdev.FileSystem\Start-RoboCopy $source "$folder\"
            }

            $null = Microsoft.PowerShell.Core\Import-Module PSScriptAnalyzer
        }

        # load script analyzer settings from configuration file
        $settingsPath = "$PSScriptRoot\PSScriptAnalyzerSettings.psd1"

        $settings = Microsoft.PowerShell.Utility\Invoke-Expression `
        ([System.IO.File]::ReadAllText($settingsPath))

        # output verbose information about loaded settings
        Microsoft.PowerShell.Utility\Write-Verbose `
            "Loaded PSScriptAnalyzer settings from: $settingsPath"
    }

    process {

        try {

            # initialize invocation parameters variable
            $invocationParams = $null

            # check which parameter set is being used
            if ($PSCmdlet.ParameterSetName -eq 'Path') {

                # configure parameters for path-based analysis
                $invocationParams = @{
                    Path                  = $Path
                    IncludeRule           = $settings.IncludeRules
                    ExcludeRule           = $settings.ExcludeRules
                    CustomRulePath        = $settings.CustomRulePath
                    IncludeDefaultRules   = $settings.IncludeDefaultRules
                    RecurseCustomRulePath = $settings.RecurseCustomRulePath
                    Recurse               = [bool]$Recurse
                    Fix                   = [bool]$Fix
                    EnableExit            = [bool]$EnableExit
                    ReportSummary         = [bool]$ReportSummary
                    Severity              = 'Warning'
                }

                # output verbose information about path analysis
                Microsoft.PowerShell.Utility\Write-Verbose `
                    "Analyzing script file: $Path"
            }
            else {

                # configure parameters for script definition analysis
                $invocationParams = @{
                    ScriptDefinition      = $ScriptDefinition
                    IncludeRule           = $settings.IncludeRules
                    ExcludeRule           = $settings.ExcludeRules
                    CustomRulePath        = $settings.CustomRulePath
                    IncludeDefaultRules   = $settings.IncludeDefaultRules
                    RecurseCustomRulePath = $settings.RecurseCustomRulePath
                    Recurse               = [bool]$Recurse
                    Fix                   = [bool]$Fix
                    EnableExit            = [bool]$EnableExit
                    ReportSummary         = [bool]$ReportSummary
                    Severity              = 'Warning'
                }

                # output verbose information about script definition analysis
                Microsoft.PowerShell.Utility\Write-Verbose `
                    'Analyzing script definition content'
            }
            [int] $retries = 3;
            while ($retries-- -gt 0) {
                try {

                    # invoke script analyzer with configured parameters
                    $results = @(PSScriptAnalyzer\Invoke-ScriptAnalyzer @invocationParams -Verbose:$false)

                    # output verbose information about analysis results
                    Microsoft.PowerShell.Utility\Write-Verbose `
                        "Analysis completed with $($results.Count) results"
                    break;
                }
                catch {

                    # output warning for script analyzer errors
                    Microsoft.PowerShell.Utility\Write-Warning `
                        "ScriptAnalyzer error: $($_.Exception.Message)"

                    if ($retries -eq 1) {

                        return
                    }

                    Microsoft.PowerShell.Utility\Start-Sleep 1
                }
            }

            # check if results were returned
            if ($results -and ($results.Length -gt 0)) {

                # process each result to enhance with additional information
                $results |
                    Microsoft.PowerShell.Core\ForEach-Object {

                        # convert result to hashtable for easier manipulation
                        $resultHashTable = $_ |
                            GenXdev.Helpers\ConvertTo-HashTable

                            # add rule description to the result
                            $resultHashTable.Description = `
                            (PSScriptAnalyzer\Get-ScriptAnalyzerRule `
                                    -Name $resultHashTable.RuleName).Description

                            # output the enhanced result
                            Microsoft.PowerShell.Utility\Write-Output $resultHashTable
                        }
            }
        }
        catch {

            # create error output for general exceptions
            $errorResult = @{
                Message     = $_.Exception.Message
                RuleName    = ($null -eq $Path ? '?' : `
                        [System.IO.Path]::GetFileNameWithoutExtension($Path)) + `
                    ' @ Invocation in Invoke-GenXdevScriptAnalyzer'
                Description = 'An error occurred while invoking the Script Analyzer.'
            }

            # output the error result
            Microsoft.PowerShell.Utility\Write-Output $errorResult
        }
    }

    end {
    }
}
################################################################################