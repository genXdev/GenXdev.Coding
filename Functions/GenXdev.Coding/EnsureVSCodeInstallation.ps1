###############################################################################
<#
.SYNOPSIS
Installs and configures Visual Studio Code with recommended extensions.

.DESCRIPTION
Checks if Visual Studio Code is installed and if not, installs it using WinGet.
Configures user settings, keybindings, and installs recommended extensions from
the workspace configuration. Also sets up PSGallery as a trusted repository and
configures specific extension settings.

.EXAMPLE
EnsureVSCodeInstallation
#>
function EnsureVSCodeInstallation {
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    param()

    begin {
        $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut

        # get the process that's hosting the current PowerShell session
        [System.Diagnostics.Process] $hostProcess = GenXdev.Windows\Get-PowershellMainWindowProcess

        # determine default IDE path based on host process availability
        $normalPath = Microsoft.PowerShell.Management\Join-Path $env:ProgramFiles 'Microsoft VS Code\Code.exe'
        $previewPath = Microsoft.PowerShell.Management\Join-Path $env:LOCALAPPDATA 'Programs\Microsoft VS Code Insiders\Code - Insiders.exe'
        $idePath = ((($null -eq $hostProcess) -or ($hostProcess -notlike '*Terminal*')) ? ([IO.File]::Exists($previewPath) ? $previewPath : (
                    [IO.File]::Exists($normalPath) ? $normalPath : 'code')) : $hostProcess.Path)

        # check if vscode executable is available in path
        $VSCodeMissing = $idePath -eq 'code'

        Microsoft.PowerShell.Utility\Write-Verbose "VSCode installation check: $(if($VSCodeMissing)
            {'Missing'} else {'Found'})"
    }



    process {
        if ($VSCodeMissing) {
            Microsoft.PowerShell.Utility\Write-Verbose 'Installing Visual Studio Code...'
            Microsoft.WinGet.Client\Install-WinGetPackage -Id 'Microsoft.VisualStudioCode.Insiders' `
                -Mode Silent -Force -Scope SystemOrUnknown
            GenXdev.Helpers\Initialize-SearchPaths

            # Install recommended extensions from workspace .vscode/extensions.json
            try {
                Write-Verbose "Installing recommended VSCode extensions from workspace..."
                $workspaceFolder = if ($Global:WorkspaceFolder) { $Global:WorkspaceFolder } else { Expand-Path "$PSScriptRoot\..\..\..\..\..\" }
                $extFile = Join-Path $workspaceFolder ".vscode/extensions.json"
                if (Test-Path $extFile) {
                    $plugins = Get-Content $extFile -Raw | ConvertFrom-Json
                    if ($plugins.recommendations) {
                        $i = 0
                        $total = $plugins.recommendations.Count
                        foreach ($ext in $plugins.recommendations) {
                            $percent = if ($total -gt 0) { [Convert]::ToInt32([Math]::Round((100 / $total) * $i, 0)) } else { 0 }
                            Write-Progress -Id 1 -Status "Installing VSCode extension $ext" -PercentComplete $percent -Activity "VSCode extensions"
                            try {
                                & code --install-extension $ext --force
                            } catch {
                                Write-Warning "Failed to install VSCode extension: $ext"
                            }
                            $i++
                        }
                        Write-Host "VSCode recommended extensions installed."
                    } else {
                        Write-Host "No recommended extensions found in $extFile."
                    }
                } else {
                    Write-Host "No .vscode/extensions.json found in workspace."
                }
            } catch {
                Write-Warning $_
            }

            $sourcePath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\Assets\"
            $targetPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"

            GenXdev.FileSystem\Find-Item "$sourcePath\*" -RelativeBasePath $sourcePath | Microsoft.PowerShell.Core\ForEach-Object {
                $sourceFile = GenXdev.FileSystem\Expand-Path "$sourcePath\$PSItem"
                $targetFile = GenXdev.FileSystem\Expand-Path "$targetPath\$PSItem".Replace('.asset.txt', '') -CreateDirectory
                if ([IO.File]::Exists($targetFile)) { return }
                Microsoft.PowerShell.Management\Copy-Item -Path $sourceFile -Destination $targetFile
            }
        }
    }

    end {
    }
}