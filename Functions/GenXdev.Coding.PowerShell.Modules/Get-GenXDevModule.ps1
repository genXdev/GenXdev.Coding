################################################################################
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
        [Alias("RootPath", "FullPath")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The root path to search for GenXdev modules"
        )]
        [string] $Path
    )

    begin {

        # if no path provided, navigate up 4 levels from script location
        if (-not $Path) {
            $Path = (Get-Item $PSScriptRoot).Parent.Parent.Parent.Parent.FullName
        }

        # log the path being searched
        Write-Verbose "Searching for GenXdev modules in: $Path"
    }

    process {

        # enumerate all directories starting with 'GenXdev'
        Get-ChildItem -Path "$Path\GenXdev*" -Directory |
        ForEach-Object {

            # store module information for processing
            $moduleName = $_.Name
            $moduleRootPath = $_.FullName

            # skip modules containing '.local' in their name
            if ($moduleName.ToLowerInvariant().Contains('.local')) {
                Write-Verbose "Skipping local module: $moduleName"
                return
            }

            # find the highest numbered 1.x version directory with valid psd1
            Get-ChildItem -Path "$moduleRootPath\1.*" -Directory |
            Sort-Object -Property Name -Descending |
            Select-Object -First 1 |
            ForEach-Object {

                # verify existence of module manifest
                if (Test-Path -Path "$($_.FullName)\$moduleName.psd1") {
                    
                    Write-Verbose "Found valid module: $moduleName in $($_.FullName)"
                    $_
                }
            }
        }
    }

    end {
    }
}
################################################################################
