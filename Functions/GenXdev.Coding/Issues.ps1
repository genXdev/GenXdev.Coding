###############################################################################
<#
.SYNOPSIS
Displays issues from a README.md file.

.DESCRIPTION
Shows all issues from the "## Issues" section of a README.md file. Can use
either the README in the current location, PowerShell profile directory, or
OneDrive directory.

.PARAMETER UseHomeREADME
Use README.md from PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Use README.md from OneDrive directory instead of current location.

.EXAMPLE
Issues -UseHomeREADME

.EXAMPLE
Issues -UseOneDriveREADME
        ###############################################################################>
function Issues {

    [CmdletBinding()]
    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "Use README in PowerShell profile directory"
        )]
        [switch] $UseHomeREADME,
        #######################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "Use README in OneDrive directory"
        )]
        [switch] $UseOneDriveREADME
        #######################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Issues function"
    }


process {

        # display issues using base function
        GenXdev.Coding\Add-IssueLineToREADME `
            -Show `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}