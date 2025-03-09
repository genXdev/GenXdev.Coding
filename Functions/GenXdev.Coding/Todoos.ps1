###############################################################################
<#
.SYNOPSIS
Displays todo items from a README.md file.

.DESCRIPTION
Shows all todo items from the "## Todoos" section of a README.md file. Can use
either the README in the current location, PowerShell profile directory, or
OneDrive directory.

.PARAMETER UseHomeREADME
Use README.md from PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Use README.md from OneDrive directory instead of current location.

.EXAMPLE
Todoos -UseHomeREADME

.EXAMPLE
Todoos -UseOneDriveREADME
#>
function Todoos {

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

        Write-Verbose "Starting Todoos function"
    }

    process {

        # display todos using base function
        Add-TodoLineToREADME `
            -Show `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}
