<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Open-GenXdevCmdletsContainingClipboardTextInIde.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
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

                $invocationArgs = GenXdev.FileSystem\Copy-IdenticalParamValues `
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