###############################################################################

Pester\Describe 'New-Refactor' {

    Pester\It 'Should pass PSScriptAnalyzer rules' {

        # run script analyzer on the function script
        $scriptPath = "$PSScriptRoot\..\..\..\..\GenXdev.Coding\1.218.2025\Functions\GenXdev.Coding.PowerShell.Modules\" +
        'New-Refactor.ps1'
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $scriptPath

        [string] $message = ''
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
###############################################################################