################################################################################
<#
.SYNOPSIS
Retrieves GenXDev modules in dependency order.

.DESCRIPTION
This function returns a list of GenXDev modules arranged in the correct dependency
order to ensure proper module loading. The modules can be filtered by name.

.PARAMETER ModuleName
Specifies one or more module names to filter the results. If not provided, all
modules are returned in their dependency order.

.EXAMPLE
Get-GenXDevNewModulesByDependencies -ModuleName "GenXdev.Helpers"

.EXAMPLE
Get-GenXDevNewModulesByDependencies GenXdev.Console, GenXdev.Windows
#>
function Get-GenXDevNewModulesByDependencies {

    [CmdletBinding()]

    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "One or more module names to filter by"
        )]
        [string[]] $ModuleName = @()
    )

    begin {
        # get all available genxdev module information
        Write-Verbose "Retrieving GenXDev module information..."
        $Modules = Get-GenXDevModuleInfo
    }

    process {

        # create a new array list to store modules in dependency order
        [System.Collections.ArrayList] $results = @()

        # helper function to find a module by its name
        function findModule($ModuleName) {

            $Modules | Where-Object -Property "ModuleName" -EQ $ModuleName
        }

        # add modules in their correct dependency order
        Write-Verbose "Adding modules in dependency order..."
        $null = $results.Add((findModule GenXdev.Helpers))
        $null = $results.Add((findModule GenXdev.FileSystem))
        $null = $results.Add((findModule GenXdev.Data))
        $null = $results.Add((findModule GenXdev.Windows))
        $null = $results.Add((findModule GenXdev.Webbrowser))
        $null = $results.Add((findModule GenXdev.Queries))
        $null = $results.Add((findModule GenXdev.Console))
        $null = $results.Add((findModule GenXdev.Coding))
        $null = $results.Add((findModule GenXdev.AI))
        $null = $results.Add((findModule GenXdev))

        # return the results array containing modules in dependency order
        Write-Verbose "Returning $($results.Count) modules"
        $results
    }

    end {
    }
}
################################################################################
