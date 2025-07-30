function EnsureDefaultGenXdevRefactors {

  <#

NAME
    New-Refactor

SYNOPSIS
    Creates a new refactoring set for code transformation tasks.


SYNTAX
    New-Refactor [-Name] <String> [-PromptKey] <String> [[-Prompt] <String>] [[-SelectionScript] <String>] [[-SelectionPrompt] <String>] [[-LLMQueryType] <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-MaxToken <Int32>] [-Cpu <Int32>] [-TTLSeconds <Int32>] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-Temperature <Double>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath <String>] [-AutoAddModifiedFiles] [-Force] [-SessionOnly] [-ClearSession] [-SkipSession] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]


DESCRIPTION
    Creates and configures a new refactoring definition with specified settings for
    LLM-based code transformations. The function handles:
    - Setting up refactoring configuration
    - Configuring selection criteria and prompts
    - Managing LLM model settings
    - Integrating with development environments
    - Persisting refactor definitions


PARAMETERS
    -Name <String>
        Unique identifier for the refactoring set. Must be non-empty and unique.

        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -PromptKey <String>
        Key identifying which prompt template to use for refactoring operations.

        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Prompt <String>
        Optional custom prompt text to override the template specified by PromptKey.

        Required?                    false
        Position?                    3
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -SelectionScript <String>
        PowerShell script defining selection criteria for items to refactor.

        Required?                    false
        Position?                    4
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -SelectionPrompt <String>
        Custom prompt text used by the LLM to guide selection of items for refactoring.

        Required?                    false
        Position?                    5
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -LLMQueryType <String>
        The type of LLM query to perform (SimpleIntelligence, Knowledge, Pictures, etc.).

        Required?                    false
        Position?                    6
        Default value                Coding
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Model <String>
        Name or identifier of the specific LLM model to use for processing.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -HuggingFaceIdentifier <String>
        Identifier used to retrieve a specific model from LM Studio.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -MaxToken <Int32>
        Maximum tokens allowed in LLM responses. Use -1 for model default.

        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Cpu <Int32>
        The number of CPU cores to dedicate to AI operations.

        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -TTLSeconds <Int32>
        Time-to-live in seconds for API-loaded models. Use -1 for no expiration.

        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -SelectByFreeRam [<SwitchParameter>]
        Select configuration by available system RAM.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -SelectByFreeGpuRam [<SwitchParameter>]
        Select configuration by available GPU RAM.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Temperature <Double>
        Controls randomness in LLM responses (0.0-1.0). Lower is more deterministic.

        Required?                    false
        Position?                    named
        Default value                0.2
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Gpu <Int32>
        GPU usage control: -2=Auto, -1=LM Studio default.

        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -ApiEndpoint <String>
        Custom API endpoint URL for accessing the LLM service.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -ApiKey <String>
        Authentication key required for API access.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -TimeoutSeconds <Int32>
        The timeout in seconds for AI operations.

        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Priority <Int32>
        Processing priority for this refactor set (higher numbers = higher priority).

        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -ExposedCmdLets <ExposedCmdletDefinition[]>
        Array of PowerShell cmdlet definitions to expose as tools to the LLM.

        Required?                    false
        Position?                    named
        Default value                @()
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -FilesToAdd <FileInfo[]>
        Array of files to initially include in the refactoring set.

        Required?                    false
        Position?                    named
        Default value                @()
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -PreferencesDatabasePath <String>
        Database path for preference data files.

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -AutoAddModifiedFiles [<SwitchParameter>]
        When enabled, automatically adds any modified files to the refactoring queue.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Force [<SwitchParameter>]
        Forces LM Studio to restart before initialization.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Code [<SwitchParameter>]
        Opens files in Visual Studio Code when enabled.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -VisualStudio [<SwitchParameter>]
        Opens files in Visual Studio when enabled.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -KeysToSend <String[]>
        Array of keystrokes to send after opening files.

        Required?                    false
        Position?                    named
        Default value                @()
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -WhatIf [<SwitchParameter>]

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    -Confirm [<SwitchParameter>]

        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS

OUTPUTS

    -------------------------- EXAMPLE 1 --------------------------

    PS > New-Refactor -Name "UpdateLogging" -PromptKey "LoggingRefactor" `
        -SelectionScript "Get-LoggingMethods" -Priority 1 `
        -Model "qwen2.5-14b-instruct" -Code






    -------------------------- EXAMPLE 2 --------------------------

    PS > newrefactor UpdateLogging LoggingRefactor -p "Get-LoggingMethods" -c








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
    GenXdev.Coding\Remove-Refactor "TooManyParameters" -ErrorAction SilentlyContinue
    $rootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"
    if (-not (GenXdev.Coding\Get-Refactor -Name "TooManyParameters" -ErrorAction SilentlyContinue)) {

        # Create a refactor definition for recently modified files
        # This refactor will only include files that have been modified in the last 7 days
        # and will not prompt the user for any input.
        $null = GenXdev.Coding\New-Refactor `
            -Name "TooManyParameters" `
            -PromptKey "TooManyParameters" `
            -SelectionScript "`GenXdev.Helpers\Get-GenXDevCmdlets | Microsoft.PowerShell.Core\ForEach-Object { try { `$ci = Microsoft.PowerShell.Core\Get-Command -Name `$_.Name; if (`$ci.Parameters.Count -gt 15) { Microsoft.PowerShell.Management\Get-ChildItem (`$_.ScriptFilePath) } } catch {} } | Microsoft.PowerShell.Utility\sort-object -property LastWriteTime" `
            -AutoAddModifiedFiles `
            -Priority 0 `
            -FilesToAdd @(GenXdev.Helpers\Get-GenXDevCmdlets | Microsoft.PowerShell.Core\ForEach-Object { try { $ci = Microsoft.PowerShell.Core\Get-Command -Name $_.Name; if ($ci.Parameters.Count -gt 15) { Microsoft.PowerShell.Management\Get-ChildItem ($_.ScriptFilePath) } } catch {} })

        GenXdev.Coding\Get-Refactor -Name "TooManyParameters"
    }

}