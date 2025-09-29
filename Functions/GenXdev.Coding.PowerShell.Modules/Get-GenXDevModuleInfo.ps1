<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Get-GenXDevModuleInfo.ps1
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
                        ) -and [IO.File]::Exists(
                            "$($currentModule.FullName)\license.txt"
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
                ) -and [IO.File]::Exists(
                    "$($currentModule.FullName)\license.txt"
                )
            }
        }
    }

    end {
    }
}