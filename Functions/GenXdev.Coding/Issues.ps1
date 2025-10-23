<##############################################################################
Part of PowerShell module : GenXdev.Coding
Original cmdlet filename  : Issues.ps1
Original author           : René Vaessen / GenXdev
Version                   : 2.1.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
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
#>
function Issues {

    [CmdletBinding()]
    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = 'Use README in PowerShell profile directory'
        )]
        [switch] $UseHomeREADME,
        #######################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'Use README in OneDrive directory'
        )]
        [switch] $UseOneDriveREADME
        #######################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting Issues function'
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