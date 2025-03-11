################################################################################
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
            HelpMessage = "Names of modules to analyze"
        )]
        [Alias("Name", "Module")]
        [string[]] $ModuleName = @()
        ########################################################################
    )

    begin {
        # get all available genxdev modules
        Write-Verbose "Retrieving all available GenXdev modules"
        [System.IO.FileSystemInfo[]] $AllModules = @(Get-GenXDevModule)
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
                    Write-Verbose "Processing config file: $configPath"

                    # read and parse module configuration
                    $configText = [IO.File]::ReadAllText($configPath)
                    $config = Invoke-Expression -Command ($configText)

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
            Write-Verbose "Processing module: $currentModuleName"

            # construct path to module configuration file
            $configPath = "$($currentModule.FullName)\$currentModuleName.psd1"

            # read and parse module configuration
            $configText = [IO.File]::ReadAllText($configPath)
            $config = Invoke-Expression -Command ($configText)

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
################################################################################
