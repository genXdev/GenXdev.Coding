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
        $keybindingsPath = Join-Path $env:APPDATA "Code\User\keybindings.json"

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
        $keybindingsDir = Split-Path $keybindingsPath -Parent
        if (-not (Test-Path $keybindingsDir)) {
            Write-Verbose "Creating VS Code keybindings directory at: $keybindingsDir"
            $null = New-Item -ItemType Directory -Path $keybindingsDir -Force
        }

        # load existing keybindings or initialize new array if file doesn't exist
        if (Test-Path $keybindingsPath) {
            Write-Verbose "Loading existing keybindings configuration"
            $keybindings = Get-Content $keybindingsPath -Raw |
            ConvertFrom-Json
        }
        else {
            Write-Verbose "Initializing new keybindings configuration"
            $keybindings = @()
        }

        # check if the copilot shortcut is already configured
        $existsCopilot = $keybindings | Where-Object {
            $_.key -eq $newKeybinding.key -and $_.command -eq $newKeybinding.command
        }

        # check if the focus editor shortcut is already configured
        $existsFocus = $keybindings | Where-Object {
            $_.key -eq $secondNewKeybinding.key -and $_.command -eq $secondNewKeybinding.command
        }

        # add the shortcuts if they're not already configured
        $modified = $false

        if (-not $existsCopilot) {
            Write-Verbose "Adding Copilot keyboard shortcut (Ctrl+F12)"
            $keybindings += $newKeybinding
            $modified = $true
        }
        else {
            Write-Verbose "Copilot keyboard shortcut already exists"
        }

        if (-not $existsFocus) {
            Write-Verbose "Adding Focus Editor keyboard shortcut (Ctrl+Shift+F12)"
            $keybindings += $secondNewKeybinding
            $modified = $true
        }
        else {
            Write-Verbose "Focus Editor keyboard shortcut already exists"
        }

        # Save changes if any modifications were made
        if ($modified) {
            $keybindings |
            ConvertTo-Json -Depth 10 |
            Set-Content $keybindingsPath
        }
    }

    end {
    }
}
################################################################################