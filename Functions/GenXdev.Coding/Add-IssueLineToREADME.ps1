<##############################################################################
Part of PowerShell module : GenXdev.Coding
Original cmdlet filename  : Add-IssueLineToREADME.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Adds an issue item to the README.md file.

.DESCRIPTION
Adds a timestamped issue to the "## Issues" section of a README.md file.
Can display the modified section and open in Visual Studio Code.

.PARAMETER Line
The issue text to add. Will be prefixed with current date if not empty.

.PARAMETER Code
Opens the README in Visual Studio Code after modification.

.PARAMETER Show
Displays the modified section after changes.

.PARAMETER UseHomeREADME
Uses README in PowerShell profile directory instead of current location.

.PARAMETER UseOneDriveREADME
Uses README in OneDrive directory instead of current location.

.EXAMPLE
Add-IssueLineToREADME -Line "Found critical bug" -Show -UseHomeREADME

.EXAMPLE
issue "Server connection fails" -Show
#>
function Add-IssueLineToREADME {

    [CmdletBinding()]
    [Alias('issue')]
    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'The issue text to add'
        )]
        [AllowEmptyString()]
        [string] $Line = '',
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open README in Visual Studio Code'
        )]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Show the modified section'
        )]
        [switch] $Show,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use README in PowerShell profile directory'
        )]
        [switch] $UseHomeREADME,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use README in OneDrive directory'
        )]
        [switch] $UseOneDriveREADME
        #######################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting Add-IssueLineToREADME'
    }


    process {

        if (![string]::IsNullOrWhiteSpace($Line)) {
            # prefix line with current date
            $Line = "$([DateTime]::Now.ToString('yyyyMMdd')) --> $Line"
            Microsoft.PowerShell.Utility\Write-Verbose "Formatted issue line: $Line"
        }

        # add line to readme using base function
        GenXdev.Coding\Add-LineToREADME `
            -Code:$Code `
            -Show:$Show `
            -Section '## Issues' `
            -Prefix '- [ ] ' `
            -Line $Line `
            -UseHomeREADME:$UseHomeREADME `
            -UseOneDriveREADME:$UseOneDriveREADME
    }

    end {
    }
}