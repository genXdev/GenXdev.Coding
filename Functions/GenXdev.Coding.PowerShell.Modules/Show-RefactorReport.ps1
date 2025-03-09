################################################################################
<#
.SYNOPSIS
Displays a formatted report of refactoring information for specified modules.

.DESCRIPTION
Shows a table containing refactoring status and metrics for PowerShell modules
matching the specified name pattern.

.PARAMETER Name
The name pattern to filter modules. Supports wildcards. Default value is '*'.

.EXAMPLE
Show-RefactorReport -Name "GenXdev*"

.EXAMPLE
refactors *
#>
function Show-RefactorReport {

    [CmdletBinding()]
    [Alias("refactors")]
    param(
        ########################################################################
        [Parameter(
            Position = 0,
            HelpMessage = "The name pattern to filter modules (supports wildcards)",
            Mandatory = $false
        )]
        [SupportsWildcards()]
        [string[]]$Name = "*"
        ########################################################################
    )

    begin {
        # output verbose information about the requested module pattern
        Write-Verbose "Generating refactor report for modules matching: $Name"
    }

    process {
        # get the refactor report and format it as a table
        $report = Get-RefactorReport -Name:$Name |
            Select-Object -Property Name, PromptKey, Status, `
                FunctionCount, Priority, PercentageComplete |
            Format-Table

        # display the formatted report in green
        Write-Host -ForegroundColor Green ($report | Out-String)
    }

    end {
    }
}
################################################################################