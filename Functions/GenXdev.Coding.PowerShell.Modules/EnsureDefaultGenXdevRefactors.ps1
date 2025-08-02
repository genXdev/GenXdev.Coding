function EnsureDefaultGenXdevRefactors {

  <#

    New-Refactor `
        -Name <String> `
        -PromptKey <String> `
        -Prompt <String> `
        -SelectionScript <String> `
        -SelectionPrompt <String> `
        -LLMQueryType <String> `
        -Priority <Int32> `
        -FilesToAdd <FileInfo[]> `
        -AutoAddModifiedFiles `
        -Force `
        -Code

    New-Refactor `
        -Name "OnlyDocumentation" `
        -PromptKey "OnlyDocumentation" `
        -SelectionScript "@(@(l .\modules\genx*\**\functions\*.ps1 -pt) + @(l .\scripts\*.ps1 -pt))" `
        -SelectionPrompt "" `
        -LLMQueryType "" `
        -Priority 0 `
        -FilesToAdd @()

  #>

    # OnlyDocumentation
    GenXdev.Coding\Remove-Refactor "OnlyDocumentation" -ErrorAction SilentlyContinue
    $rootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"
    if (-not (GenXdev.Coding\Get-Refactor -Name "OnlyDocumentation" -ErrorAction SilentlyContinue)) {

        # Create a refactor definition for recently modified files
        # This refactor will only include files that have been modified in the last 7 days
        # and will not prompt the user for any input.
        $null = GenXdev.Coding\New-Refactor `
            -Name "OnlyDocumentation" `
            -PromptKey "OnlyDocumentation" `
            -SelectionScript "`$n = now; @(@(GenXdev.FileSystem\Find-Item '$rootPath\modules\genx*\**\functions\*.ps1' -pt) + @(l '$rootPath\scripts\*.ps1' -pt)) | where-object { (`$n - `$_.LastWriteTime).TotalDays -lt 7 } | Microsoft.PowerShell.Utility\sort-object -property LastWriteTime" `
            -AutoAddModifiedFiles `
            -Priority 0 `
            -FilesToAdd @(@(@(GenXdev.FileSystem\Find-Item "$rootPath\modules\genx*\**\functions\*.ps1" -pt) + @(GenXdev.FileSystem\Find-Item "$rootPath\scripts\*.ps1" -pt)) | Microsoft.PowerShell.Utility\sort-object -property LastWriteTime -Descending)

        GenXdev.Coding\Get-Refactor -Name "OnlyDocumentation"
    }

    # TooManyParameters
    $minAmountByDefault = 12;
    $tooMany = 8 + $minAmountByDefault
    GenXdev.Coding\Remove-Refactor "TooManyParameters" -ErrorAction SilentlyContinue
    $rootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"
    if (-not (GenXdev.Coding\Get-Refactor -Name "TooManyParameters" -ErrorAction SilentlyContinue)) {

        # Create a refactor definition for recently modified files
        # This refactor will only include files that have been modified in the last 7 days
        # and will not prompt the user for any input.
        $null = GenXdev.Coding\New-Refactor `
            -Name "TooManyParameters" `
            -PromptKey "TooManyParameters" `
            -SelectionScript "`GenXdev.Helpers\Get-GenXDevCmdlets | Microsoft.PowerShell.Core\ForEach-Object { try { `$ci = Microsoft.PowerShell.Core\Get-Command -Name `$_.Name; if (`$ci.Parameters.Count -ge $tooMany) { Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath (`$_.ScriptFilePath) } } catch {} } | Microsoft.PowerShell.Utility\sort-object -property LastWriteTime" `
            -AutoAddModifiedFiles `
            -Priority 0 `
            -FilesToAdd @(GenXdev.Helpers\Get-GenXDevCmdlets | Microsoft.PowerShell.Core\ForEach-Object { try { $ci = Microsoft.PowerShell.Core\Get-Command -Name $_.Name; if ($ci.Parameters.Count -ge $tooMany) { Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath ($_.ScriptFilePath) } } catch {} })

        GenXdev.Coding\Get-Refactor -Name "TooManyParameters"
    }
}