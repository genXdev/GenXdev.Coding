###############################################################################
<#
.SYNOPSIS
Displays ideas from a README.md file.

.DESCRIPTION
Shows all ideas from the "## Ideas" section of a README.md file. Can use either
the README in the current location, PowerShell profile directory, or OneDrive
directory.

.PARAMETER UseHomeREADME
Use README.md from PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Use README.md from OneDrive directory instead of current location.

.EXAMPLE
Ideas -UseHomeREADME

.EXAMPLE
Ideas -UseOneDriveREADME
#>
function Ideas {

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

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Ideas function"
    }


process {

        # display ideas using base function
        GenXdev.Coding\Add-IdeaLineToREADME `
            -Show `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}