###############################################################################
<#
.SYNOPSIS
Adds an idea item to the README.md file.

.DESCRIPTION
Adds a timestamped idea to the "## Ideas" section of a README.md file.
Can display the modified section and open in Visual Studio Code.

.PARAMETER Line
The idea text to add. Will be prefixed with current date if not empty.

.PARAMETER Code
Opens the README in Visual Studio Code after modification.

.PARAMETER Show
Displays the modified section after changes.

.PARAMETER UseHomeREADME
Uses README in PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Uses README in OneDrive directory instead of current location.

.EXAMPLE
Add-IdeaLineToREADME -Line "Create new PowerShell module" -Show

.EXAMPLE
idea "New feature idea" -UseOneDriveREADME
#>
function Add-IdeaLineToREADME {

    [CmdletBinding()]
    [Alias("idea")]
    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromRemainingArguments = $false,
            HelpMessage = "The idea text to add"
        )]
        [AllowEmptyString()]
        [string] $Line = "",
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open README in Visual Studio Code"
        )]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Show the modified section"
        )]
        [switch] $Show,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use README in PowerShell profile directory"
        )]
        [switch] $UseHomeREADME,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use README in OneDrive directory"
        )]
        [switch] $UseOneDriveREADME
        #######################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Add-IdeaLineToREADME"
    }

    process {

        if (![string]::IsNullOrWhiteSpace($Line)) {
            # prefix line with current date
            $Line = "$([DateTime]::Now.ToString('yyyyMMdd')) --> $Line"
            Microsoft.PowerShell.Utility\Write-Verbose "Formatted idea line: $Line"
        }

        # add line to readme using base function
        GenXdev.Coding\Add-LineToREADME `
            -Code:$Code `
            -Show:$Show `
            -Section "## Ideas" `
            -Prefix "- [ ] " `
            -Line $Line `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}