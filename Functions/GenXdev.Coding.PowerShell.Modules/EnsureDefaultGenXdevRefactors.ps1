<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : EnsureDefaultGenXdevRefactors.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.274.2025
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
Ensures default GenXdev refactor definitions exist with proper configuration.

.DESCRIPTION
This function manages the creation and maintenance of default refactor
definitions used throughout the GenXdev development environment. It handles
deprecated refactor cleanup, creates essential refactor definitions for
documentation formatting and C# conversion, and adds a new parameter splatting
refactor for improved code readability. The function ensures all refactor
definitions use proper selection scripts and priority settings.

.PARAMETER Force
When specified, forces recreation of existing refactor definitions by removing
them first before creating new ones.

.EXAMPLE
EnsureDefaultGenXdevRefactors

Creates default refactor definitions if they don't already exist.

.EXAMPLE
EnsureDefaultGenXdevRefactors -Force

Forces recreation of all default refactor definitions.
#>
function EnsureDefaultGenXdevRefactors {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Forces recreation of existing refactor definitions " +
                "by removing them first")
        )]
        [switch] $Force
        ########################################################################
    )

    begin {

        # define deprecated refactor names that should be removed
        $deprecatedRefactors = @(
            "MissingDocumentation",
            "OnlyDocumentation",
            "TooManyParameters"
        )

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Starting default GenXdev refactor definitions setup"
        )
    }

    process {

        # remove deprecated refactor definitions to clean up old configurations
        foreach ($refactorName in $deprecatedRefactors) {

            $existingRefactor = GenXdev.Coding\Get-Refactor `
                -Name $refactorName `
                -ErrorAction SilentlyContinue

            if ($null -ne $existingRefactor) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Removing deprecated refactor: $refactorName"
                )

                $null = GenXdev.Coding\Remove-Refactor -Name $refactorName
            }
        }

        # handle documentation and formatting refactor definition
        $documentationRefactor = GenXdev.Coding\Get-Refactor `
            -Name "DocumentationAndFormatting" `
            -ErrorAction SilentlyContinue

        # remove existing refactor if force flag is specified
        if ($Force -and ($null -ne $documentationRefactor)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Force removing existing DocumentationAndFormatting refactor"
            )

            $null = GenXdev.Coding\Remove-Refactor `
                -Name "DocumentationAndFormatting"

            $documentationRefactor = $null
        }

        # create documentation and formatting refactor if it doesn't exist
        if (-not $documentationRefactor) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Creating DocumentationAndFormatting refactor definition"
            )

            # create selection script for cmdlets missing proper documentation
            $documentationSelectionScript = (
                "Get-GenXDevCmdlet -IncludeScripts | " +
                "Microsoft.PowerShell.Core\Where-Object { " +
                "[string]::IsNullOrWhitespace(`$_.Description) } | " +
                "Microsoft.PowerShell.Core\ForEach-Object { " +
                "if (-not (GenXdev.FileSystem\Find-Item -NoRecurse " +
                "(`$_.ScriptFilePath) `"\.DESCRIPTION`" -PassThru)) { " +
                "Microsoft.PowerShell.Management\Get-ChildItem " +
                "-LiteralPath (GenXdev.FileSystem\Expand-Path " +
                "`$_.ScriptFilePath) -ErrorAction SilentlyContinue } } | " +
                "Microsoft.PowerShell.Utility\Sort-Object " +
                "-Property LastWriteTime"
            )

            $documentationParams = @{
                Name                 = "DocumentationAndFormatting"
                PromptKey           = "OnlyDocumentation"
                SelectionScript     = $documentationSelectionScript
                AutoAddModifiedFiles = $true
                Priority            = 0
            }

            $null = GenXdev.Coding\New-Refactor @documentationParams
        }

        # handle c# conversion refactor definition
        $csharpRefactor = GenXdev.Coding\Get-Refactor `
            -Name "ConvertToCSharp" `
            -ErrorAction SilentlyContinue

        # remove existing refactor if force flag is specified
        if ($Force -and ($null -ne $csharpRefactor)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Force removing existing ConvertToCSharp refactor"
            )

            $null = GenXdev.Coding\Remove-Refactor -Name "ConvertToCSharp"

            $csharpRefactor = $null
        }

        # create c# conversion refactor if it doesn't exist
        if (-not $csharpRefactor) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Creating ConvertToCSharp refactor definition"
            )

            # create selection script prioritizing cmdlets by usage for conversion
            $csharpSelectionScript = (
                "`$analysisData = GenXdev.Coding\Get-GenXdevCmdletUsageAnalysis " +
                "2>`$null; " +
                "`$allCmdlets = Get-GenXDevCmdlet | " +
                "Microsoft.PowerShell.Core\Where-Object { " +
                "`$_.ScriptFilePath -like `"*.ps1`" -and " +
                "(Microsoft.PowerShell.Management\Test-Path " +
                "`$_.ScriptFilePath) }; " +
                "`$allCmdlets | Microsoft.PowerShell.Core\ForEach-Object { " +
                "`$usage = (`$analysisData | " +
                "Microsoft.PowerShell.Core\Where-Object { " +
                "`$_.FunctionName -eq `$_.Name }); " +
                "`$_ | Microsoft.PowerShell.Utility\Add-Member " +
                "-NotePropertyName UsageCount " +
                "-NotePropertyValue ([int](`$usage.UsageCount ?? 0)) " +
                "-PassThru } | " +
                "Microsoft.PowerShell.Utility\Sort-Object UsageCount " +
                "-Descending | Microsoft.PowerShell.Core\ForEach-Object { " +
                "Microsoft.PowerShell.Management\Get-ChildItem " +
                "-LiteralPath `$_.ScriptFilePath -ErrorAction SilentlyContinue }"
            )

            $csharpParams = @{
                Name                 = "ConvertToCSharp"
                PromptKey           = "ConvertToCSharp"
                SelectionScript     = $csharpSelectionScript
                AutoAddModifiedFiles = $false
                Priority            = -10
            }

            $null = GenXdev.Coding\New-Refactor @csharpParams
        }

        # handle parameter splatting refactor definition
        $splattingRefactor = GenXdev.Coding\Get-Refactor `
            -Name "ParameterSplatting" `
            -ErrorAction SilentlyContinue

        # remove existing refactor if force flag is specified
        if ($Force -and ($null -ne $splattingRefactor)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Force removing existing ParameterSplatting refactor"
            )

            $null = GenXdev.Coding\Remove-Refactor -Name "ParameterSplatting"

            $splattingRefactor = $null
        }

        # create parameter splatting refactor if it doesn't exist
        if (-not $splattingRefactor) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Creating ParameterSplatting refactor definition"
            )

            # create selection script for cmdlets that would benefit from splatting
            $splattingSelectionScript = (
                "GenXdev.FileSystem\Find-Item -SearchMask *.ps1 " +
                "-Pattern '(GenXdev|Microsoft)\.\S+\\\S+\-\S+\s+((-\S+)[^;-}]*){4,}' "+
                "-PassThru | " +
                "Microsoft.PowerShell.Utility\Sort-Object LastWriteTime " +
                "-Descending;"
            )

            $splattingParams = @{
                Name                 = "ParameterSplatting"
                PromptKey           = "ParameterSplatting"
                SelectionScript     = $splattingSelectionScript
                AutoAddModifiedFiles = $false
                Priority            = 5
            }

            $null = GenXdev.Coding\New-Refactor @splattingParams
        }

        # handle unsafe path parameter usage refactor definition
        $unsafePathRefactor = GenXdev.Coding\Get-Refactor `
            -Name "UnsafePathUsage" `
            -ErrorAction SilentlyContinue

        # remove existing refactor if force flag is specified
        if ($Force -and ($null -ne $unsafePathRefactor)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Force removing existing UnsafePathUsage refactor"
            )

            $null = GenXdev.Coding\Remove-Refactor -Name "UnsafePathUsage"

            $unsafePathRefactor = $null
        }

        # create unsafe path usage refactor if it doesn't exist
        if (-not $unsafePathRefactor) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Creating UnsafePathUsage refactor definition"
            )

            # create selection script for cmdlets with unsafe -Path usage
            $unsafePathSelectionScript = (
                "gcmds -DefinitionMatches " +
                "`"(Get-Content [\`"'\`$]|Get-Content -Path |Push-Location [\`"'\`$]|" +
                "Get-ChildItem [\`"'\`$]|Get-ChildItem -Path|Get-Item [\`"'\`$]|" +
                "Get-Item -Path|Add-Content [\`"'\`$]|Add-Content -Path|" +
                "Clear-Content [\`"'\`$]|Clear-Content -Path|Clear-Item [\`"'\`$]|" +
                "Clear-Item -Path|Clear-ItemProperty [\`"'\`$]|" +
                "Clear-ItemProperty -Path|Convert-Path [\`"'\`$]|" +
                "Convert-Path -Path|ConvertFrom-Markdown [\`"'\`$]|" +
                "ConvertFrom-Markdown -Path|Copy-Item [\`"'\`$]|Copy-Item -Path|" +
                "Copy-ItemProperty [\`"'\`$]|Copy-ItemProperty -Path|" +
                "Export-Alias [\`"'\`$]|Export-Alias -Path|Export-Clixml [\`"'\`$]|" +
                "Export-Clixml -Path|Export-Csv [\`"'\`$]|Export-Csv -Path|" +
                "Export-FormatData [\`"'\`$]|Export-FormatData -Path|" +
                "Format-Hex [\`"'\`$]|Format-Hex -Path|Get-FileHash [\`"'\`$]|" +
                "Get-FileHash -Path|Get-ItemProperty [\`"'\`$]|" +
                "Get-ItemProperty -Path|Get-ItemPropertyValue [\`"'\`$]|" +
                "Get-ItemPropertyValue -Path|Import-Alias [\`"'\`$]|" +
                "Import-Alias -Path|Import-Clixml [\`"'\`$]|Import-Clixml -Path|" +
                "Import-Csv [\`"'\`$]|Import-Csv -Path|" +
                "Import-PowerShellDataFile [\`"'\`$]|" +
                "Import-PowerShellDataFile -Path|Invoke-Item [\`"'\`$]|" +
                "Invoke-Item -Path|Move-Item [\`"'\`$]|Move-Item -Path|" +
                "Move-ItemProperty [\`"'\`$]|Move-ItemProperty -Path|" +
                "New-ItemProperty [\`"'\`$]|New-ItemProperty -Path|" +
                "Out-File [\`"'\`$]|Out-File -Path|Remove-Item [\`"'\`$]|" +
                "Remove-Item -Path|Remove-ItemProperty [\`"'\`$]|" +
                "Remove-ItemProperty -Path|Rename-Item [\`"'\`$]|" +
                "Rename-Item -Path|Rename-ItemProperty [\`"'\`$]|" +
                "Rename-ItemProperty -Path|Resolve-Path [\`"'\`$]|" +
                "Resolve-Path -Path|Select-String [\`"'\`$]|Select-String -Path|" +
                "Select-Xml [\`"'\`$]|Select-Xml -Path|Set-Content [\`"'\`$]|" +
                "Set-Content -Path|Set-Item [\`"'\`$]|Set-Item -Path|" +
                "Set-ItemProperty [\`"'\`$]|Set-ItemProperty -Path|" +
                "Set-Location [\`"'\`$]|Set-Location -Path|Show-Markdown [\`"'\`$]|" +
                "Show-Markdown -Path|Split-Path [\`"'\`$]|Split-Path -Path|" +
                "Tee-Object [\`"'\`$]|Tee-Object -Path|Test-Json [\`"'\`$]|" +
                "Test-Json -Path|Test-Path [\`"'\`$]|Test-Path -Path|" +
                "Unblock-File [\`"'\`$]|Unblock-File -Path)`" | " +
                "Microsoft.PowerShell.Core\ForEach-Object { " +
                "Microsoft.PowerShell.Management\Get-ChildItem " +
                "-LiteralPath `$_.ScriptFilePath -ErrorAction SilentlyContinue } | " +
                "Microsoft.PowerShell.Utility\Sort-Object LastWriteTime " +
                "-Descending"
            )

            $unsafePathParams = @{
                Name                 = "UnsafePathUsage"
                PromptKey           = "UnsafePathUsage"
                SelectionScript     = $unsafePathSelectionScript
                AutoAddModifiedFiles = $true
                Priority            = 8
            }

            $null = GenXdev.Coding\New-Refactor @unsafePathParams
        }

        # output all current refactor definitions for verification
        $allRefactors = GenXdev.Coding\Get-Refactor

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Total refactor definitions available: $($allRefactors.Count)"
        )

        return $allRefactors
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Completed default GenXdev refactor definitions setup"
        )
    }
}
################################################################################