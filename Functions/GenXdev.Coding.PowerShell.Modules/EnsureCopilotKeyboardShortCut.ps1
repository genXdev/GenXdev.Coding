<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : EnsureCopilotKeyboardShortCut.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
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
Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code.

.DESCRIPTION
This function ensures that GitHub Copilot Chat's file attachment feature has a proper
keyboard shortcut (Ctrl+Shift+Alt+F12) configured in Visual Studio Code.

It will remove any existing Copilot attachment shortcuts and replace them with the
current correct command (github.copilot.chat.attachFile).

Also adds Alt+` (backtick) shortcut for toggling the maximized panel.

.EXAMPLE
EnsureCopilotKeyboardShortCut
#>
function EnsureCopilotKeyboardShortCut {

    [CmdletBinding()]
    param()

    begin {

        # construct the full path to vscode's keybindings configuration file
        $keybindingsPath = @(
            (GenXdev.FileSystem\Expand-Path "$env:APPDATA\Code\User\keybindings.json" -CreateDirectory),
            (GenXdev.FileSystem\Expand-Path "$env:APPDATA\Code - insiders\User\keybindings.json" -CreateDirectory)
        )

        $secondNewKeybinding =
        @{
            'key'     = 'alt+oem_3'
            'command' = 'workbench.action.toggleMaximizedPanel'
        }
    }

    process {

        # ensure the directory for keybindings exists
        foreach ($path in $keybindingsPath) {
            # Define the new keyboard shortcut configuration for copilot chat
            $newKeybinding = @{
                'key'     = 'ctrl+shift+alt+f12'
                'command' = 'workbench.action.chat.attachFile'  # Command for attaching files to Copilot chat
                'when'    = "resourceScheme == 'file' || resourceScheme == 'untitled'" +
                " || resourceScheme == 'vscode-remote' || " +
                "resourceScheme == 'vscode-userdata'"
            }            # load existing keybindings or initialize new array if file doesn't exist
            if (Microsoft.PowerShell.Management\Test-Path -LiteralPath $path) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Loading existing keybindings configuration'
                $keybindingsContent = Microsoft.PowerShell.Management\Get-Content -LiteralPath $path -Raw
                if ([string]::IsNullOrWhiteSpace($keybindingsContent)) {
                    $keybindings = @()
                } else {
                    $keybindings = @(Microsoft.PowerShell.Utility\ConvertFrom-Json -InputObject $keybindingsContent -ErrorAction SilentlyContinue)
                    # Ensure we have an array to work with
                    if ($null -eq $keybindings) {
                        $keybindings = @()
                    }
                }
            }
            else {
                Microsoft.PowerShell.Utility\Write-Verbose 'Initializing new keybindings configuration'
                $keybindings = @()
            }

            # Find and remove any existing Copilot attachment bindings
            $copilotShortcutsExist = $false
            foreach ($binding in $keybindings) {
                if ($binding.command -like 'workbench.action.chat.attachFile') {
                    $copilotShortcutsExist = $true
                    break
                }
            }

            if ($copilotShortcutsExist) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Removing existing Copilot attachment shortcuts'
                $newBindings = @()
                foreach ($binding in $keybindings) {
                    if (-not ($binding.command -like 'workbench.action.chat.attachFile')) {
                        $newBindings += $binding
                    }
                }
                $keybindings = $newBindings
                $modified = $true
            }

            # check if the focus editor shortcut is already configured
            $existsFocus = $keybindings | Microsoft.PowerShell.Core\Where-Object {
                $_.key -eq $secondNewKeybinding.key -and $_.command -eq $secondNewKeybinding.command
            }

            # We'll always add the current correct attachment command
            $modified = $true            # Always add the Copilot chat attachment shortcut
            Microsoft.PowerShell.Utility\Write-Verbose 'Adding/Updating Copilot chat attachment shortcut (Ctrl+Shift+Alt+F12)'
            $keybindings = @($keybindings) + @($newKeybinding)

            if (-not $existsFocus) {
                Microsoft.PowerShell.Utility\Write-Verbose "Adding Panel Toggle keyboard shortcut (Alt+`)"
                $keybindings = @($keybindings) + @($secondNewKeybinding)
                $modified = $true
            }
            else {
                Microsoft.PowerShell.Utility\Write-Verbose 'Panel Toggle keyboard shortcut already exists'
            }

            # Save changes if any modifications were made
            if ($modified) {
                $keybindings |
                    Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10 |
                    Microsoft.PowerShell.Management\Set-Content -LiteralPath $path
            }
        }
    }

    end {
    }
}