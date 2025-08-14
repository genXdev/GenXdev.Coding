function EnsureDefaultGenXdevRefactors {

    [cmdletbinding()]
    param
    (
        [switch] $Force
    )

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
            -SelectionScript "Get-GenXDevCmdlets | Microsoft.PowerShell.Core\Where-Object { [string]::IsNullOrWhitespace(`$_.Description) } | Microsoft.PowerShell.Core\ForEach-Object { if (-not (GenXdev.FileSystem\Find-Item -NoRecurse (`$_.ScriptFilePath) `"\.DESCRIPTION`" -PassThru)) { Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath (GenXdev.FileSystem\Expand-Path `$_.ScriptFilePath) -ErrorAction SilentlyContinue } } | Microsoft.PowerShell.Utility\Sort-Object -property LastWriteTime" `
            -AutoAddModifiedFiles `
            -Priority 0
    }

    GenXdev.Coding\Get-Refactor
}