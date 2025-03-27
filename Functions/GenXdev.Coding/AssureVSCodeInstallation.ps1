################################################################################
<#
.SYNOPSIS
Installs and configures Visual Studio Code with recommended extensions.

.DESCRIPTION
Checks if Visual Studio Code is installed and if not, installs it using WinGet.
Configures user settings, keybindings, and installs recommended extensions from
the workspace configuration. Also sets up PSGallery as a trusted repository and
configures specific extension settings.

.EXAMPLE
AssureVSCodeInstallation
#>
function AssureVSCodeInstallation {
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "")]
    param()

    begin {
        # check if vscode executable is available in path
        $VSCodeMissing = (([array] (Microsoft.PowerShell.Core\Get-Command "code.cmd" -ErrorAction `
                        SilentlyContinue)).Length -eq 0)

        Microsoft.PowerShell.Utility\Write-Verbose "VSCode installation check: $(if($VSCodeMissing)
            {'Missing'} else {'Found'})"
    }


process {

        if ($VSCodeMissing) {

            Microsoft.PowerShell.Utility\Write-Verbose "Installing Visual Studio Code..."

            # install vscode using winget
            Microsoft.WinGet.Client\Install-WinGetPackage -Id "Microsoft.VisualStudioCode" `
                -Mode Silent -Force -Scope SystemOrUnknown

            # refresh environment paths
            GenXdev.Helpers\Initialize-SearchPaths

            # try {
            #     # set path for vscode user settings
            #     $Global:VSCodeUserSettingsJsonPath = GenXdev.FileSystem\Expand-Path `
            #         "$($env:HomeDrive)$($env:HOMEPATH)\AppData\Roaming\Code\User\settings.json" `
            #         -CreateDirectory

            #     Write-Verbose "Copying workspace settings to user profile..."

            #     # copy workspace settings to user profile
            #     Copy-Item "$Global:WorkspaceFolder\.vscode\settings.json" `
            #         $Global:VSCodeUserSettingsJsonPath -Force

            #     # copy keybindings to user profile
            #     Copy-Item "$Global:WorkspaceFolder\.vscode\keybindings.json" `
            #         "$($env:HomeDrive)$($env:HOMEPATH)\AppData\Roaming\Code\User" `
            #         -Force -ErrorAction SilentlyContinue
            # }
            # Catch {
            #     Write-Warning $PSItem
            # }

            # try {
            #     Clear-Host

            #     Write-Verbose "Installing recommended extensions..."

            #     # load extension recommendations from workspace
            #     $plugins = ([IO.File]::ReadAllText(
            #             "$Global:WorkspaceFolder\.vscode\extensions.json",
            #             [System.Text.Encoding]::UTF8) | ConvertFrom-Json)

            #     # install each recommended extension
            #     $i = 0
            #     $plugins.recommendations | ForEach-Object -ErrorAction SilentlyContinue {

            #         # show progress for extension installation
            #         Write-Progress -Id 1 -Status "Installing VSCode plugin $($PSItem)" `
            #             -PercentComplete ([Convert]::ToInt32([Math]::Round(
            #                 (100 / $plugins.recommendations.Length) * $i , 0))) `
            #             -Activity "VSCode plugins"
            #         $i = $i + 1

            #         # install the extension
            #         code --install-extension $PSItem
            #     }
            # }
            # Catch {
            #     Write-Warning $PSItem
            # }

            # Clear-Host
            # Write-Host "VSCode Plugins installed.."

            # try {
            #     Write-Verbose "Setting PSGallery as trusted..."
            #     Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
            # }
            # catch {
            # }

            # try {
            #     Write-Verbose "Configuring formatter extension..."
            #     # configure js-css-html formatter extension
            #     $p = "$($env:HomeDrive)$($env:HOMEPATH)\.vscode\extensions\" +
            #         "lonefy.vscode-js-css-html-formatter-0.2.3\out\src\formatter.json"
            #     $a = [IO.File]::ReadAllText($p) | ConvertFrom-Json -Depth 100
            #     $a.onSave = $false
            #     [IO.File]::WriteAllText($p, ($a | ConvertTo-Json -Depth 100))
            # }
            # catch {
            # }
        }
    }

    end {
    }
}
################################################################################