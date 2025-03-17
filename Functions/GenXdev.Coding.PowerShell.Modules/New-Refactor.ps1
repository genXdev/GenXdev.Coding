################################################################################
<#
.SYNOPSIS
Creates a new refactoring set for code transformation tasks.

.DESCRIPTION
Creates and configures a new refactoring definition with specified settings for
LLM-based code transformations. The function handles:
- Setting up refactoring configuration
- Configuring selection criteria and prompts
- Managing LLM model settings
- Integrating with development environments
- Persisting refactor definitions

.PARAMETER Name
Unique identifier for the refactoring set. Must be non-empty and unique.

.PARAMETER PromptKey
Key identifying which prompt template to use for refactoring operations.

.PARAMETER Prompt
Optional custom prompt text to override the template specified by PromptKey.

.PARAMETER SelectionScript
PowerShell script defining selection criteria for items to refactor.

.PARAMETER AutoAddModifiedFiles
When enabled, automatically adds any modified files to the refactoring queue.

.PARAMETER SelectionPrompt
Custom prompt text used by the LLM to guide selection of items for refactoring.

.PARAMETER Model
Name or identifier of the specific LLM model to use for processing.

.PARAMETER ModelLMSGetIdentifier
Identifier used to retrieve a specific model from LM Studio.

.PARAMETER Temperature
Controls randomness in LLM responses (0.0-1.0). Lower is more deterministic.

.PARAMETER MaxToken
Maximum tokens allowed in LLM responses. Use -1 for model default.

.PARAMETER TTLSeconds
Time-to-live in seconds for API-loaded models. Use -1 for no expiration.

.PARAMETER Gpu
GPU usage control: -2=Auto, -1=LM Studio default.

.PARAMETER Force
Forces LM Studio to restart before initialization.

.PARAMETER ApiEndpoint
Custom API endpoint URL for accessing the LLM service.

.PARAMETER ApiKey
Authentication key required for API access.

.PARAMETER Priority
Processing priority for this refactor set (higher numbers = higher priority).

.PARAMETER ExposedCmdLets
Array of PowerShell cmdlet definitions to expose as tools to the LLM.

.PARAMETER Code
Opens files in Visual Studio Code when enabled.

.PARAMETER VisualStudio
Opens files in Visual Studio when enabled.

.PARAMETER KeysToSend
Array of keystrokes to send after opening files.

.PARAMETER FilesToAdd
Array of files to initially include in the refactoring set.

.EXAMPLE
New-Refactor -Name "UpdateLogging" -PromptKey "LoggingRefactor" `
    -SelectionScript "Get-LoggingMethods" -Priority 1 -Code

.EXAMPLE
newrefactor UpdateLogging LoggingRefactor -p "Get-LoggingMethods" -c
#>
function New-Refactor {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("newrefactor")]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The name of this new refactor set"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "The prompt key indicates which prompt script to use"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "The prompt key indicates which prompt script to use"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Prompt = "",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = "Powershell script for function to select items to " +
            "refactor"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $SelectionScript,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Will automatically add modified files to the queue"
        )]
        [switch] $AutoAddModifiedFiles,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 4,
            HelpMessage = "If provided, will invoke LLM to do the selection " +
            "based on the content of the script"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $SelectionPrompt,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 5,
            HelpMessage = "The LM-Studio model to use"
        )]
        [string] $Model,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 6,
            HelpMessage = "Identifier for getting specific model from LM Studio"
        )]
        [string] $ModelLMSGetIdentifier,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 7,
            HelpMessage = "Temperature for response randomness (0.0-1.0)"
        )]
        [ValidateRange(0.0, 1.0)]
        [double] $Temperature = 0.0,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 8,
            HelpMessage = "Maximum tokens in response (-1 for default)"
        )]
        [Alias("MaxTokens")]
        [int] $MaxToken = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 9,
            HelpMessage = "Set a TTL (in seconds) for models via API requests"
        )]
        [Alias("ttl")]
        [int] $TTLSeconds = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 10,
            HelpMessage = "GPU offloading control (-2=Auto, -1=LMStudio decide)"
        )]
        [int] $Gpu = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Force stop LM Studio before initialization"
        )]
        [switch] $Force,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Api endpoint url for LLM service"
        )]
        [string] $ApiEndpoint,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The API key to use for the request"
        )]
        [string] $ApiKey,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 11,
            HelpMessage = "Priority for this refactor set"
        )]
        [ValidateNotNullOrEmpty()]
        [int] $Priority = 0,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 12,
            HelpMessage = "Array of PowerShell command definitions for LLM tools"
        )]
        [GenXdev.Helpers.ExposedCmdletDefinition[]]
        $ExposedCmdLets = @(),
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The ide to open the file in"
        )]
        [Alias("c")]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open in Visual Studio"
        )]
        [Alias("vs")]
        [switch] $VisualStudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The keys to invoke as key strokes after opening the file"
        )]
        [Alias("keys")]
        [string[]] $KeysToSend = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Filenames to add"
        )]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToAdd = @()
        ########################################################################
    )

    begin {

        # capture current UTC timestamp for logging
        $currentTime = UtcNow

        Write-Verbose "Initializing new refactor set '$Name' with priority $Priority"

        # initialize new refactor definition object
        $refactorDefinition = [GenXdev.Helpers.RefactorDefinition]::new()
        $refactorDefinition.Name = $Name
        $refactorDefinition.Priority = $Priority

        # configure base refactoring settings
        $refactorDefinition.RefactorSettings.PromptKey = $PromptKey
        $refactorDefinition.RefactorSettings.Prompt = $Prompt

        # setup selection criteria configuration
        $refactorDefinition.SelectionSettings.Script = $SelectionScript
        $refactorDefinition.SelectionSettings.AutoAddModifiedFiles = $AutoAddModifiedFiles
        $refactorDefinition.SelectionSettings.LLM.Prompt = $SelectionPrompt

        # configure LLM processing settings
        $refactorDefinition.SelectionSettings.LLM.Model = $Model
        $refactorDefinition.SelectionSettings.LLM.ModelLMSGetIdentifier = `
            $ModelLMSGetIdentifier
        $refactorDefinition.SelectionSettings.LLM.Temperature = $Temperature
        $refactorDefinition.SelectionSettings.LLM.MaxToken = $MaxToken
        $refactorDefinition.SelectionSettings.LLM.TTLSeconds = $TTLSeconds
        $refactorDefinition.SelectionSettings.LLM.Gpu = $Gpu
        $refactorDefinition.SelectionSettings.LLM.Force = $Force
        $refactorDefinition.SelectionSettings.LLM.ApiEndpoint = $ApiEndpoint
        $refactorDefinition.SelectionSettings.LLM.ApiKey = $ApiKey
        $refactorDefinition.SelectionSettings.LLM.ExposedCmdLets = $ExposedCmdLets

        # set IDE integration preferences
        $refactorDefinition.RefactorSettings.KeysToSend = $KeysToSend
        $refactorDefinition.RefactorSettings.Code = $PSBoundParameters.ContainsKey(
            "Code") ? ($Code ? 1 : 0) : -1
        $refactorDefinition.RefactorSettings.VisualStudio = `
            $PSBoundParameters.ContainsKey("VisualStudio") ?
            ($VisualStudio ? 1 : 0) : -1

        # record creation event in log
        $null = $refactorDefinition.Log.Add(
            @{
                Timestamp = $currentTime
                Message   = "Refactor set created"
            }
        )

        # initialize state tracking
        $refactorDefinition.State.Status = "Created"
        $refactorDefinition.State.LastUpdated = $currentTime
    }

    process {

        # create unique storage key for this refactor set
        $preferenceName = "refactor_set_$Name"

        Write-Verbose "Validating refactor set '$Name' does not exist"

        # verify no existing refactor with same name exists
        $existingDefinition = Get-GenXdevPreference -Name $preferenceName

        if ($existingDefinition) {
            Write-Error "Refactor set '$Name' already exists"
            return
        }

        if ($PSCmdlet.ShouldProcess($Name, "Create new refactor set")) {

            Write-Verbose "Saving refactor set '$Name'"

            # initialize with provided files
            Update-Refactor `
                -Refactor $refactorDefinition `
                -FilesToAdd $FilesToAdd
        }
    }
}
################################################################################