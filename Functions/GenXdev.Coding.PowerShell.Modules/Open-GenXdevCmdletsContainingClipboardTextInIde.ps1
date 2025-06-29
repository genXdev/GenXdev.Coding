################################################################################
<#
.SYNOPSIS
Opens files in IDE that contain clipboard text

.DESCRIPTION
The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio
#>
################################################################################
function Open-GenXdevCmdletsContainingClipboardTextInIde {

    ############################################################################
    [CmdletBinding()]
    [Alias("vscodeclipboard")]
    param (
    ########################################################################
    [Parameter(
        Mandatory = $false,
        HelpMessage = "Add sourcefile to Copilot edit-session"
    )]
    [switch]$Copilot
    )

    ############################################################################
    begin {

        $clipboardText = Microsoft.PowerShell.Management\Get-Clipboard
        $searchPattern = [System.Text.RegularExpressions.Regex]::Escape($clipboardText)
        if ($Copilot) {

            $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut
        }
    }

    ############################################################################

    process {

        GenXdev.Helpers\foreach-genxdev-module-do {

            param($module)

            $filePaths = GenXdev.FileSystem\Find-Item `
                -SearchMask "*.ps1" `
                -Pattern $searchPattern `
                -PassThru | Microsoft.PowerShell.Core\ForEach-Object FullNames

            if ($filePaths) {

                $invocationArgs = GenXdev.Helpers\Copy-IdenticalParamValues `
                    -BoundParameters $PSBoundParameters `
                    -FunctionName "GenXdev.Coding\Open-SourceFileInIde"

                $invocationArgs.Path = $filePaths
                $invocationArgs.Code = $true

                if ($Copilot) {

                    $invocationArgs.KeysToSend = @("^+%{F12}")
                }

                GenXdev.Coding\Open-SourceFileInIde @invocationArgs
            }
        }
    }

    ############################################################################
    end {

    }
}
