<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Add-MissingGenXdevUnitTests.ps1
Original author           : René Vaessen / GenXdev
Version                   : 2.3.2026
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
    Adds missing unit tests for GenXdev cmdlets.

.DESCRIPTION
    This function scans all GenXdev cmdlets and creates basic unit test files
    for those that don't have tests yet. The tests include PSScriptAnalyzer
    rule checks.

.EXAMPLE
    Add-MissingGenXdevUnitTests
#>
###############################################################################
function Add-MissingGenXdevUnitTests {

    # dont remove this line [dontrefactor]

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', 'Add-MissingGenXdevUnitTests')]
    param()

    return;

    # get all cmdlets that need unit tests
    GenXdev.Helpers\Get-GenXDevCmdlet | Microsoft.PowerShell.Core\ForEach-Object {

        $genXdevCmdlet = $_

        # skip if test file already exists and has content
        if ([IO.File]::Exists($_.ScriptTestFilePath) -and
            ([IO.File]::ReadAllText($_.ScriptTestFilePath).Trim() -ne '')) {

            return
        }

        # create test file content
        $prompt = (@"
###############################################################################
Describe `"`$CmdletName`" {

    It `"should pass PSScriptAnalyzer rules`" {

# get the script path for analysis
        `$scriptPath = GenXdev.FileSystem\Expand-Path `"`$PSScriptRoot\..\..\Functions\`$FullModuleName\`$CmdLetNoTestName.ps1`"

# run analyzer with explicit settings
        `$analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer ``
            -Path `$scriptPath

        [string] `$message = `"`"
        `$analyzerResults | Microsoft.PowerShell.Core\ForEach-Object {

            `$message = `$message + @`"
--------------------------------------------------
Rule: `$(`$_.RuleName)``
Description: `$(`$_.Description)
Message: `$(`$_.Message)
``r``n
`"@
        }

        `$analyzerResults.Count | Should -Be 0 -Because @`"
The following PSScriptAnalyzer rules are being violated:
`$message
`"@;
    }
}
###############################################################################
"@).Replace(
            "`$CmdletName", $genXdevCmdlet.Name
        ).Replace(
            "`$FullModuleName", $genXdevCmdlet.ModuleName
        ).Replace(
            "`$CmdLetNoTestName", $genXdevCmdlet.Name
        )

        # write test file
        $null = $prompt | Microsoft.PowerShell.Utility\Out-File (
            (GenXdev.FileSystem\Expand-Path ($genXdevCmdlet.ScriptTestFilePath) -CreateDirectory)
        ) -Force

        Microsoft.PowerShell.Utility\Write-Verbose "Created test file: $($genXdevCmdlet.ScriptTestFilePath)"
        Microsoft.PowerShell.Utility\Write-Output $prompt
    }
}
###############################################################################