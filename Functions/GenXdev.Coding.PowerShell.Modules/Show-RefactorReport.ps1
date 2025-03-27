################################################################################
<#
.SYNOPSIS
Displays a formatted report of refactoring information for specified modules.

.DESCRIPTION
Shows a table containing refactoring status and metrics for PowerShell modules
matching the specified name pattern. The report includes details like name,
prompt key, status, function count, priority and completion percentage.

.PARAMETER Name
One or more module name patterns to filter the report. Supports wildcards.
If omitted, shows all modules.

.EXAMPLE
Show-RefactorReport -Name "GenXdev.*"
Shows refactoring status for all GenXdev modules.

.EXAMPLE
refactors *
Shows refactoring status for all modules using the alias.
#>
function Show-RefactorReport {

    [CmdletBinding()]
    [Alias("refactors")]
    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "The name pattern to filter modules (supports wildcards)"
        )]
        [SupportsWildcards()]
        [string[]]$Name = "*",
        ########################################################################
        [switch] $Full
    )

    begin {

        # output detailed module filter pattern for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose ("Generating refactor report for modules matching: " +
            "$($Name -join ', ')")
    }


process {

        # retrieve report data and format as table with key metrics
        $report = GenXdev.Coding\Get-RefactorReport -Name:$Name |
            Microsoft.PowerShell.Core\ForEach-Object {

            $reportObj = $_
            $refactor = GenXdev.Coding\Get-Refactor -Name:$_.Name

            if ($Full) {

                @{
                    Name               = $reportObj.Name
                    PromptKey          = $reportObj.PromptKey
                    P                  = $reportObj.Priority
                    Fc                 = $reportObj.FunctionCount
                    C                  = "$($reportObj.PercentageComplete)%"
                    UsC                = $refactor.State.UnSelected.Count
                    UsI                = $refactor.State.UnSelectedIndex
                    SlC                = $refactor.State.Selected.Count
                    SlI                = $refactor.State.SelectedIndex
                    RfC                = $refactor.State.Refactored.Count
                    RfI                = $refactor.State.RefactoredIndex
                }

                return;
            }
            @{
                Name               = $reportObj.Name
                PromptKey          = $reportObj.PromptKey
                Priority           = $reportObj.Priority
                Status             = $reportObj.Status
                FunctionCount      = $reportObj.FunctionCount
                Complete           = "$($reportObj.PercentageComplete)%"
            }
        } | Microsoft.PowerShell.Utility\ConvertTo-Json -Compress | Microsoft.PowerShell.Utility\ConvertFrom-Json | Microsoft.PowerShell.Utility\Format-Table -AutoSize | Microsoft.PowerShell.Utility\Out-String

        $i = 0;
        $report | Microsoft.PowerShell.Core\ForEach-Object {

            if ($i++ -eq 0) {

                Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Green -Object $PSItem
            }
            else {

                Microsoft.PowerShell.Utility\Write-Host -Object $PSItem
            }
        }
    }

    end {
    }
}
################################################################################