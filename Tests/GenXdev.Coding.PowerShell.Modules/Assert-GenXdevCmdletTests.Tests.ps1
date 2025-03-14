################################################################################
Describe "Assert-GenXdevCmdletTests" {

    BeforeAll {
        # set up test variables
        $Script:testCmdletName = "Get-GenXDevModuleInfo"
        $Script:scriptPath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdletTests.ps1"
    }

    It "Should pass PSScriptAnalyzer rules" {

        $analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $Script:scriptPath

        [string] $message = ""
        $analyzerResults | ForEach-Object {

            $message = $message + @"
--------------------------------------------------
Rule: $($_.RuleName)`
Description: $($_.Description)
Message: $($_.Message)
`r`n
"@
        }

        $analyzerResults.Count | Should -Be 0 -Because @"
The following PSScriptAnalyzer rules are being violated:
$message
"@;
    }
}
################################################################################