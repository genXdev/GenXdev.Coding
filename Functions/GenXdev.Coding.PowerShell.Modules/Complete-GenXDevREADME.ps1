###############################################################################
<#
.SYNOPSIS
Completes the README file for specified GenXDev modules by adding documentation.

.DESCRIPTION
This function enhances README.md files for GenXDev modules by automatically
generating and inserting a cmdlet index and detailed cmdlet documentation. It
processes either specified modules or all modules if none are specified. The
function updates existing README.md files with a standardized format including
a command index and detailed help for each cmdlet.

.PARAMETER ModuleName
Specifies which module(s) to process. If omitted, all modules will be processed.
Can accept multiple module names and supports pipeline input. Accepts string array
input.

.EXAMPLE
Complete-GenXDevREADME -ModuleName "GenXdev.Helpers"

.EXAMPLE
"GenXdev.Helpers" | Complete-GenXDevREADME
        ###############################################################################>
function Complete-GenXDevREADME {

    [CmdletBinding()]
    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name(s) of the module(s) to complete the README for"
        )]
        [string[]] $ModuleName = @()
        ########################################################################
    )

    begin {
        # retrieve module information for target modules
        $modules = GenXdev.Coding\Get-GenXDevModuleInfo -ModuleName "$ModuleName"
    }


    process {

        foreach ($module in $modules) {

            # construct path to module's README file
            $readmeFilePath = [System.IO.Path]::Combine(
                $module.ModulePath,
                "README.md")

            # skip processing if README doesn't exist
            if (-not [System.IO.File]::Exists($readmeFilePath)) { continue }

            Microsoft.PowerShell.Utility\Write-Verbose "Processing README file: $readmeFilePath"

            # load current README content for modification
            $readmeText = [System.IO.File]::ReadAllText($readmeFilePath)


            if ($module.ModuleName -eq "GenXdev") {

                $moduleIndex = $readmeText.IndexOf("`r`n# Modules`r`n") + 13;
                if ($moduleIndex -lt 0) {

                    throw (
                        "Unable to locate module section in README file`r`n" +
                        "see: $PSScriptRoot\Complete-GenXDev.README.ps1:67`r`n"
                    )
                }
                [System.Text.StringBuilder] $newHelp = [System.Text.StringBuilder]::new()

                GenXdev.Coding\Get-GenXDevNewModulesInOrderOfDependency | Microsoft.PowerShell.Core\ForEach-Object {

                    if (-not $_.HasREADME) { return }
                    $moduleReadmeFilePath = [System.IO.Path]::Combine(
                        $_.ModulePath, "README.md")
                    $null = $newHelp.Append("`r`n`r`n")
                    $null = $newHelp.Append([IO.File]::ReadAllText($moduleReadmeFilePath))
                    $null = $newHelp.Append("`r`n`r`n");
                }

                $readmeText = $readmeText.Substring(0, $moduleIndex) +
                "`r`n$($newHelp.ToString())".Replace("`r`n`r`n`r`n", "`r`n`r`n")

                [IO.File]::WriteAllText($readmeFilePath, $readmeText)

                continue;
            }

            # locate section markers for updates
            $summaryIndex = $readmeText.IndexOf("`r`n# Cmdlet Index")
            $cmdsIndex = $readmeText.IndexOf("`r`n# Cmdlets")

            # validate required sections exist
            if ($cmdsIndex -lt 0) { continue }
            if ($summaryIndex -ge 0 -and $summaryIndex -lt $cmdsIndex) {
                $cmdsIndex = $summaryIndex
            }

            Microsoft.PowerShell.Utility\Write-Verbose "Generating documentation for $($module.ModuleName)"

            # generate detailed cmdlet documentation
            $cmdlets = @(GenXdev.Coding\Get-ModuleHelpMarkdown -ModuleName @($module.ModuleName)) `
                -join " `r`n"

            $lastModule = ""

            # prepare summary table header with proper column spacing
            $summary = (
                "| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                " | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "&nbsp; | Description |`r`n| --- | --- | --- |`r`n"
            )

            # build cmdlet summary table with module sections
            $summary += @(GenXdev.Helpers\Get-GenXDevCmdlets -ModuleName @($module.ModuleName) |
                Microsoft.PowerShell.Utility\Sort-Object -Property ModuleName, Name |
                Microsoft.PowerShell.Core\ForEach-Object -ErrorAction SilentlyContinue {

                    # insert module header when changing modules
                    if (($lastModule -ne "") -and
                        ($lastModule -ne $PSItem.ModuleName)) {

                        $moduleHeader = (
                            "`r`n<hr/>`r`n&nbsp;`r`n`r`n### $($PSItem.ModuleName)" +
                            "</hr>`r`n| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | " +
                            "Description |`r`n| --- | --- | --- |"
                        )
                        $moduleHeader
                    }

                    $lastModule = $PSItem.ModuleName
                    $desc = ("$($PSItem.Description)" -Replace "[`r`n`t|]*", "").Trim()
                    "| [$($PSItem.Name)](#$($PSItem.Name)) | $($PSItem.Aliases) |" +
                    " $desc |"
                }) -join "`r`n"

            $summary += "`r`n`r`n<br/><hr/><hr/><br/>`r`n`r`n`r`n"

            # combine sections into final content
            $newHelp = (
                "# Cmdlet Index`r`n### $($module.ModuleName)<hr/>`r`n" +
                "$summary`r`n# Cmdlets`r`n$cmdlets"
            )

            # update README content with new documentation
            $readmeText = ($readmeText.Substring(0, $cmdsIndex + 2) +
                "`r`n$newHelp") -Replace "`r`n`r`n`r`n", "`r`n`r`n"

            Microsoft.PowerShell.Utility\Write-Verbose "Saving updated README file"

            # save modified README
            [System.IO.File]::WriteAllText($readmeFilePath, $readmeText)
        }
    }

    end {
    }
}
        ###############################################################################