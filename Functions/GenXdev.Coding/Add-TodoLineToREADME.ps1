################################################################################
<#
.SYNOPSIS
Adds a todo item to the README.md file.

.DESCRIPTION
Adds a timestamped todo item to the "## Todoos" section of a README.md file.
The todo items can be marked as done and the modified section can be displayed.
Each new todo item is automatically timestamped unless marking as done.

.PARAMETER Line
The todo item text to add. Will be prefixed with current date if not empty.

.PARAMETER Code
Opens the README in Visual Studio Code after modification.

.PARAMETER Show
Displays the modified section after changes.

.PARAMETER Done
Marks the specified todo item as completed.

.PARAMETER UseHomeREADME
Uses README in PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Uses README in OneDrive directory instead of current location.

.EXAMPLE
Add-TodoLineToREADME -Line "Implement new feature" -Show -Code

.EXAMPLE
todo "Fix bug" -Done
#>
function Add-TodoLineToREADME {

    [CmdletBinding()]
    [Alias("todo")]
    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            HelpMessage = "The todo item text to add"
        )]
        [AllowEmptyString()]
        [string] $Line = "",

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open README in Visual Studio Code"
        )]
        [switch] $Code,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Show the modified section"
        )]
        [switch] $Show,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Mark todo item as completed"
        )]
        [switch] $Done,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use README in PowerShell profile directory"
        )]
        [switch] $UseHomeREADME,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use README in OneDrive directory"
        )]
        [switch] $UseOneDriveREADME
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Add-TodoLineToREADME with parameters: $($PSBoundParameters |
            Microsoft.PowerShell.Utility\ConvertTo-Json)"
    }


process {

        # only add timestamp if line is not empty and not marking as done
        if (![string]::IsNullOrWhiteSpace($Line) -and !$Done) {

            # prefix line with current date in yyyyMMdd format
            $Line = "$([DateTime]::Now.ToString('yyyyMMdd')) --> $Line"
            Microsoft.PowerShell.Utility\Write-Verbose "Formatted todo line: $Line"
        }

        # add line to readme using base function with specified parameters
        GenXdev.Coding\Add-LineToREADME `
            -Code:$Code `
            -Show:$Show `
            -Section "## Todoos" `
            -Prefix "- [ ] " `
            -Line $Line `
            -Done:$Done `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}
################################################################################