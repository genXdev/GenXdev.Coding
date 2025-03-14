################################################################################
<#
.SYNOPSIS
Generates a detailed report of refactoring operations and their status.

.DESCRIPTION
Analyzes and reports on the progress of refactoring operations by examining
their current state, completion status, and affected functions. Provides output
in either structured hashtable format or human-readable aligned text columns.

.PARAMETER Name
Specifies the name pattern to filter refactors. Supports wildcards.
Default value is "*" to display all refactors.

.PARAMETER AsText
When specified, outputs the report in a human-readable text format with aligned
columns instead of structured hashtable objects.

.EXAMPLE
Get-RefactorReport -Name "DatabaseRefactor" -AsText

.EXAMPLE
refactorreport "*"
#>
function Get-RefactorReport {

    [CmdletBinding()]
    [Alias("refactorreport")]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
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
    )

    begin {

        Write-Verbose "Starting refactor report generation for pattern: $Name"

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

        # output header and separator line for text format
        if ($AsText -and $script:textHeader) {
            Write-Output $script:textHeader
            Write-Output ("-" * $script:textHeader.Length)
            $script:textHeader = $null
        }

        # process each matching refactor and generate report entries
        Get-Refactor -Name $Name |
        ForEach-Object {
            # calculate total number of affected functions
            $totalFunctions = $PSItem.State.Selected.Count + `
                $PSItem.State.Refactored.Count + `
                $PSItem.State.Unselected.Count

            Write-Verbose ("Processing refactor: $($PSItem.Name) with " + `
                    "$totalFunctions items")

            if ($AsText) {
                # truncate values to fit column widths
                $name = $PSItem.Name.Substring(0,
                    [Math]::Min(10, $PSItem.Name.Length))
                $promptKey = $PSItem.RefactorSettings.PromptKey.Substring(0,
                    [Math]::Min(10, $PSItem.RefactorSettings.PromptKey.Length))
                $status = $PSItem.State.Status.Substring(0,
                    [Math]::Min(10, $PSItem.State.Status.Length))
                $percent = $PSItem.State.PercentageComplete.ToString(
                ).Substring(0, [Math]::Min(4,
                        $PSItem.State.PercentageComplete.ToString().Length))

                # format and output text row with aligned columns
                Write-Output (
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
                # return structured data as hashtable
                Write-Output @{
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

        Write-Verbose "Completed refactor report generation"
    }
}
################################################################################