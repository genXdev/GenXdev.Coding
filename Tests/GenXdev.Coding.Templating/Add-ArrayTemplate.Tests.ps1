###############################################################################
Pester\Describe 'Add-ArrayTemplate' {

    Pester\It 'should work as expected' {

        Microsoft.PowerShell.Core\Import-Module GenXdev.Coding -Force

        $array = @(
            @{
                Name  = "John Doe"
                Count = 500
            },
            @{
                Name  = "Jane Doe";
                Count = 1000
            }
        )

        $template = '$Name has $Count items'
        $delimiter = ""
        $endDelimiter = $false
        $indentation = 0
        $newLine = $true

        $result = GenXdev.Coding\Add-ArrayTemplate $array $template $delimiter $indentation $newLine $endDelimiter

        $result | PESTER\Should -BeExactly @"
John Doe has 500 items
Jane Doe has 1000 items
"@

        $delimiter = ","
        $indentation = 2
        $newLine = $true

        $result = GenXdev.Coding\Add-ArrayTemplate $array $template $delimiter $indentation $newLine $endDelimiter

        $result | PESTER\Should -BeExactly @"
John Doe has 500 items,
        Jane Doe has 1000 items
"@



        $template = '[$Name]'
        $delimiter = ", >"
        $endDelimiter = $true
        $indentation = 0
        $newLine = $false

        $result = GenXdev.Coding\Add-ArrayTemplate $array $template $delimiter $indentation $newLine $endDelimiter

        $result | PESTER\Should -BeExactly @"
[John Doe], >[Jane Doe], >
"@




        $template = '[$Name]'
        $delimiter = ", >"
        $endDelimiter = $true
        $indentation = 0
        $newLine = $false

        $result = GenXdev.Coding\Add-ArrayTemplate @() $template $delimiter $indentation $newLine $endDelimiter

        $result | PESTER\Should -BeExactly ([String]::Empty)
    }

    Pester\It 'should expose $_ and $PSItem variables' {

        Microsoft.PowerShell.Core\Import-Module GenXdev.Coding -Force

        $array = @(
            @{
                Name = "First"
                Type = "Column"
            },
            @{
                Name = "Second"
                Type = "Index"
            }
        )

        $template = '[t].[$_]'
        $delimiter = ', '
        $result = GenXdev.Coding\Add-ArrayTemplate ($array | Microsoft.PowerShell.Core\ForEach-Object { $_.Name }) $template $delimiter

        $result | PESTER\Should -BeExactly '[t].[First], [t].[Second]'

        
        $template = '$PSItem'
        $array = @("First", "Second")
        $result = GenXdev.Coding\Add-ArrayTemplate $array $template $delimiter

        $result | PESTER\Should -BeExactly 'First, Second'
    }
}