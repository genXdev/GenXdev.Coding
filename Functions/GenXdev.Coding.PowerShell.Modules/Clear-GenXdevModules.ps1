<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Clear-GenXdevModules.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.290.2025
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
                    Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath .\ -Filter "*.*.*" -dir | Microsoft.PowerShell.Core\Where-Object { $_.Name -ne '1.290.2025' } |
                        Microsoft.PowerShell.Core\ForEach-Object {
                            Microsoft.PowerShell.Utility\Write-Verbose "Removing older version: $($_.Name)"
                            GenXdev.FileSystem\Remove-AllItems $_.FullName -DeleteFolder
                        }

                        # enter version-specific subdirectory
                        Microsoft.PowerShell.Utility\Write-Verbose 'Processing version directory 1.290.2025'
                        Microsoft.PowerShell.Management\Set-Location -LiteralPath .\1.290.2025

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