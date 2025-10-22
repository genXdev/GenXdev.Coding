<##############################################################################
Part of PowerShell module : GenXdev.Coding
Original cmdlet filename  : VSCode.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.308.2025
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