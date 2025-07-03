###############################################################################
<#
.SYNOPSIS
Generates a detailed report of refactoring operations and their status.

.DESCRIPTION
Analyzes and reports on the progress of refactoring operations by examining
their current state, completion status, and affected functions. Provides output
in either structured hashtable format or human-readable aligned text columns.
The report includes refactor name, prompt key, priority, status, function count
and completion percentage.

.PARAMETER Name
The name pattern to filter refactors. Supports wildcards. Multiple names can be
specified. Default value is "*" to display all refactors.

.PARAMETER AsText
Outputs the report in human-readable text format with aligned columns instead of
structured hashtable objects. The text format includes headers and separators.

.EXAMPLE
Get-RefactorReport -Name "DatabaseRefactor" -AsText
Generates a text report for refactors matching "DatabaseRefactor"

.EXAMPLE
refactorreport "*"
Generates hashtable report for all refactors using alias
        ###############################################################################>
function Get-RefactorReport {

    [CmdletBinding()]
    [Alias("refactorreport")]
    param (
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "The name of the refactor, accepts wildcards",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $Name = "*",

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Output report in text format instead of Hashtable"
        )]
        [switch] $AsText
        ########################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting refactor report generation for pattern: $Name"

        # initialize text output header if AsText parameter is specified
        $script:textHeader = $null
        if ($AsText) {
            # create aligned column headers with proper spacing
            $script:textHeader = @(
                "Name".PadRight(10),
                "PromptKey".PadRight(10),
                "Prio".PadRight(4),
                "Status".PadRight(10),
                "Num".PadRight(4),
                "%"
            ) -join " "
        }
    }


process {

        # output header and separator for text format
        if ($AsText -and $script:textHeader) {
            Microsoft.PowerShell.Utility\Write-Output $script:textHeader
            Microsoft.PowerShell.Utility\Write-Output ("-" * $script:textHeader.Length)
            $script:textHeader = $null
        }

        # process each matching refactor
        GenXdev.Coding\Get-Refactor -Name $Name |
        Microsoft.PowerShell.Core\ForEach-Object {
            # calculate total functions affected by this refactor
            $totalFunctions = $PSItem.State.Selected.Count + `
                $PSItem.State.Refactored.Count + `
                $PSItem.State.Unselected.Count

            Microsoft.PowerShell.Utility\Write-Verbose ("Processing refactor: $($PSItem.Name) with " + `
                    "$totalFunctions items")

            if ($AsText) {
                # format text output with truncated columns
                $name = $PSItem.Name.Substring(0,
                    [Math]::Min(10, $PSItem.Name.Length))
                $promptKey = $PSItem.RefactorSettings.PromptKey.Substring(0,
                    [Math]::Min(10, $PSItem.RefactorSettings.PromptKey.Length))
                $status = $PSItem.State.Status.Substring(0,
                    [Math]::Min(10, $PSItem.State.Status.Length))
                $percent = $PSItem.State.PercentageComplete.ToString(
                ).Substring(0, [Math]::Min(4,
                        $PSItem.State.PercentageComplete.ToString().Length))

                # output formatted text row
                Microsoft.PowerShell.Utility\Write-Output (
                    "{0} {1} {2} {3} {4} {5}%" -f `
                        $name.PadRight(10),
                    $promptKey.PadRight(10),
                    $PSItem.Priority.ToString().PadRight(4),
                    $status.PadRight(10),
                    $totalFunctions.ToString().PadRight(4),
                    $percent
                )
            }
            else {
                # return hashtable with refactor details
                Microsoft.PowerShell.Utility\Write-Output @{
                    Name               = $PSItem.Name
                    PromptKey          = $PSItem.RefactorSettings.PromptKey
                    Priority           = $PSItem.Priority
                    Status             = $PSItem.State.Status
                    FunctionCount      = $totalFunctions
                    PercentageComplete = $PSItem.State.PercentageComplete
                }
            }
        }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose "Completed refactor report generation"
    }
}
        ###############################################################################