<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Complete-GenXDevREADME.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.272.2025
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
################################################################################
<#
.SYNOPSIS
Completes the README file for specified GenXDev modules by adding documentation.

.DESCRIPTION
This function enhances README.md files for GenXDev modules by automatically
generating and inserting a cmdlet index and detailed cmdlet documentation. For
individual modules, it processes and updates existing README.md files with a
standardized format including a command index and detailed help for each cmdlet.

For the main GenXdev module, it creates a concise overview with links to GitHub
repositories instead of concatenating full module content, preventing the README
from becoming too large for parsers. Cmdlet indexes link to the corresponding
sections in the GitHub repository's README files.

.PARAMETER ModuleName
Specifies which module(s) to process. If omitted, all modules will be processed.
Can accept multiple module names and supports pipeline input. Accepts string
array input.

.EXAMPLE
Complete-GenXDevREADME -ModuleName "GenXdev.Helpers"

.EXAMPLE
"GenXdev.Helpers" | Complete-GenXDevREADME
#>
function Complete-GenXDevREADME {

    [CmdletBinding()]
    param(
        ########################################################################
        [Alias('Module', 'BaseModuleName', 'SubModuleName')]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The name(s) of the module(s) to complete the README for'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.[\w\*\[\]\?]*)+)+$')]
        [SupportsWildcards()]
        [string[]] $ModuleName = @("GenXdev*")
        ########################################################################
    )

    begin {

        # retrieve module information for target modules
        $modules = @(GenXdev.Coding\Get-GenXDevModuleInfo -ModuleName (

                GenXdev.Helpers\Get-GenXDevCmdlet -OnlyReturnModuleNames -ModuleName:$ModuleName
            )) + @(GenXdev.Coding\Get-GenXDevModuleInfo -ModuleName 'GenXdev')
    }

    process {

        foreach ($moduleObj in $modules) {

            # construct path to module's README file
            $readmeFilePath = [System.IO.Path]::Combine(
                $moduleObj.ModulePath,
                'README.md')

            # skip processing if README doesn't exist
            if (-not [System.IO.File]::Exists($readmeFilePath)) {

                continue
            }

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Processing README file: $readmeFilePath")

            # load current README content for modification
            $readmeText = [System.IO.File]::ReadAllText($readmeFilePath)

            if ($moduleObj.ModuleName -eq 'GenXdev') {

                # For the main GenXdev module, create a concise overview with GitHub links
                # instead of concatenating full module content to prevent README from
                # becoming too large for parsers

                # look for the modules section with flexible whitespace handling
                $moduleIndex = $readmeText.IndexOf("`r`n# Modules`r`n")

                if ($moduleIndex -lt 0) {

                    throw (
                        "Unable to locate module section in README file`r`n" +
                        "see: $PSScriptRoot\Complete-GenXDev.README.ps1:67`r`n"
                    )
                }

                [System.Text.StringBuilder] $newHelp = (
                    [System.Text.StringBuilder]::new())

                # create module overview table
                $null = $newHelp.AppendLine("# Modules")

                $null = $newHelp.AppendLine()

                $null = $newHelp.AppendLine("## Module Overview")

                $null = $newHelp.AppendLine()

                $null = $newHelp.AppendLine("| Module | Description | Repository |")

                $null = $newHelp.AppendLine("| :--- | :--- | :--- |")

                GenXdev.Coding\Get-GenXDevNewModulesInOrderOfDependency |
                    Microsoft.PowerShell.Core\Where-Object {

                        $_.ModuleName -ne 'GenXdev' -and $_.HasREADME
                    } |
                    Microsoft.PowerShell.Utility\Sort-Object -Property ModuleName |
                    Microsoft.PowerShell.Core\ForEach-Object {

                        $moduleName = $_.ModuleName

                        # extract description dynamically from module's README
                        $moduleReadmeFilePath = [System.IO.Path]::Combine(
                            $_.ModulePath,
                            'README.md')

                        $moduleContent = [IO.File]::ReadAllText($moduleReadmeFilePath)

                        $synopsisPattern = (
                            '### SYNOPSIS\s*\r?\n\s*(.+?)(?=\r?\n\[|\r?\n###|\r?\n##|\r?\n\s*$)')

                        $description = if ($moduleContent -match $synopsisPattern) {

                            $matches[1].Trim()
                        }
                        else {

                            ("A Windows PowerShell module for " +
                            "$($moduleName.Replace('GenXdev.', '').ToLower()) operations")
                        }

                        $descriptionText = if ([String]::IsNullOrWhiteSpace($description)) {

                            '&nbsp;'
                        }
                        else {

                            $description
                        }

                        # create internal anchor for linking to module section below
                        # GitHub removes dots and converts to lowercase for anchor IDs
                        $anchorName = $moduleName.ToLowerInvariant().Replace('.', '')

                        # extract base module name for GitHub URL (e.g., GenXdev.AI)
                        $baseModuleName = $moduleName.Split('.')[0..1] -join '.'
                        $githubRepoUrl = "https://github.com/genXdev/$baseModuleName"

                        $null = $newHelp.AppendLine(
                            "| [${moduleName}](#${anchorName}) | $descriptionText | [📁 $baseModuleName]($githubRepoUrl) |")
                    }

                $null = $newHelp.AppendLine()

                $null = $newHelp.AppendLine("<br/><hr/><br/>")

                $null = $newHelp.AppendLine()

                # add individual module sections with cmdlet indexes linking to GitHub repos
                GenXdev.Helpers\Invoke-OnEachGenXdevModule `
                    -OnlyPublished `
                    -ModuleName GenXdev.* {

                    param($moduleObj2, $isScriptsFolder, $isSubModule, $subModuleName)

                    @{
                        ModuleObj2    = $moduleObj2
                        SubModuleName = $subModuleName
                    }
                } |
                    Microsoft.PowerShell.Utility\Sort-Object -Property SubModuleName |
                    Microsoft.PowerShell.Core\ForEach-Object {

                        $moduleObj2 = $_.ModuleObj2

                        $subModuleName = $_.SubModuleName

                        $modulePath = GenXdev.FileSystem\Expand-Path (
                            "$($moduleObj2.FullName)\1.272.2025")

                        $moduleReadmeFilePath = [System.IO.Path]::Combine(
                            $modulePath,
                            'README.md')

                        if ([System.IO.File]::Exists($moduleReadmeFilePath)) {

                            $moduleContent = [IO.File]::ReadAllText($moduleReadmeFilePath)

                            # extract base module name for GitHub URL
                            $baseModuleName = $subModuleName.Split('.')[0..1] -join '.'

                            # add module header - Markdown will automatically create anchor from header text
                            $null = $newHelp.AppendLine("## $subModuleName")
                            $null = $newHelp.AppendLine()

                            # extract synopsis from module README
                            $synopsisPattern = '### SYNOPSIS\s*\r?\n\s*(.+?)(?=\r?\n\[|\r?\n###|\r?\n##|\r?\n\s*$)'
                            $synopsis = if ($moduleContent -match $synopsisPattern) {
                                $matches[1].Trim()
                            }
                            else {
                                "A Windows PowerShell module for $($subModuleName.Replace('GenXdev.', '').ToLower()) operations"
                            }

                            $null = $newHelp.AppendLine("**$synopsis**")
                            $null = $newHelp.AppendLine()

                            # generate cmdlet index with GitHub links
                            $null = $newHelp.AppendLine("### Cmdlet Index")
                            $null = $newHelp.AppendLine()
                            $null = $newHelp.AppendLine("| Command | Aliases | Description |")
                            $null = $newHelp.AppendLine("| :--- | :--- | :--- |")

                            # get cmdlets for this module
                            GenXdev.Helpers\Get-GenXDevCmdlet -ModuleName @($subModuleName) |
                                Microsoft.PowerShell.Utility\Sort-Object -Property Name |
                                Microsoft.PowerShell.Core\ForEach-Object -ErrorAction SilentlyContinue {

                                    $cmdletName = $_.Name
                                    $desc = ("$($_.Description)" -Replace "[\r\n\t|]*", '').Trim()
                                    $anchor = $cmdletName.ToLower().Replace(' ', '-').Replace('.', '').Replace('_', '')

                                    # create GitHub raw URL for cmdlet documentation
                                    # $githubUrl = "https://github.com/genXdev/$baseModuleName/blob/main/README.md#$anchor"
                                    $githubUrl = "https://github.com/genXdev/$baseModuleName/tree/main#$anchor"

                                    $aliasText = if ([String]::IsNullOrWhiteSpace($_.Aliases)) {
                                        "&nbsp;"
                                    }
                                    else {
                                        $_.Aliases
                                    }

                                    $descText = if ([String]::IsNullOrWhiteSpace($desc)) {
                                        "&nbsp;"
                                    }
                                    else {
                                        $desc
                                    }

                                    $null = $newHelp.AppendLine("| [$cmdletName]($githubUrl) | $aliasText | $descText |")
                                }

                                $null = $newHelp.AppendLine()
                                $null = $newHelp.AppendLine("📖 [Full Documentation](https://github.com/genXdev/$baseModuleName/blob/main/README.md) | ↑ [Back to Module Overview](#module-overview)")
                                $null = $newHelp.AppendLine()
                                $null = $newHelp.AppendLine("<br/><hr/><br/>")
                                $null = $newHelp.AppendLine()
                            }
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
            if ($cmdsIndex -lt 0) {

                continue
            }

            if ($summaryIndex -ge 0 -and $summaryIndex -lt $cmdsIndex) {

                $cmdsIndex = $summaryIndex
            }

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Generating documentation for $($moduleObj.ModuleName)")

            # generate detailed cmdlet documentation
            $cmdlets = @(GenXdev.Coding\Get-ModuleHelpMarkdown `
                    -ModuleName @($moduleObj.ModuleName)) `
                -join " `r`n"

            $lastModule = ''

            # build cmdlet summary table as an array for correct module grouping
            $summaryRows = @()

            $lastModule = ''

            $first = $true

            GenXdev.Helpers\Get-GenXDevCmdlet -ModuleName @($moduleObj.ModuleName) |
                Microsoft.PowerShell.Utility\Sort-Object `
                    -Property ModuleName, Name |
                Microsoft.PowerShell.Core\ForEach-Object `
                    -ErrorAction SilentlyContinue {

                    if ($first -or ($lastModule -ne $PSItem.ModuleName)) {

                        if (-not $first) {

                            $summaryRows += ''
                        }

                        $summaryRows += (
                            "### $($PSItem.ModuleName)`r`n" +
                            "| Command | Aliases | Description |`r`n" +
                            "| :--- | :--- | :--- |")

                        $first = $false
                    }

                    $lastModule = $PSItem.ModuleName

                    $desc = ("$($PSItem.Description)" -Replace "[\r\n\t|]*", '').Trim()

                    $anchor = $PSItem.Name.ToLower().Replace(' ', '-').Replace(
                        '.', '').Replace('_', '')

                    $aliasText = if ([String]::IsNullOrWhiteSpace($PSItem.Aliases)) {

                        "&nbsp;"
                    }
                    else {

                        $PSItem.Aliases
                    }

                    $descText = if ([String]::IsNullOrWhiteSpace($desc)) {

                        "&nbsp;"
                    }
                    else {

                        $desc
                    }

                    $summaryRows += "| [$($PSItem.Name)](#$anchor) | $aliasText | $descText |"
                }

            $summary = $summaryRows -join "`r`n"

            $summary += "`r`n`r`n<br/><hr/><br/>`r`n`r`n`r`n"

            # combine sections into final content
            $newHelp = (
                "# Cmdlet Index`r`n$summary`r`n# Cmdlets`r`n$cmdlets"
            )

            # update README content with new documentation
            $newHelp = $newHelp -Replace '\| \|', '| &nbsp; |' -Replace '\|  \|', '| &nbsp; |' -Replace '\|   \|', '| &nbsp; |'

            $readmeText = ($readmeText.Substring(0, $cmdsIndex + 2) +
                "`r`n$newHelp") -Replace "`r`n`r`n`r`n", "`r`n`r`n"

            Microsoft.PowerShell.Utility\Write-Verbose 'Saving updated README file'

            # save modified README
            [System.IO.File]::WriteAllText($readmeFilePath, $readmeText)
        }
    }

    end {

    }
}
################################################################################