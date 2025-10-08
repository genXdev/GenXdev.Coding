<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : EnsureDefaultGenXdevRefactors.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
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
function EnsureDefaultGenXdevRefactors {

    [cmdletbinding()]
    param
    (
        [switch] $Force
    )

    $rootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"

    $depricated = @("MissingDocumentation", "OnlyDocumentation", "TooManyParameters")
    foreach ($name in $depricated) {
        $obj = GenXdev.Coding\Get-Refactor -Name $name -ErrorAction SilentlyContinue;
        if ($null -ne $obj) {

            $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
        }
    }

    # DocumentationAndFormatting
    $obj = GenXdev.Coding\Get-Refactor -Name "DocumentationAndFormatting" -ErrorAction SilentlyContinue;

    if ($Force -and ($null -ne $obj)) {

        $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
        $obj = $null
    }

    if (-not $obj) {

        # Create a refactor definition for recently modified files
        # This refactor will only include files that have been modified in the last 7 days
        # and will not prompt the user for any input.
        $null = GenXdev.Coding\New-Refactor `
            -Name "DocumentationAndFormatting" `
            -PromptKey "OnlyDocumentation" `
            -SelectionScript "Get-GenXDevCmdlet | Microsoft.PowerShell.Core\Where-Object { [string]::IsNullOrWhitespace(`$_.Description) } | Microsoft.PowerShell.Core\ForEach-Object { if (-not (GenXdev.FileSystem\Find-Item -NoRecurse (`$_.ScriptFilePath) `"\.DESCRIPTION`" -PassThru)) { Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath (GenXdev.FileSystem\Expand-Path `$_.ScriptFilePath) -ErrorAction SilentlyContinue } } | Microsoft.PowerShell.Utility\Sort-Object -property LastWriteTime" `
            -AutoAddModifiedFiles `
            -Priority 0
    }

    # ConvertToCSharp
    $obj = GenXdev.Coding\Get-Refactor -Name "ConvertToCSharp" -ErrorAction SilentlyContinue;

    if ($Force -and ($null -ne $obj)) {

        $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
        $obj = $null
    }

    if (-not $obj) {

        # Create a refactor definition for all cmdlets prioritized for C# conversion
        # This refactor uses the cmdlet usage analysis to identify all functions
        # and prioritizes them for conversion to C# with most used first.
        $null = GenXdev.Coding\New-Refactor `
            -Name "ConvertToCSharp" `
            -PromptKey "ConvertToCSharp" `
            -SelectionScript "`$analysisData = GenXdev.Coding\Get-GenXdevCmdletUsageAnalysis 2>`$null; `$allCmdlets = Get-GenXDevCmdlet | Microsoft.PowerShell.Core\Where-Object { `$_.ScriptFilePath -like `"*.ps1`" -and (Microsoft.PowerShell.Management\Test-Path `$_.ScriptFilePath) }; `$allCmdlets | Microsoft.PowerShell.Core\ForEach-Object { `$usage = (`$analysisData | Microsoft.PowerShell.Core\Where-Object { `$_.FunctionName -eq `$_.Name }); `$_ | Microsoft.PowerShell.Utility\Add-Member -NotePropertyName UsageCount -NotePropertyValue ([int](`$usage.UsageCount ?? 0)) -PassThru } | Microsoft.PowerShell.Utility\Sort-Object UsageCount -Descending | Microsoft.PowerShell.Core\ForEach-Object { Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath `$_.ScriptFilePath -ErrorAction SilentlyContinue }" `
            -AutoAddModifiedFiles:$false `
            -Priority -10
    }

    # AddInstallationConsentPrompt
    $obj = GenXdev.Coding\Get-Refactor -Name "AddInstallationConsentPrompt" -ErrorAction SilentlyContinue;

    if ($Force -and ($null -ne $obj)) {

        $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
        $obj = $null
    }

    if (-not $obj) {

        # Create a refactor definition for all cmdlets prioritized for C# conversion
        # This refactor uses the cmdlet usage analysis to identify all functions
        # and prioritizes them for conversion to C# with most used first.
        $null = GenXdev.Coding\New-Refactor `
            -Name "AddInstallationConsentPrompt" `
            -PromptKey "AddInstallationConsentPrompt" `
            -SelectionScript "GenXdev.FileSystem\Find-Item `"$rootPath\Modules\GenXdev.*\*.ps1`" 'winget' -PassThru -Quiet | Where-Object { -not (([IO.File]::ReadAllText(`$_.FullName)) | Select-String 'Confirm-InstallationConsent' -Quiet) }" `
            -AutoAddModifiedFiles:$false `
            -Priority 10
    }

    GenXdev.Coding\Get-Refactor
}