###############################################################################
<#
.SYNOPSIS
Displays features from a README.md file.

.DESCRIPTION
Shows all features from the "## Features" section of a README.md file. Can use
either the README in the current location, PowerShell profile directory, or
OneDrive directory.

.PARAMETER UseHomeREADME
Use README.md from PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Use README.md from OneDrive directory instead of current location.

.EXAMPLE
Features -UseHomeREADME
        ###############################################################################>
function Features {

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

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Features function"
    }


process {

        # display features using base function
        GenXdev.Coding\Add-FeatureLineToREADME `
            -Show `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}