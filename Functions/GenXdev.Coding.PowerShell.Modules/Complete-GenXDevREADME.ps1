################################################################################
<#
.SYNOPSIS
Completes the README file for specified GenXDev modules by adding documentation.

.DESCRIPTION
This function enhances README.md files for GenXDev modules by automatically
generating and inserting a cmdlet index and detailed cmdlet documentation. It
processes either specified modules or all modules if none are specified.

.PARAMETER ModuleName
Specifies which module(s) to process. If omitted, all modules will be processed.
Can accept multiple module names and pipeline input.

.EXAMPLE
Complete-GenXDevREADME -ModuleName "GenXdev.Helpers"

.EXAMPLE
"GenXdev.Helpers" | Complete-GenXDevREADME
#>
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
    )

    begin {
        # get information about target modules
        $modules = Get-GenXDevModuleInfo -ModuleName "$ModuleName"
    }

    process {

        foreach ($module in $modules) {

            # construct full path to the module's README.md file
            $readmeFilePath = [System.IO.Path]::Combine($module.ModulePath,
                "README.md")

            # skip if README doesn't exist
            if (-not [System.IO.File]::Exists($readmeFilePath)) { continue }

            # load the current README content
            $readmeText = [System.IO.File]::ReadAllText($readmeFilePath)

            # locate the sections we need to update
            $summaryIndex = $readmeText.IndexOf("`r`n# Cmdlet Index")
            $cmdsIndex = $readmeText.IndexOf("`r`n# Cmdlets")

            # skip if required sections are not found
            if ($cmdsIndex -lt 0) { continue }
            if ($summaryIndex -ge 0 -and $summaryIndex -lt $cmdsIndex) {
                $cmdsIndex = $summaryIndex
            }

            Write-Verbose "Updating documentation in $readmeFilePath"

            # generate detailed cmdlet documentation
            $cmdlets = @(Get-ModuleHelpMarkdown -ModuleName @($module.ModuleName)) `
                -join " `r`n"

            # prepare variables for summary table generation
            $lastModule = ""

            # generate the summary table header
            $summary = "| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            " | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            "&nbsp; | Description |`r`n| --- | --- | --- |`r`n"

            # get all cmdlets and build summary table
            $summary += @(Get-GenXDevCmdlets -ModuleName @($module.ModuleName) |
                Sort-Object -Property ModuleName, Name |
                ForEach-Object -ErrorAction SilentlyContinue {

                    # add module header if switching to new module
                    if (($lastModule -ne "") -and
                        ($lastModule -ne $PSItem.ModuleName)) {
                        "`r`n<hr/>`r`n&nbsp;`r`n`r`n### $($PSItem.ModuleName)" +
                        "</hr>`r`n| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | " +
                        "Description |`r`n| --- | --- | --- |"
                    }

                    $lastModule = $PSItem.ModuleName
                    $desc = ("$($PSItem.Description)" -Replace "[`r`n`t|]*", "").Trim()
                    "| [$($PSItem.Name)](#$($PSItem.Name)) | $($PSItem.Aliases) |" +
                    " $desc |"
                }) -join "`r`n"

            $summary += "`r`n`r`n<br/><hr/><hr/><br/>`r`n`r`n`r`n"

            # combine all sections into final content
            $newHelp = "# Cmdlet Index`r`n### $($module.ModuleName)<hr/>`r`n" +
            "$summary`r`n# Cmdlets`r`n$cmdlets"

            # update the README content
            $readmeText = ($readmeText.Substring(0, $cmdsIndex + 2) +
                "`r`n$newHelp") -Replace "`r`n`r`n`r`n", "`r`n`r`n"

            # save the updated README
            [System.IO.File]::WriteAllText($readmeFilePath, $readmeText)
        }
    }

    end {
    }
}
################################################################################
