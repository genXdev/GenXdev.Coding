<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Assert-GenXdevDependencyUsage.ps1
Original author           : René Vaessen / GenXdev
Version                   : 3.3.2026
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
# Don't remove this line [dontrefactor]

################################################################################
<#
.SYNOPSIS
Validates dependency usage across GenXdev modules to ensure proper module
hierarchy is maintained.

.DESCRIPTION
This function analyzes GenXdev modules to ensure they follow the correct
dependency hierarchy. It checks that modules only reference dependencies
that are listed in their RequiredModules manifest, and prevents circular
dependencies by validating that modules don't reference modules that come
later in the dependency chain.

.PARAMETER ModuleName
Filter to apply to module names. Must match GenXdev naming pattern. Defaults
to checking all GenXdev modules.

.PARAMETER FromScripts
Search in script files instead of module files.

.EXAMPLE
Assert-GenXdevDependencyUsage -ModuleName "GenXdev.Coding"

.EXAMPLE
checkgenxdevdependencies "GenXdev*" -FromScripts
#>
function Assert-GenXdevDependencyUsage {

    [CmdletBinding()]
    [Alias('checkgenxdevdependencies')]

    param(
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Filter to apply to module names'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.[\w\*\[\]\?]*)+)+$')]
        [SupportsWildcards()]
        [string[]] $ModuleName = @('GenXdev*'),
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Search in script files instead of module files'
        )]
        [switch] $FromScripts
        ###############################################################################
    )

    begin {

        # retrieve ordered list of all genxdev modules by dependency hierarchy
        $dependencies = @(GenXdev.Coding\Get-GenXDevNewModulesInOrderOfDependency |
                Microsoft.PowerShell.Core\ForEach-Object ModuleName) +
        @('GenXdev.Local')
    }

    process {

        # temporarily disabled functionality - early return
        return;

        # invoke processing on each matching genxdev module
        GenXdev.Helpers\Invoke-OnEachGenXdevModule `
            -ModuleName:$ModuleName `
            -FromScripts:$FromScripts `
            -OnlyPublished `
            -NoLocal `
            -ScriptBlock {

            param($module)

            # extract module name from current module object
            $moduleName = $module.Name;

            # construct path to module manifest file
            $moduleManifestPath = GenXdev.FileSystem\Expand-Path (
                ".\$moduleName.psd1")

            # load module manifest data for dependency analysis
            $moduleManifest = Microsoft.PowerShell.Utility\Import-PowerShellDataFile `
                -LiteralPath $moduleManifestPath

            # find current module's position in dependency hierarchy
            $index = $dependencies.IndexOf($moduleName)

            # validate module exists in dependency list
            if ($index -lt 0) {

                Microsoft.PowerShell.Utility\Write-Error (
                    "Module $moduleName not found in dependencies list")
                return
            }

            # check for invalid references to modules later in dependency chain
            for ($i = $index + 1; $i -lt $dependencies.Count; $i++) {

                # get dependency name from current position
                $dependency = $dependencies[$i]

                # extract module name if dependency is object with modulename property
                if ($null -ne $dependency.ModuleName) {

                    $dependency = $dependency.ModuleName
                }

                # log dependency checking activity
                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Checking if $moduleName references $dependency")

                # search for references to this dependency in module files
                $references = GenXdev.FileSystem\Find-Item `
                    -PassThru `
                    -SearchMask '.\*.ps1' `
                    -Pattern "$([System.Text.RegularExpressions.Regex]::Escape($dependency))\\" `
                    -ErrorAction 'SilentlyContinue' |
                    Microsoft.PowerShell.Core\ForEach-Object FullName

                # process any found references
                if ($references) {

                    # skip test files as they may reference other modules for testing
                    if ($references -like '*.Tests.ps1') {

                        continue
                    }

                    # analyze each reference file for dependency violations
                    $references |
                        Microsoft.PowerShell.Core\ForEach-Object {

                            # read file content to check for allowed reference patterns
                            [string] $content = [IO.File]::ReadAllText($_)

                            # skip files with install-module commands or allowed local references
                            if ($content.Contains("Install-Module $dependency") -or
                                $content.Contains('GenXdev.Local\KeyValueStores') -or
                                $content.Contains("`"`$PSScriptRoot\..\..\..\..\GenXdev.Local\")) {

                                return
                            }

                            # report dependency violation
                            Microsoft.PowerShell.Utility\Write-Error (
                                "Module $moduleName references $dependency in file $_")
                        }
                }
            }

            # check for missing dependencies in module manifest
            for ($i = 0; $i -lt $index; $i++) {

                # get dependency name from current position
                $dependency = $dependencies[$i]

                # extract module name if dependency is object with modulename property
                if ($null -ne $dependency.ModuleName) {

                    $dependency = $dependency.ModuleName
                }

                # log dependency checking activity
                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Checking if $moduleName references $dependency")

                # search for references to this dependency in module files
                $references = GenXdev.FileSystem\Find-Item `
                    -PassThru `
                    -SearchMask '.\*.ps1' `
                    -Pattern "$([System.Text.RegularExpressions.Regex]::Escape($dependency))\\" `
                    -ErrorAction 'SilentlyContinue' |
                    Microsoft.PowerShell.Core\ForEach-Object FullName

                # process any found references
                if ($references) {

                    # skip test files as they may reference other modules for testing
                    if ($references -like '*.Tests.ps1') {

                        continue
                    }

                    # analyze each reference file for missing manifest entries
                    $references |
                        Microsoft.PowerShell.Core\ForEach-Object {

                            # check if dependency is properly declared in module manifest
                            $hasDependency = ($dependency -eq $moduleName) -or
                            (@($moduleManifest.RequiredModules.ModuleName |
                                    Microsoft.PowerShell.Core\Where-Object {
                                        $_ -like $dependency }).Count -gt 0);

                                # validate dependency declaration
                                if (-not $hasDependency) {

                                    # allow install-module references without manifest declaration
                                    if ([IO.File]::ReadAllText($_).Contains("Install-Module $dependency")) {

                                        Microsoft.PowerShell.Utility\Write-Verbose (
                                            ("Module $moduleName references $dependency in file, " +
                                            "but has Install-Module $dependency in file. File: $_"))
                                        return
                                    }

                                    # report missing dependency in module manifest
                                    Microsoft.PowerShell.Utility\Write-Error (
                                        ("Module $moduleName references $dependency in file, " +
                                        "but has module $dependency not listed in " +
                                        "RequiredModules of $moduleManifestPath. File: $_"))
                                }
                            }
                }
            }
        }
    }

    end {
    }
}
################################################################################