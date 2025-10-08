<##############################################################################
Part of PowerShell module : GenXdev.Coding
Original cmdlet filename  : Add-LineToREADME.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
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
Adds a line to a README.md markdown file in a specified section.

.DESCRIPTION
Finds and modifies a README.md file by adding a new line to a specified section.
Can create the section if it doesn't exist. Supports formatting lines as code
blocks and showing the modified section.

Will look in current directory first, then walk up directories to find the README
location. If not found, will use the README in the PowerShell profile directory.

.PARAMETER Line
The line of text to add to the README file.

.PARAMETER Section
The section header where the line should be added.

.PARAMETER Prefix
The prefix to add before the line (default: "* ").

.PARAMETER Code
Switch to open the README in Visual Studio Code after modification.

.PARAMETER Show
Switch to display the modified section after changes.

.PARAMETER Done
Switch to mark a todo item as completed.

.PARAMETER UseHomeREADME
Switch to use README in PowerShell profile directory.

.PARAMETER UseOneDriveREADME
Switch to use README in OneDrive directory.

.EXAMPLE
Add-LineToREADME -Line "New feature" -Section "## Features" -Prefix "- [ ] "

.EXAMPLE
Add-LineToREADME "New feature" "## Features" "* " -Show
#>
function Add-LineToREADME {

    [CmdletBinding()]
    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'The line to add to the README'
        )]
        [string] $Line = '',

        #######################################################################
        [Parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'The section to add the line to'
        )]
        [string] $Section,

        #######################################################################
        [Parameter(
            Position = 2,
            Mandatory = $true,
            HelpMessage = 'The prefix to use for the line'
        )]
        [string] $Prefix = '* ',

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open in Visual Studio Code after modifying'
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
            HelpMessage = 'Mark the item as completed'
        )]
        [switch] $Done,

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
    )

    begin {

        # helper function to find readme path by walking up directories
        function findReadMePath([string] $startDir) {

            $startDir = GenXdev.FileSystem\Expand-Path $startDir
            Microsoft.PowerShell.Management\Push-Location -LiteralPath $startDir

            try {
                # walk up directories looking for README.md
                do {
                    if ([System.IO.File]::Exists("$pwd\README.md")) {
                        return "$pwd\README.md"
                    }

                    if ($startDir.Length -ge 2) {

                        $startDir = GenXdev.FileSystem\Expand-Path "$((Microsoft.PowerShell.Management\Get-Location).Path)\..\"
                    }
                }
                while (($startDir.Length -ge 2) -and ($startDir -ne $PWD))
            }
            finally {
                Microsoft.PowerShell.Management\Pop-Location
            }

            # fallback to onedrive readme
            return "$((GenXdev.FileSystem\Expand-Path -FilePath '~\Onedrive\README.md' -CreateDirectory))";
        }

        # determine which readme file to use
        if ($UseHomeREADME) {
            $readmePath = GenXdev.FileSystem\Expand-Path `
                -FilePath "$([IO.Path]::GetDirectoryName($Profile))\README.md"
        }
        elseif ($UseOneDriveREADME) {
            $readmePath = GenXdev.FileSystem\Expand-Path `
                -FilePath '~\Onedrive\README.md' `
                -CreateDirectory
        }
        else {
            $readmePath = findReadMePath $PWD
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Using README at: $readmePath"

        # verify readme exists
        if (![IO.File]::Exists($readmePath)) {
            throw "README file not found at: $readmePath"
        }

        # load readme content
        $readme = [IO.File]::ReadAllText($readmePath)
        [int] $insertIndex = $readme.IndexOf("$Section")

        # create section if it doesn't exist
        if ($insertIndex -lt 0) {
            $insertIndex = 0
            $readme = "$Section`r`n`r`n$readme"
        }

        $insertIndex += "$Section`r".Length
    }


    process {

        if (![string]::IsNullOrWhiteSpace($Line)) {
            if ($Done) {
                # mark item as completed
                $readme = $readme.Replace(
                    "$prefix$Line`r`n",
                    "- [✅] $($Line.Trim())`r`n"
                )
            }
            else {
                # insert new line at section
                $readme = $readme.Substring(0, $insertIndex) +
                "$prefix$Line`r`n" +
                $readme.Substring($insertIndex)
            }
        }
    }

    end {
        # save changes
        [IO.File]::WriteAllText($readmePath, $readme)

        # open in vscode if requested
        if ($Code) {
            $codeCmd = Microsoft.PowerShell.Core\Get-Command 'code.cmd' -ErrorAction SilentlyContinue
            if ($null -ne $codeCmd) {
                cmd.exe /c code.cmd $readmePath
            }
        }

        # show modified section if requested
        if ($Show) {
            $readmeMarkDown = ''
            $inSection = $false

            $ansiColorStart = [char]27 + '['
            $ansiColorYellow = "${ansiColorStart}33m"
            $ansiBackgroundColorBlue = "${ansiColorStart}44m"
            $ansiColorReset = "${ansiColorStart}0m"

            foreach ($readmeLine in [IO.File]::ReadAllLines($readmePath)) {
                if ($readmeLine.StartsWith($Section)) {
                    $inSection = $true
                    $readmeMarkDown = "$ansiBackgroundColorBlue$ansiColorYellow" +
                    "$readmeMarkDown$($readmeLine.trim("`r`n`t "))" +
                    "$ansiColorReset`r`n`r`n"
                }
                elseif ($inSection) {
                    if ($readmeLine.StartsWith('#')) {
                        break
                    }
                    $readmeMarkDown = "$readmeMarkDown" +
                    "$($readmeLine.trim("`r`n`t "))`r`n`r`n"
                }
            }

            $readmeMarkDown
        }
    }
}