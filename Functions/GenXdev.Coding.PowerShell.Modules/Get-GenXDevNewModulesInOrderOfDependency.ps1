################################################################################
<#
.SYNOPSIS
Retrieves GenXDev modules in dependency order.

.DESCRIPTION
This function returns a list of GenXDev modules arranged in the correct dependency
order to ensure proper module loading. It first retrieves all module information
and then orders them based on their dependencies, starting with core modules and
ending with dependent modules. This ensures modules are loaded in the correct
sequence.

.PARAMETER ModuleName
One or more module names to filter the results. If not provided, all modules are
returned in their dependency order. The function will maintain the correct
dependency chain even when filtering specific modules.

.EXAMPLE
Get-GenXDevNewModulesInOrderOfDependency -ModuleName "GenXdev.Helpers"

.EXAMPLE
"GenXdev.Console" | Get-GenXDevNewModulesInOrderOfDependency
#>
function Get-GenXDevNewModulesInOrderOfDependency {

    [CmdletBinding()]
    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "One or more module names to filter by"
        )]
        [string[]] $ModuleName = @()
        ########################################################################
    )

    begin {

        # retrieve all available genxdev module information for processing
        Write-Verbose "Retrieving GenXDev module information..."
        $Modules = Get-GenXDevModuleInfo
    }

    process {

        # create a new array list to store modules in their dependency order
        [System.Collections.ArrayList] $results = @()

        # helper function to find a module by name in the modules collection
        function findModule($ModuleName) {

            $Modules |
            Where-Object -Property "ModuleName" -EQ $ModuleName
        }

        # add modules in dependency order starting with core dependencies
        Write-Verbose "Adding modules in dependency order..."
        $null = $results.Add((findModule GenXdev.FileSystem))
        $null = $results.Add((findModule GenXdev.Helpers))
        $null = $results.Add((findModule GenXdev.Data))
        $null = $results.Add((findModule GenXdev.Windows))
        $null = $results.Add((findModule GenXdev.Webbrowser))
        $null = $results.Add((findModule GenXdev.Queries))
        $null = $results.Add((findModule GenXdev.Console))
        $null = $results.Add((findModule GenXdev.AI))
        $null = $results.Add((findModule GenXdev.Coding))
        $null = $results.Add((findModule GenXdev))

        # return modules in their proper dependency order
        Write-Verbose "Returning $($results.Count) modules"
        $results
    }

    end {
    }
}
################################################################################