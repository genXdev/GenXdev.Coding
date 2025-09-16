<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Get-GenXDevModule.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
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
Retrieves all GenXDev modules from a specified path.

.DESCRIPTION
This function searches through a directory structure for GenXdev modules,
excluding any with '.local' in the name. For each valid module found, it returns
the most recent version folder (1.x) that contains a valid module manifest
(.psd1) file.

.PARAMETER Path
The root directory to search for GenXdev modules. If not specified, defaults to
the parent directory of the script's location.

.EXAMPLE
Get-GenXDevModule -Path "C:\PowerShell\Modules"

.EXAMPLE
Get-GenXDevModule "C:\PowerShell\Modules"
#>
function Get-GenXDevModule {

    [CmdletBinding()]

    param(
        ########################################################################
        [Alias('RootPath', 'FullPath')]
        [parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'The root path to search for GenXdev modules'
        )]
        [string] $Path
    )

    begin {

        # if no path provided, navigate up 4 levels from script location
        if (-not $Path) {
            $Path = (Microsoft.PowerShell.Management\Get-Item -LiteralPath $PSScriptRoot).Parent.Parent.Parent.Parent.FullName
        }

        # log the path being searched
        Microsoft.PowerShell.Utility\Write-Verbose "Searching for GenXdev modules in: $Path"
    }


    process {

        # enumerate all directories starting with 'GenXdev'
        Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath  $Path -Filter "GenXdev*" -Directory |
            Microsoft.PowerShell.Core\ForEach-Object {

                # store module information for processing
                $moduleName = $_.Name
                $moduleRootPath = $_.FullName

                # skip modules containing '.local' in their name
                if ($moduleName.ToLowerInvariant().Contains('.local')) {
                    Microsoft.PowerShell.Utility\Write-Verbose "Skipping local module: $moduleName"
                    return
                }

                # find the highest numbered 1.x version directory with valid psd1
                Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath  $moduleRootPath -Filter "1.*" -Directory |
                    Microsoft.PowerShell.Utility\Sort-Object -Property Name -Descending |
                    Microsoft.PowerShell.Utility\Select-Object -First 1 |
                    Microsoft.PowerShell.Core\ForEach-Object {

                        # verify existence of module manifest
                        if (Microsoft.PowerShell.Management\Test-Path -LiteralPath  "$($_.FullName)\$moduleName.psd1") {

                            Microsoft.PowerShell.Utility\Write-Verbose "Found valid module: $moduleName in $($_.FullName)"
                            $_
                        }
                    }
                }
    }

    end {
    }
}