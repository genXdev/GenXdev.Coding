<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Get-GenXDevModuleInfo.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
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
###############################################################################
<#
.SYNOPSIS
Retrieves detailed information about GenXdev PowerShell modules.

.DESCRIPTION
This function examines GenXdev PowerShell modules and returns information about
their configuration, versions, and presence of key files. It can process either
specified modules or all available modules.

.PARAMETER ModuleName
Array of module names to analyze. If empty, processes all available modules.
GenXdev.Local module is explicitly blocked from processing.

.EXAMPLE
Get-GenXDevModuleInfo -ModuleName "GenXdev.Console"

.EXAMPLE
"GenXdev.Console" | Get-GenXDevModuleInfo
#>
function Get-GenXDevModuleInfo {

    [CmdletBinding()]

    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Names of modules to analyze'
        )]
        [Alias('Name', 'Module')]
        [string[]] $ModuleName = @()
        ########################################################################
    )

    begin {
        # get all available genxdev modules
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving all available GenXdev modules'
        [System.IO.FileSystemInfo[]] $AllModules = @(GenXdev.Coding\Get-GenXDevModule)
    }


    process {

        # process specified modules if any were provided
        if ($ModuleName.Count -gt 0) {

            foreach ($currentModuleName in $ModuleName) {

                foreach ($currentModule in $AllModules) {

                    # skip if module name doesn't match
                    if ($currentModule.Parent.Name -ne $currentModuleName) {

                        continue
                    }

                    # construct path to module configuration file
                    $configPath = "$($currentModule.FullName)\$currentModuleName.psd1"
                    Microsoft.PowerShell.Utility\Write-Verbose "Processing config file: $configPath"

                    # read and parse module configuration
                    $configText = [IO.File]::ReadAllText($configPath)
                    $config = Microsoft.PowerShell.Utility\Invoke-Expression -Command ($configText)

                    # calculate current and new version numbers
                    $currentVersion = [Version]::new($config.ModuleVersion)
                    $newVersion = [Version]::new(
                        $currentVersion.Major,
                        $currentVersion.Minor + 2,
                        $currentVersion.Build
                    ).ToString()

                    # return module information hashtable
                    @{
                        ModulePath     = $currentModule.FullName
                        ModuleName     = $currentModuleName
                        ConfigPath     = $configPath
                        ConfigText     = $configText
                        Config         = $config
                        CurrentVersion = $currentVersion
                        NewVersion     = $newVersion
                        HasREADME      = [IO.File]::Exists(
                            "$($currentModule.FullName)\README.md"
                        )
                        HasLICENSE     = [IO.File]::Exists(
                            "$($currentModule.FullName)\LICENSE"
                        )
                    }
                }
            }
            return
        }

        # process all modules if no specific modules were requested
        foreach ($currentModule in $AllModules) {

            $currentModuleName = $currentModule.Parent.Name
            Microsoft.PowerShell.Utility\Write-Verbose "Processing module: $currentModuleName"

            # construct path to module configuration file
            $configPath = "$($currentModule.FullName)\$currentModuleName.psd1"

            # read and parse module configuration
            $configText = [IO.File]::ReadAllText($configPath)
            $config = Microsoft.PowerShell.Utility\Invoke-Expression -Command ($configText)

            # calculate current and new version numbers
            $currentVersion = [Version]::new($config.ModuleVersion)
            $newVersion = [Version]::new(
                $currentVersion.Major,
                $currentVersion.Minor + 1,
                $currentVersion.Build
            ).ToString()

            # return module information hashtable
            @{
                ModulePath     = $currentModule.FullName
                ModuleName     = $currentModuleName
                ConfigPath     = $configPath
                ConfigText     = $configText
                Config         = $config
                CurrentVersion = $currentVersion
                NewVersion     = $newVersion
                HasREADME      = [IO.File]::Exists(
                    "$($currentModule.FullName)\README.md"
                )
                HasLICENSE     = [IO.File]::Exists(
                    "$($currentModule.FullName)\LICENSE"
                )
            }
        }
    }

    end {
    }
}