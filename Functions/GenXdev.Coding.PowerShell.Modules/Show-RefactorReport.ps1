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
        [string[]]$Name = "*"
        ########################################################################
    )

    begin {

        # output detailed module filter pattern for troubleshooting
        Write-Verbose ("Generating refactor report for modules matching: " +
            "$($Name -join ', ')")
    }

    process {

        # retrieve report data and format as table with key metrics
        $report = Get-RefactorReport -Name:$Name |
        Select-Object -Property Name, PromptKey, Status, `
            FunctionCount, Priority, PercentageComplete |
        Format-Table

        # display the formatted report data in green for visibility
        Write-Host -ForegroundColor Green ($report | Out-String)
    }

    end {
    }
}
################################################################################