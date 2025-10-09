<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : EnsureDefaultGenXdevRefactors.ps1
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