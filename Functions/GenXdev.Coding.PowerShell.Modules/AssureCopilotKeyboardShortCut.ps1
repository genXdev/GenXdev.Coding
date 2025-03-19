################################################################################
<#
.SYNOPSIS
Configures the GitHub Copilot keyboard shortcut in Visual Studio Code.

.DESCRIPTION
This function ensures that GitHub Copilot's file attachment feature has a proper
keyboard shortcut (Ctrl+F12) configured in Visual Studio Code. It checks the
user's keybindings.json file and adds the shortcut if it doesn't exist.

.EXAMPLE
AssureCopilotKeyboardShortCut
#>
function AssureCopilotKeyboardShortCut {

    [CmdletBinding()]
    param()

    begin {

        # construct the full path to vscode's keybindings configuration file
        $keybindingsPath = Microsoft.PowerShell.Management\Join-Path $env:APPDATA "Code\User\keybindings.json"

        # define the new keyboard shortcut configuration for copilot
        $newKeybinding = @{
            "key"     = "ctrl+f12"
            "command" = "github.copilot.edits.attachFile"
            "when"    = "resourceScheme == 'file' || resourceScheme == 'untitled'" +
            " || resourceScheme == 'vscode-remote' || " +
            "resourceScheme == 'vscode-userdata'"
        }

        $secondNewKeybinding =
        @{
           "key"     = "ctrl+shift+f12"
           "command" = "workbench.action.focusActiveEditorGroup"
           "when"    = "resourceScheme == 'file' || resourceScheme == 'untitled' || resourceScheme == 'vscode-remote' || resourceScheme == 'vscode-userdata' || terminalFocus"
        }
    }

    process {
        # ensure the directory for keybindings exists
        $keybindingsDir = Microsoft.PowerShell.Management\Split-Path $keybindingsPath -Parent
        if (-not (Microsoft.PowerShell.Management\Test-Path $keybindingsDir)) {
            Microsoft.PowerShell.Utility\Write-Verbose "Creating VS Code keybindings directory at: $keybindingsDir"
            $null = Microsoft.PowerShell.Management\New-Item -ItemType Directory -Path $keybindingsDir -Force
        }

        # load existing keybindings or initialize new array if file doesn't exist
        if (Microsoft.PowerShell.Management\Test-Path $keybindingsPath) {
            Microsoft.PowerShell.Utility\Write-Verbose "Loading existing keybindings configuration"
            $keybindings = Microsoft.PowerShell.Management\Get-Content $keybindingsPath -Raw |
            Microsoft.PowerShell.Utility\ConvertFrom-Json
        }
        else {
            Microsoft.PowerShell.Utility\Write-Verbose "Initializing new keybindings configuration"
            $keybindings = @()
        }

        # check if the copilot shortcut is already configured
        $existsCopilot = $keybindings | Microsoft.PowerShell.Core\Where-Object {
            $_.key -eq $newKeybinding.key -and $_.command -eq $newKeybinding.command
        }

        # check if the focus editor shortcut is already configured
        $existsFocus = $keybindings | Microsoft.PowerShell.Core\Where-Object {
            $_.key -eq $secondNewKeybinding.key -and $_.command -eq $secondNewKeybinding.command
        }

        # add the shortcuts if they're not already configured
        $modified = $false

        if (-not $existsCopilot) {
            Microsoft.PowerShell.Utility\Write-Verbose "Adding Copilot keyboard shortcut (Ctrl+F12)"
            $keybindings += $newKeybinding
            $modified = $true
        }
        else {
            Microsoft.PowerShell.Utility\Write-Verbose "Copilot keyboard shortcut already exists"
        }

        if (-not $existsFocus) {
            Microsoft.PowerShell.Utility\Write-Verbose "Adding Focus Editor keyboard shortcut (Ctrl+Shift+F12)"
            $keybindings += $secondNewKeybinding
            $modified = $true
        }
        else {
            Microsoft.PowerShell.Utility\Write-Verbose "Focus Editor keyboard shortcut already exists"
        }

        # Save changes if any modifications were made
        if ($modified) {
            $keybindings |
            Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10 |
            Microsoft.PowerShell.Management\Set-Content $keybindingsPath
        }
    }

    end {
    }
}
################################################################################