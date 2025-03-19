Pester\Describe "Remove-Refactor" {

    Pester\It "Should pass PSScriptAnalyzer rules" {

        $scriptPath = GenXdev.FileSystem\Expand-Path (
            "$PSScriptRoot\..\..\..\..\GenXdev.Coding\1.136.2025\Functions\GenXdev.Coding.PowerShell.Modules\Remove-Refactor.ps1"
        )

        # run analyzer with explicit settings
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $scriptPath

        [string] $message = ""
        $analyzerResults | Microsoft.PowerShell.Core\ForEach-Object {

            $message = $message + @"
--------------------------------------------------
Rule: $($_.RuleName)`
Description: $($_.Description)
Message: $($_.Message)
`r`n
"@
        }

        $analyzerResults.Count | Pester\Should -Be 0 -Because @"
The following PSScriptAnalyzer rules are being violated:
$message
"@;
    }
}