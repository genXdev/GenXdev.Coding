<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Open-GenXdevCmdletsContainingClipboardTextInIde.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
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
Opens files in IDE that contain clipboard text

.DESCRIPTION
The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio
###############################################################################>
function Open-GenXdevCmdletsContainingClipboardTextInIde {

    ############################################################################
    [CmdletBinding()]
    [Alias('vscodesearch')]
    param (
        ############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            HelpMessage = 'Search for clipboard text in all GenXdev scripts'
        )]
        [string] $InputObject,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Add sourcefile to Copilot edit-session'
        )]
        [switch]$Copilot
    )

    ############################################################################
    begin {

        $clipboardText = Microsoft.PowerShell.Management\Get-Clipboard

        if ($Copilot) {
            $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut
        }
    }

    ############################################################################

    process {

        if ($null -eq $inputObject) {
            $inputObject = $clipboardText
        }

        if ([string]::IsNullOrWhiteSpace($inputObject)) {
            Microsoft.PowerShell.Utility\Write-Error 'No input object provided. Please provide a string to search for or set a clipboard text.'
            return
        }

        $searchPattern = [System.Text.RegularExpressions.Regex]::Escape($inputObject)

        GenXdev.Helpers\Invoke-OnEachGenXdevModule {

            param($module)

            $filePaths = GenXdev.FileSystem\Find-Item `
                -SearchMask '*.ps1' `
                -Pattern $searchPattern `
                -PassThru | Microsoft.PowerShell.Core\ForEach-Object FullNames

            if ($filePaths) {

                $invocationArgs = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName 'GenXdev.Coding\Open-SourceFileInIde'

                $invocationArgs.Path = $filePaths
                $invocationArgs.Code = $true

                if ($Copilot) {

                    $invocationArgs.KeysToSend = @('^+%{F12}')
                }

                GenXdev.Coding\Open-SourceFileInIde @invocationArgs
            }
        }
    }

    ############################################################################
    end {

    }
}