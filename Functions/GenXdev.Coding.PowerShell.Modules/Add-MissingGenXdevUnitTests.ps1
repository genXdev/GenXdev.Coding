<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Add-MissingGenXdevUnitTests.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
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
###############################################################################
function Add-MissingGenXdevUnitTests {

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