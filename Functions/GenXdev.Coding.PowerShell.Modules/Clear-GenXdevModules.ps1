###############################################################################
<#
    .SYNOPSIS
    Cleans build artifacts from GenXdev PowerShell modules.

    .DESCRIPTION
    Removes build directories and artifacts from all GenXdev PowerShell modules in
    the user's PowerShell Modules directory. Cleans both module root directories and
    version-specific subdirectories, removing bin, obj, trash and other build
    artifacts.

    .EXAMPLE
    .\clean-genxdev-modules.ps1 -Verbose
    #>
###############################################################################

function Clear-GenXdevModules {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', 'Clear-GenXdevModules')]
    [Alias('cleangenxdev')]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting cleanup of GenXdev module build artifacts'
    }

    process {

        # enumerate all genxdev module directories in powershell modules path
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving all GenXdev module directories'
        Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath "$PSScriptRoot\..\..\..\..\..\Modules" -Filter  "genxdev*" -dir |
            Microsoft.PowerShell.Core\ForEach-Object {

                # store current location to return to later
                Microsoft.PowerShell.Management\Push-Location

                try {
                    # enter the module directory for processing
                    Microsoft.PowerShell.Utility\Write-Verbose ('Processing module directory: ' +
                        "$($PSItem.FullName)")
                    Microsoft.PowerShell.Management\Set-Location -LiteralPath $PSItem.FullName

                    # remove build artifacts from module root level
                    Microsoft.PowerShell.Utility\Write-Verbose 'Cleaning root level build directories'
                    GenXdev.FileSystem\Remove-AllItems .\bin -DeleteFolder
                    GenXdev.FileSystem\Remove-AllItems .\obj -DeleteFolder
                    GenXdev.FileSystem\Remove-AllItems .\trash -DeleteFolder

                    # remove older versions
                    Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath .\ -Filter "*.*.*" -dir | Microsoft.PowerShell.Core\Where-Object { $_.Name -ne '1.258.2025' } |
                        Microsoft.PowerShell.Core\ForEach-Object {
                            Microsoft.PowerShell.Utility\Write-Verbose "Removing older version: $($_.Name)"
                            GenXdev.FileSystem\Remove-AllItems $_.FullName -DeleteFolder
                        }

                        # enter version-specific subdirectory
                        Microsoft.PowerShell.Utility\Write-Verbose 'Processing version directory 1.258.2025'
                        Microsoft.PowerShell.Management\Set-Location -LiteralPath .\1.258.2025

                        # remove build artifacts from version-specific directory
                        Microsoft.PowerShell.Utility\Write-Verbose 'Cleaning version-specific build directories'
                        GenXdev.FileSystem\Remove-AllItems .\bin -DeleteFolder
                        GenXdev.FileSystem\Remove-AllItems .\obj -DeleteFolder
                        GenXdev.FileSystem\Remove-AllItems .\net9.0-windows -DeleteFolder
                    }
                    finally {
                        # restore original location regardless of errors
                        Microsoft.PowerShell.Management\Pop-Location
                    }
                }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose 'Module cleanup completed successfully'
    }
    ################################################################################
}