################################################################################
Describe "PermanentlyDeleteGitFolders" {

    It "Should pass PSScriptAnalyzer rules" {

        # get the full path to the script that needs to be analyzed
        $Script:scriptPath = GenXdev.FileSystem\Expand-Path `
            "$PSScriptRoot\..\..\Functions\GenXdev.Coding.Git\PermanentlyDeleteGitFolders.ps1"

        # invoke the script analyzer with default settings
        $Script:analyzerResults = GenXdev.Coding\Invoke-GenXdevScriptAnalyzer `
            -Path $Script:scriptPath

        # build a detailed message containing all rule violations for better error reporting
        [string] $Script:message = ""
        $Script:analyzerResults | ForEach-Object {

            $Script:message = $Script:message + @"
--------------------------------------------------
Rule: $($_.RuleName)`
Description: $($_.Description)
Message: $($_.Message)
`r`n
"@
        }

        # verify that no PSScriptAnalyzer rules are being violated
        $Script:analyzerResults.Count | Should -Be 0 -Because @"
The following PSScriptAnalyzer rules are being violated:
$Script:message
"@;
    }
}
################################################################################
