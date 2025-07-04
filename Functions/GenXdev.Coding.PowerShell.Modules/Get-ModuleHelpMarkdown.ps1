###############################################################################
<#
.SYNOPSIS
Generates markdown help documentation for specified GenXDev modules.

.DESCRIPTION
This function generates markdown help documentation for specified GenXDev modules
and their cmdlets. It processes each module and cmdlet, formatting the help
content into markdown with proper sections and code blocks. The output includes
syntax highlighting for PowerShell code blocks and proper formatting for
different help sections.

.PARAMETER ModuleName
Specifies the name(s) of the module(s) to generate help for. Accepts wildcards.
If not specified, defaults to "GenXdev.*". Can be provided via pipeline.

.PARAMETER CommandNames
Optional array of cmdlet names to filter which commands to generate help for.
If not specified, documentation will be generated for all cmdlets in the module.
Supports wildcard patterns like "Get-*".

.EXAMPLE
Get-ModuleHelpMarkdown -ModuleName "GenXdev.Helpers" -CommandNames "Get-*"
Generates markdown documentation for all Get-* cmdlets in GenXdev.Helpers.

.EXAMPLE
"GenXdev.Helpers" | Get-GenXDevModuleHelp
Uses pipeline to generate documentation for all cmdlets in GenXdev.Helpers.
        ###############################################################################>
function Get-ModuleHelpMarkdown {

    [CmdletBinding()]
    [Alias("Get-GenXDevModuleHelp")]

    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name(s) of the module(s) to generate help for"
        )]
        [SupportsWildcards()]
        [string[]] $ModuleName = "GenXdev.*",

        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Optional cmdlet names to filter which to document"
        )]
        [SupportsWildcards()]
        [string[]] $CommandNames = @()
        ########################################################################
    )

    begin {

        # retrieve and sort all cmdlets from specified modules
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving cmdlets from modules: $($ModuleName -join ',')"
        $modules = $ModuleName | Microsoft.PowerShell.Core\ForEach-Object {

            # normalize module names by adding GenXdev prefix if not present
            $name = "GenXdev." + $PSItem.Replace("GenXdev.", "")

            # get all matching modules including their nested modules
            Microsoft.PowerShell.Core\Get-Module "$($name.TrimEnd("*"))*" -All |
            Microsoft.PowerShell.Core\ForEach-Object {
                $module = $PSItem
                $module.NestedModules | Microsoft.PowerShell.Core\ForEach-Object { $_ }
                $module
            }
        } |
        Microsoft.PowerShell.Utility\Select-Object -Unique |
        Microsoft.PowerShell.Utility\Sort-Object { $_.Name.Length.ToString().PadLeft(4, '0') + "_" + $_.Name } | Microsoft.PowerShell.Core\ForEach-Object {

            GenXdev.Helpers\Get-GenXDevCmdlets -ModuleName ($_.Name) | Microsoft.PowerShell.Core\ForEach-Object { $_ }
        }
    }


    process {

        # initialize tracking variables for module processing
        $lastModule = ""

        foreach ($current in $modules) {

            # emit section header when switching to a new module
            if (($lastModule -eq "") -or ($lastModule -ne $current.ModuleName)) {

                Microsoft.PowerShell.Utility\Write-Verbose "Processing module: $($current.ModuleName)"
                "`r`n&nbsp;<hr/>`r`n###`t$($current.ModuleName)<hr/>"
            }

            # track current module name
            $lastModule = $current.ModuleName

            # filter cmdlets if specific command names were requested
            if ($CommandNames.Length -gt 0) {
                $found = $false

                foreach ($cn in $CommandNames) {
                    if ($current.Name -like $cn) {
                        $found = $true
                        break
                    }
                }

                if (!$found) {
                    continue
                }
            }

            # process current cmdlet
            $CmdletName = $current.Name
            if ($CmdletName -like "*EnsureTypes*") {
                return;
            }
            Microsoft.PowerShell.Utility\Write-Verbose "Generating help for cmdlet: $CmdletName"

            # retrieve full help content
            $lines = ""
            try {
                $lines = (Microsoft.PowerShell.Core\Get-Help $CmdletName -Full)
            }
            catch {
                throw "Could not get help for command $CmdletName -> $PSItem"
            }

            # initialize state tracking for help content processing
            $inPowerShell = $false
            [bool] $hide = $false
            $lineBuffer = ""
            $inName = $false

            # process each line of help content
            foreach ($line in $lines) {
                # normalize line endings and tabs
                $line = $line | Microsoft.PowerShell.Utility\Out-String;
                $line = $line.trim("`r`n").Replace("`t", "    ")

                if ($line.Trim().Length -gt 0) {
                    # handling section headers
                    if ($line[0] -ne " ") {
                        $section = $line
                        $wasInPowerShell = $inPowerShell
                        $hide = $false
                        $inName = $false

                        # process different help sections
                        switch ($section) {
                            "NAME" {
                                $inName = $true
                                $inPowerShell = $true

                                # get and format aliases
                                $aliases = ((Microsoft.PowerShell.Utility\Get-Alias -Definition $CmdletName `
                                            -ErrorAction SilentlyContinue |
                                        Microsoft.PowerShell.Core\ForEach-Object name) -join ", ").Trim()

                                if (![string]::IsNullOrWhiteSpace($aliases)) {
                                    $linebuffer = $aliases
                                }
                                break
                            }
                            "SYNOPSIS" { $inPowerShell = $false; break }
                            "SYNTAX" { $inPowerShell = $true; break }
                            "DESCRIPTION" { $inPowerShell = $false; break }
                            "PARAMETERS" { $inPowerShell = $false; break }
                            "NOTES" { $inPowerShell = $true; break }
                            default {
                                $inPowerShell = $false
                                $hide = $true
                                break
                            }
                        }

                        # handle transitions between powershell and regular text
                        if ($wasInPowerShell) {
                            GenXdev.Helpers\alignScript $lineBuffer.Trim("`r`n".ToCharArray()) 0
                            $lineBuffer = ""
                            "````````"
                        }

                        if (!$hide) {
                            if ($inName) {
                                "`r`n##`t$CmdletName"
                            }
                            else {
                                "`r`n### $section"
                            }
                        }

                        if ($inPowerShell) {
                            "````````PowerShell"
                        }
                    }
                    else {
                        # handle content lines
                        if (!$hide) {
                            if ($inName) {
                                if (![string]::IsNullOrWhiteSpace($lineBuffer)) {
                                    $line = $line.PadRight(40, " ") +
                                    " --> $lineBuffer"
                                }

                                $lineBuffer = ""
                                $inName = $false
                            }

                            # normalize text content
                            $line = $line.Replace("PS > ", "PS C:\> ").Replace("PS C:\>", "PS C:\> ").Replace("PS C:\>  ", "PS C:\> ").Replace("Don't", "Do not").Replace("don't", "do not").Replace("isn't", "is not").Replace("asn't", "as not").Replace("(https://go", "    (https://go").Replace("PS D:\Downloads>", "PS D:\Downloads> ").Replace("PS D:\Downloads>  ", "PS D:\Downloads> ").Replace("It's", "It is")

                            if ($inPowerShell) {

                                if (![string]::IsNullOrWhiteSpace($line)) {

                                    $lineBuffer = "$lineBuffer `r`n$($line.Replace("`r`n", " `r`n")) ".Trim("`r`n".ToCharArray())
                                }
                            }
                            else {
                                $line = $line.Trim("`r`n".ToCharArray())
                                if (![string]::IsNullOrWhiteSpace($line)) {
                                    "$(($line.Replace("`r`n", " `r`n"))) "
                                }
                            }
                        }
                    }
                }

                $line
            }

            # add section separator after cmdlet documentation
            "`r`n<br/><hr/><hr/><br/>`r`n"
        }
    }

    end {
    }
}
        ###############################################################################