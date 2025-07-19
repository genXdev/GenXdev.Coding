###############################################################################
<#
.SYNOPSIS
Adds a ReleaseNote line to the README file with a timestamp.

.DESCRIPTION
Adds a ReleaseNote line to the specified README file, prefixed with the current date
in yyyyMMdd format. The line can be formatted as code and optionally displayed.

.PARAMETER Line
The ReleaseNote description text to add to the README file.

.PARAMETER Code
Switch to format the line as code in the README file.

.PARAMETER Show
Switch to display the README file after adding the line.

.PARAMETER UseHomeREADME
Switch to use the README file in the home directory.

.PARAMETER UseOneDriveREADME
Switch to use the README file in the OneDrive directory.

.EXAMPLE
Add-ReleaseNoteLineToREADME -Line "Added new Git ReleaseNote"

.EXAMPLE
ReleaseNote "Added new Git ReleaseNote" -Code -Show
#>
function Add-ReleaseNoteLineToREADME {

    [CmdletBinding()]
    [Alias('ReleaseNote')]

    param(
        #######################################################################
        [Parameter(
            Position = 0,
            ValueFromRemainingArguments = $false,
            Mandatory = $false,
            HelpMessage = 'The ReleaseNote description text to add'
        )]
        [string] $Line = '',

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Format the line as code'
        )]
        [switch] $Code,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Display the README after adding the line'
        )]
        [switch] $Show,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use README in home directory'
        )]
        [switch] $UseHomeREADME,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use README in OneDrive directory'
        )]
        [switch] $UseOneDriveREADME
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Add-ReleaseNoteLineToREADME with line: $Line"
    }


    process {
        # format the line with timestamp if not empty
        if ([string]::IsNullOrWhiteSpace($Line) -eq $false) {
            $Line = "$([DateTime]::Now.ToString('yyyyMMdd')) --> $Line"
            Microsoft.PowerShell.Utility\Write-Verbose "Formatted line: $Line"
        }

        # add the line to the README file
        GenXdev.Coding\Add-LineToREADME `
            -Code:$Code `
            -Show:$Show `
            -Section '## Release notes' `
            -Prefix '- [✅] ' `
            -Line $Line `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}