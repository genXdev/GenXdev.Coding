################################################################################
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
If not specified, defaults to "GenXdev.*".

.PARAMETER CommandNames
Optional array of cmdlet names to filter which commands to generate help for.
If not specified, documentation will be generated for all cmdlets in the module.

.EXAMPLE
Get-ModuleHelpMarkdown -ModuleName "GenXdev.Helpers" -CommandNames "Get-*"

.EXAMPLE
Get-GenXDevModuleHelp GenXdev.Helpers
#>
function Get-ModuleHelpMarkdown {

    [CmdletBinding()]
    [Alias("Get-GenXDevModuleHelp")]

    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
            Mandatory = $false,
            Position = 0,
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
    )

    begin {
        # retrieve and sort all cmdlets from specified modules
        Write-Verbose "Retrieving cmdlets from modules: $($ModuleName -join ',')"
        $modules = $ModuleName | ForEach-Object {

            # normalize module names by adding GenXdev prefix if not present
            $name = "GenXdev." + $PSItem.Replace("GenXdev.", "")

            # get all matching modules including their nested modules
            Get-Module "$($name.TrimEnd("*"))*" -All |
            ForEach-Object {
                $module = $PSItem
                $module.NestedModules | ForEach-Object { $_ }
                $module
            }
        } |
        Select-Object -Unique |
        Sort-Object { $_.Name.Length.ToString().PadLeft(4, '0') + "_" + $_.Name } | ForEach-Object {

            Get-GenXDevCmdlets -ModuleName ($_.Name) | ForEach-Object { $_ }
        }
    }

    process {

        # initialize tracking variables
        $lastModule = ""

        # process each cmdlet
        foreach ($current in $modules) {

            # emit module header when switching to a new module
            if (($lastModule -eq "") -or ($lastModule -ne $current.ModuleName)) {
                Write-Verbose "Processing module: $($current.ModuleName)"
                "`r`n&nbsp;<hr/>`r`n###`t$($current.ModuleName)<hr/>"
            }

            $lastModule = $current.ModuleName

            # filter cmdlets if specific ones were requested
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

            $CmdletName = $current.Name
            Write-Verbose "Generating help for cmdlet: $CmdletName"

            # get help content for current cmdlet
            $lines = ""
            try {
                $lines = (help $CmdletName -Full)
            }
            catch {
                throw "Could not get help for command $CmdletName -> $PSItem"
            }

            # initialize state tracking variables for help processing
            $inPowerShell = $false
            [bool] $hide = $false
            $lineBuffer = ""
            $inName = $false

            # process each line of help content
            foreach ($line in $lines) {
                # normalize line endings and tabs
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
                                $aliases = ((Get-Alias -Definition $CmdletName `
                                            -ErrorAction SilentlyContinue |
                                        ForEach-Object name) -join ", ").Trim()

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
                            alignScript $lineBuffer.Trim("`r`n".ToCharArray()) 0
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
            }

            # add section separator
            "`r`n<br/><hr/><hr/><br/>`r`n"
        }
    }

    end {
    }
}
################################################################################