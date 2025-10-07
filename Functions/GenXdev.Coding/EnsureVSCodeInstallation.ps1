<##############################################################################
Part of PowerShell module : GenXdev.Coding
Original cmdlet filename  : EnsureVSCodeInstallation.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
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
    param(
        ###############################################################################

        [switch] $Force

        ###############################################################################
    )

    begin {

        # ensure copilot keyboard shortcut is configured
        $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut

        # get the process that's hosting the current PowerShell session
        [System.Diagnostics.Process] $hostProcess = `
            GenXdev.Windows\Get-PowershellMainWindowProcess

        # determine default IDE path based on host process availability
        $normalPath = Microsoft.PowerShell.Management\Join-Path `
            $env:LOCALAPPDATA 'Programs\Microsoft VS Code\Code.exe'
        $normalPath2 = Microsoft.PowerShell.Management\Join-Path `
            $env:ProgramFiles 'Microsoft VS Code\Code.exe'
        $previewPath = Microsoft.PowerShell.Management\Join-Path `
            $env:LOCALAPPDATA `
            'Programs\Microsoft VS Code Insiders\Code - Insiders.exe'
        $previewPath2 = Microsoft.PowerShell.Management\Join-Path `
            $env:ProgramFiles `
            '\Microsoft VS Code Insiders\Code - Insiders.exe'

        $idePath = ((($null -eq $hostProcess) -or `
                ($hostProcess -like '*Terminal*')) ? (
                ([IO.File]::Exists($previewPath) ? $previewPath : (
                    ([IO.File]::Exists($previewPath2) ? $previewPath2 : (
                        ([IO.File]::Exists($normalPath) ? $normalPath : (
                            ([IO.File]::Exists($normalPath2) ? $normalPath2 : 'code')))))))) : `
                $hostProcess.Path)

        # check if vscode executable is available in path
        $vSCodeMissing = $idePath -eq 'code'
        Microsoft.PowerShell.Utility\Write-Verbose `
            ("VSCode installation check: $($vSCodeMissing ? 'Missing' : 'Found')")
    }

    process {

        if ($vSCodeMissing -or $Force) {

            Microsoft.PowerShell.Utility\Write-Verbose `
                'Installing Visual Studio Code...'

            # check installation consent before proceeding
            $consent = GenXdev.FileSystem\Confirm-InstallationConsent `
                -ApplicationName 'Visual Studio Code Insiders' `
                -Source 'Winget' `
                -Description 'Code editor and development environment for PowerShell module development' `
                -Publisher 'Microsoft'

            if (-not $consent) {
                Microsoft.PowerShell.Utility\Write-Warning `
                    'Visual Studio Code installation cancelled by user.'
                return
            }

            # install visual studio code insiders using winget
            Microsoft.WinGet.Client\Install-WinGetPackage `
                -Id 'Microsoft.VisualStudioCode.Insiders' `
                -Mode Silent `
                -Force `
                -Scope SystemOrUnknown

            # refresh search paths after installation
            GenXdev.Helpers\Initialize-SearchPaths

            # install recommended extensions from workspace .vscode/extensions.json
            try {

                Microsoft.PowerShell.Utility\Write-Verbose `
                    ("Installing recommended VSCode extensions from " +
                    "workspace...")

                # check installation consent for extensions
                $extensionConsent = GenXdev.FileSystem\Confirm-InstallationConsent `
                    -ApplicationName 'VSCode Extensions' `
                    -Source 'VSCode Marketplace' `
                    -Description 'Recommended workspace extensions for enhanced development experience' `
                    -Publisher 'Various'

                if (-not $extensionConsent) {
                    Microsoft.PowerShell.Utility\Write-Warning `
                        'VSCode extensions installation cancelled by user.'
                } else {

                # determine workspace folder path
                $workspaceFolder = if ($Global:WorkspaceFolder) {

                    $Global:WorkspaceFolder

                } else {

                    GenXdev.FileSystem\Expand-Path `
                        "$PSScriptRoot\..\..\..\..\..\"
                }

                # build path to extensions configuration file
                $extFile = Microsoft.PowerShell.Management\Join-Path `
                    $workspaceFolder ".vscode/extensions.json"

                # check if extensions configuration file exists
                if (Microsoft.PowerShell.Management\Test-Path `
                    -LiteralPath $extFile) {

                    # read and parse extensions configuration
                    $plugins = Microsoft.PowerShell.Management\Get-Content `
                        -LiteralPath $extFile `
                        -Raw |
                        Microsoft.PowerShell.Utility\ConvertFrom-Json

                    if ($plugins.recommendations) {

                        $i = 0

                        $total = $plugins.recommendations.Count

                        # install each recommended extension
                        foreach ($ext in $plugins.recommendations) {

                            # calculate installation progress percentage
                            $percent = if ($total -gt 0) {

                                [Convert]::ToInt32([Math]::Round(
                                    (100 / $total) * $i, 0))

                            } else {

                                0
                            }

                            # display progress information
                            Microsoft.PowerShell.Utility\Write-Progress `
                                -Id 1 `
                                -Status "Installing VSCode extension $ext" `
                                -PercentComplete $percent `
                                -Activity "VSCode extensions"

                            try {

                                # install extension using vscode command line
                                & code --install-extension $ext --force

                            } catch {

                                Microsoft.PowerShell.Utility\Write-Warning `
                                    "Failed to install VSCode extension: $ext"
                            }

                            $i++
                        }

                        Microsoft.PowerShell.Utility\Write-Host `
                            "VSCode recommended extensions installed."

                    } else {

                        Microsoft.PowerShell.Utility\Write-Host `
                            "No recommended extensions found in $extFile."
                    }

                } else {

                    Microsoft.PowerShell.Utility\Write-Host `
                        "No .vscode/extensions.json found in workspace."
                }

                }

            } catch {

                Microsoft.PowerShell.Utility\Write-Warning $_
            }

            # copy asset files to workspace
            $sourcePath = GenXdev.FileSystem\Expand-Path `
                "$PSScriptRoot\..\..\Assets\"

            $targetPath = GenXdev.FileSystem\Expand-Path `
                "$PSScriptRoot\..\..\..\..\..\"

            # process each asset file in source directory
            GenXdev.FileSystem\Find-Item "$sourcePath\*" `
                -RelativeBasePath $sourcePath |
                Microsoft.PowerShell.Core\ForEach-Object {

                # build source and target file paths
                $sourceFile = GenXdev.FileSystem\Expand-Path `
                    "$sourcePath\$PSItem"

                $targetFile = GenXdev.FileSystem\Expand-Path `
                    ("$targetPath\$PSItem".Replace('.asset.txt', '')) `
                    -CreateDirectory

                # determine if file should be overwritten
                $doOverwrite = ($targetFile -like "\.vscode\tasks.json") -and `
                    (Microsoft.PowerShell.Management\Test-Path `
                    -LiteralPath $targetFile) -and `
                    ([IO.File]::ReadAllText($targetFile) -like `
                    "*-DebugFailedTests*")

                # skip if target file exists and overwrite is not needed
                if ([IO.File]::Exists($targetFile) -and (-not $doOverwrite)) {

                    return
                }

                # copy asset file to target location
                Microsoft.PowerShell.Management\Copy-Item `
                    -LiteralPath $sourceFile `
                    -Destination $targetFile
            }
        }
    }

    end {

    }
}
###############################################################################