<##############################################################################
Part of PowerShell module : GenXdev.Coding
Original cmdlet filename  : VSCode.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.278.2025
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
Opens one or more files in Visual Studio Code.

.DESCRIPTION
This function takes file paths and opens them in Visual Studio Code. It expands
paths and validates file existence before attempting to open them. The function
supports both direct file paths and pipeline input, making it ideal for quickly
opening multiple files from terminal searches.

.PARAMETER FilePath
One or more file paths to open in Visual Studio Code. Accepts pipeline input
and wildcard patterns.

.PARAMETER Copilot
When specified, opens the file and triggers the Copilot keyboard shortcut to
start an edit session.

.EXAMPLE
VSCode -FilePath "C:\path\to\file.txt" -Copilot

.EXAMPLE
Get-ChildItem *.js -Recurse | VSCode
#>
function VSCode {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            HelpMessage = 'The path to the file to open in VSCode'
        )]
        [string[]]$FilePath,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Add sourcefile to Copilot edit-session'
        )]
        [switch]$Copilot
    )

    begin {

        $PSRootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"

        # inform user that function execution has started
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting VSCode function to open files'

        # ensure copilot keyboard shortcut is configured if needed
        if ($Copilot) {

            $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut
        }
    }


    process {

        $VSCodeInvoked = $false

        # process each file path provided through pipeline or parameter
        $FilePath | Microsoft.PowerShell.Core\ForEach-Object {

            try {
                # expand relative or partial paths to full filesystem paths
                $path = GenXdev.FileSystem\Expand-Path $_

                if (-not $VSCodeInvoked -and ($path.StartsWith("$PSRootPath\"))) {

                    $VSCodeInvoked = $true
                    GenXdev.Coding\Open-SourceFileInIde `
                        -Path $PSRootPath `
                        -Code
                }

                # open file in vscode with or without copilot activation
                Microsoft.PowerShell.Utility\Write-Verbose "Opening file in VSCode: $path"
                if ($Copilot) {

                    $null = GenXdev.Coding\Open-SourceFileInIde `
                        -Path $path `
                        -Code `
                        -KeysToSend @('^+%{F12}')
                }
                else {
                    $null = GenXdev.Coding\Open-SourceFileInIde -Path $path -Code
                }
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Warning "Error processing file '$path': $_"
            }
        }
    }

    end {
    }
}