<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Get-GenXDevNewModulesInOrderOfDependency.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
        [parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'One or more module names to filter by'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Module', 'BaseModuleName', 'SubModuleName')]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.[\w\*\[\]\?]*)+)+$')]
        [SupportsWildcards()]
        [string[]] $ModuleName = @('GenXdev*')
        ########################################################################
    )

    begin {

        # retrieve all available genxdev module information for processing
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving GenXDev module information...'
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
                Microsoft.PowerShell.Core\Where-Object -Property 'ModuleName' -EQ $requested
        }

        # add modules in dependency order starting with core dependencies
        Microsoft.PowerShell.Utility\Write-Verbose 'Adding modules in dependency order...'
        $ModuleObj = findModule GenXdev.FileSystem
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Helpers
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Data
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Windows
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Webbrowser
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Console
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Queries
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.AI
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Coding
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev.Media
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        $ModuleObj = findModule GenXdev
        if ($ModuleObj) { $null = $results.Add($ModuleObj) }

        # return modules in their proper dependency order
        Microsoft.PowerShell.Utility\Write-Verbose "Returning $($results.Count) modules"
        $results
    }

    end {
    }
}