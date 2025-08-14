###############################################################################
Pester\Describe 'Invoke-GenXdevPSFormatter' {

    Pester\It 'should pass PSScriptAnalyzer rules' {

        # get the script path for analysis
        $scriptPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Functions\GenXdev.Coding.PowerShell.Modules\Invoke-GenXdevPSFormatter.ps1"

        # run analyzer with explicit settings
        $analyzerResults = GenXdev.Coding\Invoke-GenXdevPSFormatter `
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

    Pester\It 'should fix Write-Host to be fully qualified'  {

        # Create a temporary PowerShell script file
        $tempFile = [System.IO.Path]::GetTempFileName() + '.ps1'

        try {
            # Write simple script with unqualified Write-Host
            [IO.File]::WriteAllText($tempFile, 'Write-Host   "Hello world"') |

                # Run formatter with -Fix
                GenXdev.Coding\Invoke-GenXdevPSFormatter -Path $tempFile

            # Read the content and check for fully qualified name
            $content = [IO.File]::ReadAllText($tempFile)
            if ($content -ne'Write-Host "Hello world"') {
                Microsoft.PowerShell.Utility\Write-Warning 'Invoke-GenXdevPSFormatter STILL does not fix the script as expected.'
            }
            else {
                Microsoft.PowerShell.Utility\Write-Warning 'YES!! Invoke-GenXdevPSFormatter works as expected.'
            }
        }
        finally {
            # Clean up
            if (Microsoft.PowerShell.Management\Test-Path -LiteralPath $tempFile) {
                Microsoft.PowerShell.Management\Remove-Item -Path $tempFile -Force
            }
        }
    }
}
###############################################################################
