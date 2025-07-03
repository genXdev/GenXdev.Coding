###############################################################################
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
        ###############################################################################>
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
        [string[]] $ModuleName = @('GenXdev*')
        ########################################################################
    )

    begin {

        # retrieve all available genxdev module information for processing
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving GenXDev module information..."
        $Modules = GenXdev.Coding\Get-GenXDevModuleInfo
    }

    process {

        # create a new array list to store modules in their dependency order
        [System.Collections.Generic.List[object]] $results = @()

        # helper function to find a module by name in the modules collection
        function findModule($requested) {

            $found = $false;
            foreach ($m in $ModuleName) {
                if ($requested -like "*$($m)*") {
                    $found = $true
                    break;
                }
            }

            if (-not $found) {
                return $null
            }

            $Modules |
            Microsoft.PowerShell.Core\Where-Object -Property "ModuleName" -EQ $requested
        }

        # add modules in dependency order starting with core dependencies
        Microsoft.PowerShell.Utility\Write-Verbose "Adding modules in dependency order..."
        $module = findModule GenXdev.FileSystem
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Helpers
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Data
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Windows
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Webbrowser
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Console
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Queries
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.AI
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev.Coding
        if ($module) { $null = $results.Add($module) }

        $module = findModule GenXdev
        if ($module) { $null = $results.Add($module) }

        # return modules in their proper dependency order
        Microsoft.PowerShell.Utility\Write-Verbose "Returning $($results.Count) modules"
        $results
    }

    end {
    }
}
        ###############################################################################