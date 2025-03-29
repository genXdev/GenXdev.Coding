function Assert-GenXdevDependencyUsage {

    [CmdletBinding()]
    [Alias("checkgenxdevdependencies")]
    param(
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Filter to apply to module names"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("Module", "ModuleName")]
        [ValidatePattern("^(GenXdev|GenXde[v]\*|GenXdev(\.\w+)+)+$")]
        [string[]] $BaseModuleName = @("GenXdev*"),

        [Parameter(Mandatory = $false)]
        [switch] $FromScripts
    )

    begin {

        $dependencies = @(GenXdev.Coding\Get-GenXDevNewModulesInOrderOfDependency | Microsoft.PowerShell.Core\ForEach-Object ModuleName) + @("GenXdev.Local")
    }


process {
    # temperary disabled
    return;
    
        GenXdev.Helpers\Invoke-OnEachGenXdevModule -BaseModuleName:$BaseModuleName -FromScripts:$FromScripts -OnlyPublished -NoLocal -ScriptBlock {

            param($module)

            $ModuleName = $module.Name;
            $ModuleManifestPath = GenXdev.FileSystem\Expand-Path ".\$ModuleName.psd1"
            $ModuleManifest = Microsoft.PowerShell.Utility\Import-PowerShellDataFile -Path $ModuleManifestPath

            $index = $dependencies.IndexOf($ModuleName)

            if ($index -lt 0) {

                Microsoft.PowerShell.Utility\Write-Error "Module $ModuleName not found in dependencies list"
                return
            }

            for ($i = $index+1; $i -lt $dependencies.Count; $i++) {

                $dependency = $dependencies[$i]

                if ($null -ne $dependency.ModuleName) {

                    $dependency = $dependency.ModuleName
                }

                Microsoft.PowerShell.Utility\Write-Verbose "Checking if $ModuleName references $dependency"

                $references = GenXdev.FileSystem\Find-Item -PassThru -SearchMask ".\*.ps1" -Pattern "$([System.Text.RegularExpressions.Regex]::Escape($dependency))\\" -ErrorAction "SilentlyContinue" | Microsoft.PowerShell.Core\ForEach-Object FullName

                if ($references) {

                    if ($references -like "*.Tests.ps1") {

                        continue
                    }

                    $references | Microsoft.PowerShell.Core\ForEach-Object {

                        [string] $content = [IO.File]::ReadAllText($_)

                        if ($content.Contains("Install-Module $dependency") -or $content.Contains("GenXdev.Local\KeyValueStores") -or
                            $content.Contains("`"`$PSScriptRoot\..\..\..\..\GenXdev.Local\")) {

                            return
                        }

                        Microsoft.PowerShell.Utility\Write-Error "Module $ModuleName references $dependency in file $_"
                    }
                }
            }

            for ($i = 0; $i -lt $index; $i++) {

                $dependency = $dependencies[$i]

                if ($null -ne $dependency.ModuleName) {

                    $dependency = $dependency.ModuleName
                }

                Microsoft.PowerShell.Utility\Write-Verbose "Checking if $ModuleName references $dependency"

                $references = GenXdev.FileSystem\Find-Item -PassThru -SearchMask ".\*.ps1" -Pattern "$([System.Text.RegularExpressions.Regex]::Escape($dependency))\\" -ErrorAction "SilentlyContinue"  | Microsoft.PowerShell.Core\ForEach-Object FullName

                if ($references) {

                    if ($references -like "*.Tests.ps1") {

                        continue
                    }

                    $references | Microsoft.PowerShell.Core\ForEach-Object {

                        $hasDependency = ($dependency -eq $ModuleName) -or (@($ModuleManifest.RequiredModules.ModuleName | Microsoft.PowerShell.Core\Where-Object { $_ -like $dependency }).Count -gt 0);

                        if (-not $hasDependency) {

                            if ([IO.File]::ReadAllText($_).Contains("Install-Module $dependency")) {

                                Microsoft.PowerShell.Utility\Write-Verbose "Module $ModuleName references $dependency in file, but has Install-Module $dependency in file. File: $_"
                                return
                            }

                            Microsoft.PowerShell.Utility\Write-Error "Module $ModuleName references $dependency in file, but has module $dependency not listed in RequiredModules of $ModuleManifestPath. File: $_"
                        }
                    }
                }
            }
        }
    }
}