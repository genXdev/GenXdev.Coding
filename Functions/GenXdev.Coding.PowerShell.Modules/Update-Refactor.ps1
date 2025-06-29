################################################################################
<#
.SYNOPSIS
Updates and manages refactoring sets including file selection and processing.

.DESCRIPTION
Provides comprehensive management of refactoring sets by:
- Adding or removing files from processing queues
- Cleaning up deleted files from the set
- Managing state information and progress tracking
- Handling LLM-based file selection and processing
- Supporting both automatic and manual file management
- Maintaining detailed logs of all operations

.PARAMETER Name
Names of refactor sets to update, accepts wildcards. Default is "*".

.PARAMETER Refactor
Direct input of refactor set objects instead of loading by name.

.PARAMETER FilesToAdd
Files to add to the processing queue.

.PARAMETER FilesToRemove
Files to remove from the processing queue.

.PARAMETER CleanUpDeletedFiles
Remove entries for files that no longer exist on disk.

.PARAMETER AskBeforeLLMSelection
Prompt before launching LLM invocations for file selections.

.PARAMETER PerformLLMSelections
Enable LLM-based file selection processing.

.PARAMETER PerformAllLLMSelections
Process all files in the refactor set with LLM.

.PARAMETER RetryFailedLLMSelections
Retry previously failed LLM selections.

.PARAMETER Reset
Start processing from beginning of refactor set.

.PARAMETER Clear
Remove all files from the refactor set.

.PARAMETER ClearLog
Clear the refactor set's operation log.

.PARAMETER ResetLMSelections
Restart all LLM selections from beginning.

.PARAMETER MarkAllCompleted
Mark all files as successfully refactored.

.PARAMETER SelectByModifiedDateFrom
Select files modified on or after this date.

.PARAMETER SelectByModifiedDateTo
Select files modified on or before this date.

.PARAMETER SelectByCreationDateFrom
Select files created on or after this date.

.PARAMETER SelectByCreationDateTo
Select files created on or before this date.

.PARAMETER RedoLast
Reprocess the last refactoring operation.

.PARAMETER PromptKey
Key identifying which prompt script to use.

.PARAMETER Prompt
Direct prompt text to use for processing.

.PARAMETER SelectionScript
PowerShell script for file selection logic.

.PARAMETER AutoAddModifiedFiles
Automatically add modified files to processing queue.

.PARAMETER SelectionPrompt
Content for LLM-based selection prompts.

.PARAMETER Model
LLM model identifier for LM-Studio.

.PARAMETER ModelLMSGetIdentifier
Model retrieval identifier for LM-Studio.

.PARAMETER Temperature
Temperature setting for response randomness (0.0-1.0).

.PARAMETER MaxToken
Maximum tokens allowed in responses (-1 for default).

.PARAMETER TTLSeconds
Time-to-live in seconds for API model requests.

.PARAMETER Gpu
GPU processing control (-2=Auto, -1=LM-Studio default).

.PARAMETER Force
Force stop LM-Studio before initialization.

.PARAMETER ApiEndpoint
API endpoint URL for LLM service.

.PARAMETER ApiKey
Authentication key for API access.

.PARAMETER Priority
Processing priority level for this refactor set.

.PARAMETER ExposedCmdlets
PowerShell commands available during LLM selection.

.PARAMETER Code
Open file in Visual Studio Code.

.PARAMETER VisualStudio
Open file in Visual Studio.

.PARAMETER KeysToSend
Keystrokes to send after opening file.

.PARAMETER Speak
Enable text-to-speech for operation details.

.EXAMPLE
Update-Refactor -Name "CodeCleanup" -FilesToAdd ".\src\*.cs" `
    -CleanUpDeletedFiles -PerformLLMSelections

.EXAMPLE
Get-Refactor "MyRefactor" | Update-Refactor -Reset -Clear
#>
function Update-Refactor {

    [CmdletBinding(DefaultParameterSetName = 'Name', SupportsShouldProcess)]
    [Alias("updaterefactor")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSAvoidUsingInvokeExpression',
        '',
        Justification = 'Required for dynamic script execution in refactoring context')]
    param (
        ########################################################################
        [Parameter(
            ParameterSetName = 'Name',
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The name of the refactor, accepts wildcards",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $Name = @("*"),
        ########################################################################
        [Parameter(
            ParameterSetName = 'Refactor',
            Mandatory = $false,
            Position = 0,
            HelpMessage = "The refactor set to update")]
        [ValidateNotNull()]
        [GenXdev.Helpers.RefactorDefinition[]]$Refactor,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Filenames to add")]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToAdd = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "Filenames to remove")]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToRemove = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Clean up deleted files")]
        [switch] $CleanUpDeletedFiles,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Switch to suppress user interaction")]
        [switch] $AskBeforeLLMSelection,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Switch to enable LLM-based file selection processing")]
        [switch] $PerformLLMSelections,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Switch to process all files in the refactor set")]
        [switch] $PerformAllLLMSelections,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Switch to retry failed LLM selections")]
        [switch] $RetryFailedLLMSelections,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Clear all files from the refactor set")]
        [switch] $Clear,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Clear the log of the refactor set")]
        [switch] $ClearLog,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Start from the beginning of the refactor set")]
        [switch] $Reset,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Restart all LLMSelections")]
        [switch] $ResetLMSelections,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Mark all files as refactored")]
        [switch] $MarkAllCompleted,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Select files by modified date from")]
        [ValidateNotNullOrEmpty()]
        [datetime] $SelectByModifiedDateFrom,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Select files by modified date to")]
        [ValidateNotNullOrEmpty()]
        [datetime] $SelectByModifiedDateTo,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Select files by creation date from")]
        [ValidateNotNullOrEmpty()]
        [datetime] $SelectByCreationDateFrom,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Select files by creation date to")]
        [ValidateNotNullOrEmpty()]
        [datetime] $SelectByCreationDateTo,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Redo the last refactor")]
        [switch] $RedoLast,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The prompt key indicates which prompt script to use")]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The prompt key indicates which prompt script to use")]
        [ValidateNotNullOrEmpty()]
        [string] $Prompt = "",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Powershell script for function to select items to " +
            "refactor")]
        [ValidateNotNullOrEmpty()]
        [string] $SelectionScript,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Will automatically add modified files to the queue")]
        [switch] $AutoAddModifiedFiles,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "If provided, will invoke LLM to do the selection " +
            "based on the content of the script")]
        [ValidateNotNullOrEmpty()]
        [string] $SelectionPrompt,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The LM-Studio model to use")]
        [SupportsWildcards()]
        [string] $Model,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Identifier for getting specific model from LM Studio")]
        [string] $ModelLMSGetIdentifier,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Temperature for response randomness (0.0-1.0)")]
        [ValidateRange(0.0, 1.0)]
        [double] $Temperature = 0.2,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Maximum tokens in response (-1 for default)")]
        [Alias("MaxTokens")]
        [int] $MaxToken = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Set a TTL (in seconds) for models via API requests")]
        [Alias("ttl")]
        [int] $TTLSeconds = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "GPU offloading control (-2=Auto, -1=LMStudio decide)")]
        [int] $Gpu = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Force stop LM Studio before initialization")]
        [switch] $Force,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Api endpoint url for LLM service")]
        [string] $ApiEndpoint,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The API key to use for the request")]
        [string] $ApiKey,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Priority for this refactor set")]
        [ValidateNotNullOrEmpty()]
        [int] $Priority,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Array of PowerShell command definitions to use as tools " +
            "during LLM selection")]
        [GenXdev.Helpers.ExposedCmdletDefinition[]]
        $ExposedCmdLets = @(),
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The ide to open the file in")]
        [Alias("c")]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open in Visual Studio")]
        [Alias("vs")]
        [switch] $VisualStudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The keys to invoke as key strokes after opening the file")]
        [Alias("keys")]
        [string[]] $KeysToSend = @(),
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Speak out the details of next refactor")]
        [switch] $Speak
        ########################################################################
    )

    begin {

        $modulesPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\"

        # log start of operation
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Update-Refactor operation"

        # load refactor set by name if not provided directly
        if ($PSCmdlet.ParameterSetName -eq 'Name') {
            $Refactor = @(
                GenXdev.Coding\Get-Refactor -Name $Name |
                Microsoft.PowerShell.Utility\Sort-Object -Property Priority -Descending
            )
        }

        # exit if no refactor set found
        if ($null -eq $Refactor -or $Refactor.Count -eq 0) {

            Microsoft.PowerShell.Utility\Write-Warning "No refactorset found"
            return
        }

        # initialize tracking variables for file operations
        $now = GenXdev.Console\UtcNow
        $script:filesAdded = 0
        $script:filesRemoved = 0
        $script:onlyFirst = -not $PerformAllLLMSelections
        $script:last = $null;
    }


process {

        # process each refactor definition
        foreach ($refactorDefinition in $Refactor) {

            # check containers
            if ($Clear -or ($null -eq $refactorDefinition.State.Unselected)) {

                $refactorDefinition.State.Unselected = @()
            }

            if ($Clear -or ($null -eq $refactorDefinition.State.Selected)) {

                $refactorDefinition.State.Selected = @()
            }

            if ($Clear -or ($null -eq $refactorDefinition.State.Refactored)) {

                $refactorDefinition.State.Refactored = @()
            }

            if ($null -eq $refactorDefinition.Log) {

                $refactorDefinitionrefactorDefinition.Log = @()
            }

            if ($ClearLog) {

                $null = $refactorDefinition.Log.Clear()
                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Log cleared"
                    }
                )
            }

            if ($Clear) {

                $refactorDefinition.State.RefactoredIndex = -1
                $refactorDefinition.State.SelectedIndex = -1
                $refactorDefinition.State.UnselectedIndex = -1
                $refactorDefinition.State.PercentageComplete = 0
                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Refactor set cleared"
                    }
                )
            }

            # update prompt key if specified
            if ($PSBoundParameters.ContainsKey('PromptKey')) {
                if ($refactorDefinition.RefactorSettings.PromptKey -ne $PromptKey) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Prompt key changed from '$($refactorDefinition.RefactorSettings.PromptKey))' to '$PromptKey'"
                        }
                    )

                    $refactorDefinition.RefactorSettings.PromptKey = $PromptKey
                }
            }
            if ($PSBoundParameters.ContainsKey('Prompt')) {

                if ($refactorDefinition.RefactorSettings.Prompt -ne $Prompt) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Prompt changed from '$($refactorDefinition.RefactorSettings.Prompt))' to '$Prompt'"
                        }
                    )
                    $refactorDefinition.RefactorSettings.Prompt = $Prompt
                }
            }
            if ($PSBoundParameters.ContainsKey('SelectionScript')) {

                if ($refactorDefinition.SelectionSettings.Script -ne $SelectionScript) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Selection script changed from '$($refactorDefinition.SelectionSettings.SelectionScript))' to '$SelectionScript'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.Script = $SelectionScript
                }
            }
            if ($PSBoundParameters.ContainsKey('AutoAddModifiedFiles')) {

                if ($refactorDefinition.SelectionSettings.AutoAddModifiedFiles -ne $AutoAddModifiedFiles) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Selection script changed from '$($refactorDefinition.SelectionSettings.AutoAddModifiedFiles))' to '$AutoAddModifiedFiles'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.AutoAddModifiedFiles = $AutoAddModifiedFiles
                }
            }
            if ($PSBoundParameters.ContainsKey('SelectionPrompt')) {

                if ($refactorDefinition.SelectionSettings.LLM.Prompt -ne $SelectionPrompt) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Selection prompt changed from '$($refactorDefinition.SelectionSettings.LLM.Prompt))' to '$SelectionPrompt'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.Prompt = $SelectionPrompt
                }
            }
            if ($PSBoundParameters.ContainsKey('Model')) {

                if ($refactorDefinition.SelectionSettings.LLM.Model -ne $Model) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Model changed from '$($refactorDefinition.SelectionSettings.LLM.Model))' to '$Model'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.Model = $Model
                }
            }
            if ($PSBoundParameters.ContainsKey('ModelLMSGetIdentifier')) {

                if ($refactorDefinition.SelectionSettings.LLM.ModelLMSGetIdentifier -ne $ModelLMSGetIdentifier) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "ModelLMSGetIdentifier changed from '$($refactorDefinition.SelectionSettings.LLM.ModelLMSGetIdentifier))' to '$ModelLMSGetIdentifier'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.ModelLMSGetIdentifier = $ModelLMSGetIdentifier
                }
            }
            if ($PSBoundParameters.ContainsKey('Temperature')) {

                if ($refactorDefinition.SelectionSettings.LLM.Temperature -ne $Temperature) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Temperature changed from '$($refactorDefinition.SelectionSettings.LLM.Temperature))' to '$Temperature'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.Temperature = $Temperature
                }
            }
            if ($PSBoundParameters.ContainsKey('MaxToken')) {

                if ($refactorDefinition.SelectionSettings.LLM.MaxToken -ne $MaxToken) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "MaxToken changed from '$($refactorDefinition.SelectionSettings.LLM.MaxToken))' to '$MaxToken'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.MaxToken = $MaxToken
                }
            }
            if ($PSBoundParameters.ContainsKey('TTLSeconds')) {

                if ($refactorDefinition.SelectionSettings.LLM.TTLSeconds -ne $TTLSeconds) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "TTLSeconds changed from '$($refactorDefinition.SelectionSettings.LLM.TTLSeconds))' to '$TTLSeconds'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.TTLSeconds = $TTLSeconds
                }
            }
            if ($PSBoundParameters.ContainsKey('Gpu')) {

                if ($refactorDefinition.SelectionSettings.LLM.Gpu -ne $Gpu) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Gpu changed from '$($refactorDefinition.SelectionSettings.LLM.Gpu))' to '$Gpu'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.Gpu = $Gpu
                }
            }
            if ($PSBoundParameters.ContainsKey('Force')) {

                if ($refactorDefinition.SelectionSettings.LLM.Force -ne $Force) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Force changed from '$($refactorDefinition.SelectionSettings.LLM.Force))' to '$Force'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.Force = $Force
                }
            }
            if ($PSBoundParameters.ContainsKey('ApiEndpoint')) {

                if ($refactorDefinition.SelectionSettings.LLM.ApiEndpoint -ne $ApiEndpoint) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "ApiEndpoint changed from '$($refactorDefinition.SelectionSettings.LLM.ApiEndpoint))' to '$ApiEndpoint'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.ApiEndpoint = $ApiEndpoint
                }
            }
            if ($PSBoundParameters.ContainsKey('ApiKey')) {

                if ($refactorDefinition.SelectionSettings.LLM.ApiKey -ne $ApiKey) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "ApiKey changed from '$($refactorDefinition.SelectionSettings.LLM.ApiKey))' to '$ApiKey'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.ApiKey = $ApiKey
                }
            }
            if ($PSBoundParameters.ContainsKey('ExposedCmdLets')) {

                if ($refactorDefinition.SelectionSettings.LLM.ExposedCmdLets -ne $ExposedCmdLets) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "ExposedCmdLets changed from '$($refactorDefinition.SelectionSettings.LLM.ExposedCmdLets))' to '$ExposedCmdLets'"
                        }
                    )
                    $refactorDefinition.SelectionSettings.LLM.ExposedCmdLets = $ExposedCmdLets
                }
            }
            if ($PSBoundParameters.ContainsKey("Priority")) {

                if ($refactorDefinition.Priority -ne $Priority) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Priority changed from '$($refactorDefinition.Priority))' to '$Priority'"
                        }
                    )
                    $refactorDefinition.Priority = $Priority
                }
            }
            if ($PSBoundParameters.ContainsKey('KeysToSend')) {

                if ($refactorDefinition.RefactorSettings.KeysToSend -ne $KeysToSend) {

                    $null = $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "KeysToSend changed from '$($refactorDefinition.RefactorSettings.KeysToSend))' to '$KeysToSend'"
                        }
                    )
                    $refactorDefinition.RefactorSettings.KeysToSend = $KeysToSend
                }
            }
            $newCode = $PSBoundParameters.ContainsKey("Code") ? ($Code ? 1 : 0) : -1;
            if ($refactorDefinition.RefactorSettings.Code -ne $newCode) {

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Code changed from '$($refactorDefinition.RefactorSettings.Code))' to '$newCode'"
                    }
                )
                $refactorDefinition.RefactorSettings.Code = $newCode
            }

            $newVisualStudio = $PSBoundParameters.ContainsKey("VisualStudio") ? ($VisualStudio ? 1 : 0) : -1;
            if ($refactorDefinition.RefactorSettings.VisualStudio -ne $newVisualStudio) {

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "VisualStudio changed from '$($refactorDefinition.RefactorSettings.VisualStudio))' to '$newVisualStudio'"
                    }
                )

                $refactorDefinition.RefactorSettings.VisualStudio = $newVisualStudio
            }

            if ($null -ne $SelectByModifiedDateFrom) {

                # copy all refactored files to FilesToAdd
                $FilesToAdd += @(
                    $refactorDefinition.State.Refactored | Microsoft.PowerShell.Core\ForEach-Object {

                        if ([string]::IsNullOrWhiteSpace($_)) { return }
                        $fi = [System.IO.FileInfo]::new($_);

                        if ($fi.Exists -and $fi.LastWriteTime -ge $SelectByModifiedDateFrom) {

                            $fi
                        }
                    }
                );

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "New file selection made: Redo all files modifief from date '$SelectByModifiedDateFrom'"
                    }
                )
            }

            if ($null -ne $SelectByModifiedDateTo) {

                # copy all refactored files to FilesToAdd
                $FilesToAdd += @(
                    $refactorDefinition.State.Refactored | Microsoft.PowerShell.Core\ForEach-Object {

                        if ([string]::IsNullOrWhiteSpace($_)) { return }

                        $fi = [System.IO.FileInfo]::new($_);

                        if ($fi.Exists -and $fi.LastWriteTime -lt $SelectByModifiedDateFrom) {

                            $fi
                        }
                    }
                );

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "New file selection made: Redo all files modifief to date '$SelectByModifiedDateTo'"
                    }
                )
            }

            if ($null -ne $SelectByCreationDateFrom) {

                # copy all refactored files to FilesToAdd
                $FilesToAdd += @(
                    $refactorDefinition.State.Refactored | Microsoft.PowerShell.Core\ForEach-Object {

                        if ([string]::IsNullOrWhiteSpace($_)) { return }

                        $fi = [System.IO.FileInfo]::new($_);

                        if ($fi.Exists -and $fi.CreationTime -ge $SelectByModifiedDateFrom) {

                            $fi
                        }
                    }
                );

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "New file selection made: Redo all files created from date '$SelectByCreationDateFrom'"
                    }
                )
            }

            if ($null -ne $SelectByCreationDateTo) {

                # copy all refactored files to FilesToAdd
                $FilesToAdd += @(
                    $refactorDefinition.State.Refactored | Microsoft.PowerShell.Core\ForEach-Object {

                        if ([string]::IsNullOrWhiteSpace($_)) { return }

                        $fi = [System.IO.FileInfo]::new($_);

                        if ($fi.Exists -and $fi.CreationTime -lt $SelectByModifiedDateFrom) {

                            $fi
                        }
                    }
                );

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "New file selection made: Redo all files created to date '$SelectByCreationDateTo'"
                    }
                )
            }

            if ($RedoLast -and $refactorDefinition.State.Refactored.Count -gt 0) {

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Redoing last refactor"
                    }
                )

                $refactorDefinition.State.RefactoredIndex = [Math]::Max(-1,
                    $refactorDefinition.State.RefactoredIndex - 1)
            }
            elseif ($Reset) {

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Resetting refactor set"
                    }
                )
                $refactorDefinition.State.RefactoredIndex = -1
                $refactorDefinition.State.Selected = @(@(
                        $refactorDefinition.State.Selected +
                        $refactorDefinition.State.Refactored
                    ) | Microsoft.PowerShell.Utility\Select-Object -Unique)
                $null = $refactorDefinition.State.Refactored.Clear();
            }

            if ($MarkAllCompleted) {

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Marking all files as refactored"
                    }
                )

                $refactorDefinition.State.Refactored = @(@(
                        $refactorDefinition.State.Refactored +
                        $refactorDefinition.State.Selected
                    ) | Microsoft.PowerShell.Utility\Select-Object -Unique)
                $null = $refactorDefinition.State.Selected.Clear();
                $refactorDefinition.State.SelectedIndex = $refactorDefinition.State.Selected.Count - 1;
                $refactorDefinition.State.RefactoredIndex = $refactorDefinition.State.Refactored.Count - 1;
                $refactorDefinition.State.PercentageComplete = 100;
            }

            if ($ResetLMSelections) {

                $null = $refactorDefinition.Log.Add(
                    [GenXdev.Helpers.RefactorLogItem]@{
                        Timestamp = $now
                        Message   = "Resetting LLM selections"
                    }
                )

                $refactorDefinition.State.SelectedIndex = -1;
                $refactorDefinition.State.Unselected = @(@(
                        $refactorDefinition.State.Unselected +
                        $refactorDefinition.State.Selected
                    ) | Microsoft.PowerShell.Utility\Select-Object -Unique)
                $null = $refactorDefinition.State.Selected.Clear();
            }

            Microsoft.PowerShell.Utility\Write-Verbose "Processing refactor definition: $($refactorDefinition.Name)"

            # execute selection script to get automatically selected files
            [System.IO.FileInfo[]] $automaticFiles = ($null = @(
                    if (-not [string]::IsNullOrWhiteSpace(
                            $refactorDefinition.SelectionSettings.Script)) {

                        Microsoft.PowerShell.Utility\Write-Verbose "Executing selection script"
                        if (-not $Clear) {

                            Microsoft.PowerShell.Utility\Invoke-Expression -Command $refactorDefinition.SelectionSettings.Script
                        }
                    }
                ) + @($FilesToAdd | Microsoft.PowerShell.Core\ForEach-Object {

                        if ($null -ne $_) {

                            $item = Microsoft.PowerShell.Management\Get-Item -Path (GenXdev.FileSystem\Expand-Path $_) -ErrorAction SilentlyContinue
                            if ($null -ne $item) {

                                $item
                            }
                        }
                    })) |
            Microsoft.PowerShell.Utility\Sort-Object -Property FullName -Unique |
            Microsoft.PowerShell.Utility\Sort-Object -Property LastWriteTimeUtc;

            if ($null -ne $automaticFiles) {

                # process new files to be added
                @($automaticFiles) | Microsoft.PowerShell.Core\ForEach-Object {

                    if ($null -eq $_ ) { return }

                    # check if file exists in any collection
                    $indexRefactored = $refactorDefinition.State.Refactored.IndexOf($_)
                    $indexSelected = $refactorDefinition.State.Selected.IndexOf($_)
                    $indexUnselected = $refactorDefinition.State.Unselected.IndexOf($_)

                    # add file if not already present
                    if ($indexRefactored -lt 0 -and $indexSelected -lt 0 -and
                        $indexUnselected -lt 0) {

                        # add to selected if no LLM prompt, otherwise to unselected
                        if ([string]::IsNullOrWhiteSpace(
                                $refactorDefinition.SelectionSettings.LLM.Prompt)) {

                            $null = $refactorDefinition.State.Selected.Add($_)
                        }
                        else {

                            $null = $refactorDefinition.State.Unselected.Add($_)
                        }

                        $script:filesAdded++
                        return;
                    }

                    if ((($null -ne $FilesToAdd) -and ($FilesToAdd.IndexOf($_) -ge 0)) -or (
                            $refactorDefinition.SelectionSettings.AutoAddModifiedFiles -and
                        ($refactorDefinition.State.LastUpdated -lt ($_.LastWriteTimeUtc.AddMinutes(-15))
                    )
                        )) {

                        if ($indexRefactored -ge 0) {

                            $null = $refactorDefinition.State.Refactored.RemoveAt($indexRefactored)
                            if ($indexRefactored -le $refactorDefinition.State.RefactoredIndex) {

                                $refactorDefinition.State.RefactoredIndex = [Math]::Max(-1,
                                    $refactorDefinition.State.RefactoredIndex - 1)
                            }
                            $indexRefactored = -1;
                            if ($indexSelected -lt 0) {

                                $null = $refactorDefinition.State.Selected.Add($_)
                            }
                        }
                    }
                }
            }

            # process files marked for removal
            $FilesToRemove | Microsoft.PowerShell.Core\ForEach-Object {

                # locate file in collections
                $indexRefactored = $refactorDefinition.State.Refactored.IndexOf($_)
                $indexSelected = $refactorDefinition.State.Selected.IndexOf($_)
                $indexUnselected = $refactorDefinition.State.Unselected.IndexOf($_)

                # remove from refactored collection and update index
                if ($indexRefactored -ge 0) {

                    $target = "File: $($_)"
                    $action = "Remove from refactored set"

                    if ($PSCmdlet.ShouldProcess($target, $action)) {
                        $null = $refactorDefinition.State.Refactored.RemoveAt($indexRefactored)
                        if ($indexRefactored -le $refactorDefinition.State.RefactoredIndex) {

                            $refactorDefinition.State.RefactoredIndex = [Math]::Max(-1,
                                $refactorDefinition.State.RefactoredIndex - 1)
                        }
                        $indexRefactored = -1
                        $script:filesRemoved++
                    }
                }

                # remove from selected collection and update index
                if ($indexSelected -ge 0) {

                    $null = $refactorDefinition.State.Selected.RemoveAt($indexSelected)
                    if ($indexSelected -le $refactorDefinition.State.SelectedIndex) {

                        $refactorDefinition.State.SelectedIndex = [Math]::Max(-1,
                            $refactorDefinition.State.SelectedIndex - 1)
                    }
                    $indexSelected = -1
                }

                # remove from unselected collection and update index
                if ($indexUnselected -ge 0) {

                    $null = $refactorDefinition.State.Unselected.RemoveAt($indexUnselected)
                    if ($indexUnselected -le $refactorDefinition.State.UnselectedIndex) {

                        $refactorDefinition.State.UnselectedIndex = [Math]::Max(-1,
                            $refactorDefinition.State.UnselectedIndex - 1)
                    }
                    $indexUnselected = -1
                }
            }

            # migrate folder names
            for ($refactoredIndex = $refactorDefinition.State.Refactored.Count - 1;
                $refactoredIndex -ge 0; $refactoredIndex--) {

                if ($null -eq $refactorDefinition.State.Refactored[$refactoredIndex]) {

                    $null = $refactorDefinition.State.Refactored.RemoveAt($refactoredIndex)

                }
                else {
                    $path = (GenXdev.FileSystem\Expand-Path ($refactorDefinition.State.Refactored[$refactoredIndex]))

                    if ($path.StartsWith("$modulesPath\GenXdev")) {

                        $parts = $path.Substring($modulesPath.Length).Split("\", [System.StringSplitOptions]::RemoveEmptyEntries);

                        if ($parts.Length -gt 1) {
                            [Version] $version = $null
                            if ([Version]::tryParse($parts[1], [ref]$version)) {

                                $path = "$modulesPath\$($parts[0])\1.192.2025\$($path.Substring($modulesPath.Length + $parts[0].Length+ $parts[1].Length + 2))"

                                if ($refactorDefinition.State.Refactored.IndexOf($path) -lt 0) {

                                    $refactorDefinition.State.Refactored[$refactoredIndex] = $path
                                }
                                else {
                                    $null = $refactorDefinition.State.Refactored.RemoveAt($refactoredIndex)

                                    if ($refactoredIndex -le $refactorDefinition.State.RefactoredIndex) {

                                        $refactorDefinition.State.RefactoredIndex = [Math]::Max(-1,
                                            $refactorDefinition.State.RefactoredIndex - 1)
                                    }
                                }
                            }
                        }
                    }
                }
            }

           # migrate folder names
            for ($selectedIndex = $refactorDefinition.State.Selected.Count - 1;
                $selectedIndex -ge 0; $selectedIndex--) {
                if ($null -eq $refactorDefinition.State.Selected[$selectedIndex]) {

                    $null = $refactorDefinition.State.Selected.RemoveAt($selectedIndex)

                }
                else {
                    $path = (GenXdev.FileSystem\Expand-Path $refactorDefinition.State.Selected[$selectedIndex])

                        if ($path.StartsWith("$modulesPath\GenXdev")) {

                            $parts = $path.Substring($modulesPath.Length).Split("\", [System.StringSplitOptions]::RemoveEmptyEntries);

                            if ($parts.Length -gt 1) {
                                [Version] $version = $null

                                if ([Version]::tryParse($parts[1], [ref]$version)) {

                                    $path = "$modulesPath\$($parts[0])\1.192.2025\$($path.Substring($modulesPath.Length + $parts[0].Length+ $parts[1].Length + 2))"

                                    if ($refactorDefinition.State.Selected.IndexOf($path) -lt 0) {

                                        $refactorDefinition.State.Selected[$selectedIndex] = $path
                                    }
                                    else {
                                        $null = $refactorDefinition.State.Selected.RemoveAt($selectedIndex)

                                        if ($selectedIndex -le $refactorDefinition.State.SelectedIndex) {

                                            $refactorDefinition.State.SelectedIndex = [Math]::Max(-1,
                                                $refactorDefinition.State.SelectedIndex - 1)
                                        }
                                    }
                                }
                            }
                        }
                    }
            }

            # migrate folder names
            for ($unselectedIndex = $refactorDefinition.State.Unselected.Count - 1;
                $unselectedIndex -ge 0; $unselectedIndex--) {

                if ($null -eq $refactorDefinition.State.Unselected[$unselectedIndex]) {

                    $null = $refactorDefinition.State.Unselected.RemoveAt($unselectedIndex)
                }
                else {
                    $path = (GenXdev.FileSystem\Expand-Path $refactorDefinition.State.Unselected[$unselectedIndex])

                    if ($path.StartsWith("$modulesPath\GenXdev")) {

                        $parts = $path.Substring($modulesPath.Length).Split("\", [System.StringSplitOptions]::RemoveEmptyEntries);

                        if ($parts.Length -gt 1) {
                            [Version] $version = $null
                            if ([Version]::tryParse($parts[1], [ref]$version)) {

                                $path = "$modulesPath\$($parts[0])\1.192.2025\$($path.Substring($modulesPath.Length + $parts[0].Length+ $parts[1].Length + 2))"

                                if ($refactorDefinition.State.Unselected.IndexOf($path) -lt 0) {

                                    $refactorDefinition.State.Unselected[$unselectedIndex] = $path
                                }
                                else {
                                    $null = $refactorDefinition.State.Unselected.RemoveAt($unselectedIndex)

                                    if ($unselectedIndex -le $refactorDefinition.State.UnselectedIndex) {

                                        $refactorDefinition.State.UnselectedIndex = [Math]::Max(-1,
                                            $refactorDefinition.State.UnselectedIndex - 1)
                                    }
                                }
                            }
                        }
                    }
                }
            }

            # clean up deleted files if requested
            if ($CleanUpDeletedFiles) {

                # clean refactored collection
                for ($refactoredIndex = $refactorDefinition.State.Refactored.Count - 1;
                    $refactoredIndex -ge 0; $refactoredIndex--) {

                    if ($null -eq $refactorDefinition.State.Refactored[$refactoredIndex]) {

                        $null = $refactorDefinition.State.Refactored.RemoveAt($refactoredIndex)

                    }
                    else {
                        $path = (GenXdev.FileSystem\Expand-Path ($refactorDefinition.State.Refactored[$refactoredIndex]))

                        if (-not [IO.Path]::Exists($path)) {

                            $null = $refactorDefinition.State.Refactored.RemoveAt($refactoredIndex)
                        }
                    }

                    if ($refactorDefinition.State.RefactoredIndex -lt $refactoredIndex) {

                        $refactorDefinition.State.RefactoredIndex = [Math]::Max(-1,
                            $refactorDefinition.State.RefactoredIndex - 1)
                    }
                }

                # clean selected collection
                for ($selectedIndex = $refactorDefinition.State.Selected.Count - 1;
                    $selectedIndex -ge 0; $selectedIndex--) {

                    $path = (GenXdev.FileSystem\Expand-Path $refactorDefinition.State.Selected[$selectedIndex])

                    if (-not [IO.Path]::Exists($path)) {

                        $null = $refactorDefinition.State.Selected.RemoveAt($selectedIndex)
                    }

                    if ($refactorDefinition.State.SelectedIndex -lt $selectedIndex) {

                        $refactorDefinition.State.SelectedIndex = [Math]::Max(-1,
                            $refactorDefinition.State.SelectedIndex - 1)
                    }
                }

                # clean unselected collection
                for ($unselectedIndex = $refactorDefinition.State.Unselected.Count - 1;
                    $unselectedIndex -ge 0; $unselectedIndex--) {

                    $path = (GenXdev.FileSystem\Expand-Path $refactorDefinition.State.Unselected[$unselectedIndex])

                    if (-not [IO.Path]::Exists($path)) {

                        $null = $refactorDefinition.State.Unselected.RemoveAt($unselectedIndex)
                    }

                    if ($refactorDefinition.State.UnselectedIndex -lt $unselectedIndex) {

                        $refactorDefinition.State.UnselectedIndex = [Math]::Max(-1,
                            $refactorDefinition.State.UnselectedIndex - 1)
                    }
                }
            }

            # handle llm selections if enabled
            if ((-not [string]::IsNullOrWhiteSpace($refactorDefinition.SelectionSettings.LLM.Prompt)) -and
               (!!$PerformLLMSelections -or !!$PerformAllLLMSelections)) {

                if (((-not $AskBeforeLLMSelection) -or ($refactorDefinition.State.Selected.Count -eq 0)) -and
                    $refactorDefinition.State.Unselected.Count -ge 0) {

                    $userAnswer = 1;

                    if ($AskBeforeLLMSelection -and (-not $Script:_AlwaysRunLLMDuringRefactors)) {

                        if ($Speak) {

                            GenXdev.Console\Start-TextToSpeech "What to do next?"
                        }

                        $userAnswer = $host.ui.PromptForChoice(
                            "There are only files left that need an LLM invocation",
                            "What to do next?",
                            @("&Allways run invocations", "&Run all invocation now", "&Run invocation", "&Don't invoke now"),
                            0
                        )
                    }

                    if ($userAnswer -eq 0) {

                        $Script:_AlwaysRunLLMDuringRefactors = $true
                    }
                    if ($userAnswer -eq 1) {

                        $script:onlyFirst = $false
                    }
                    elseif ($userAnswer -eq 3) {

                        continue
                    }

                    if ($RetryFailedLLMSelections) {

                        $refactorDefinition.State.UnselectedIndex = -1;
                    }
                }

                $refactorDefinition.State.UnselectedIndex++;

                $script:nextFile = $refactorDefinition.State.Unselected[$refactorDefinition.State.UnselectedIndex];
                function goNext {

                    $script:nextFile = $null;

                    while ($refactorDefinition.State.UnselectedIndex -lt $refactorDefinition.State.Unselected.Count -and
                            ($null -eq $script:nextFile -or ((-not [IO.File]::Exists($script:nextFile))))) {

                        $refactorDefinition.State.UnselectedIndex = [Math]::Min(
                            $refactorDefinition.State.UnselectedIndex + 1,
                            $refactorDefinition.State.Unselected.Count - 1
                        )

                        if ($refactorDefinition.State.UnselectedIndex -lt $refactorDefinition.State.Unselected.Count) {

                            $script:nextFile = $refactorDefinition.State.Unselected[$refactorDefinition.State.UnselectedIndex];
                        }
                        else {

                            $script:nextFile = $null;
                        }
                    }
                }

                goNext

                while (($null -ne $script:nextFile) -and ($script:last -ne $script:nextFile)) {

                    try {
                        # Create a string builder for verbose output
                        $verboseOutput = [System.Text.StringBuilder]::new()

                        # Create a scriptblock to capture verbose output
                        $verboseScriptBlock = {
                            param($Message)
                            $null = $verboseOutput.AppendLine($Message)
                        }

                        # Register temporary verbose handler
                        $null = Microsoft.PowerShell.Utility\Register-EngineEvent -SourceIdentifier "Verbose" -Action $verboseScriptBlock

                        # Run the test and get the result
                        $result = GenXdev.Coding\Test-RefactorLLMSelection `
                            -RefactorDefinition $refactorDefinition `
                            -Path ($script:nextFile)

                    }
                    catch {
                        $result = $false
                        $now = GenXdev.Console\UtcNow
                        $refactorDefinition.Log.Add(
                            [GenXdev.Helpers.RefactorLogItem]@{
                                Timestamp = $now
                                Message   = "Error during LLM selection of file '$($script:nextFile)' : $($_.Exception.Message)"
                            }
                        )
                    }
                    finally {
                        # Clean up verbose handling
                        $null = Microsoft.PowerShell.Utility\Unregister-Event -SourceIdentifier "Verbose" -ErrorAction SilentlyContinue
                    }

                    if ($result -eq $true) {

                        $now = GenXdev.Console\UtcNow
                        $refactorDefinition.Log.Add(
                            [GenXdev.Helpers.RefactorLogItem]@{
                                Timestamp = $now
                                Message   = "File '$($script:nextFile)' was selected by LLM for refactoring`n$($verboseOutput.ToString())"
                            }
                        )

                        $indexRefactored = $refactorDefinition.State.Refactored.IndexOf(($script:nextFile))
                        $indexSelected = $refactorDefinition.State.Selected.IndexOf(($script:nextFile))
                        $indexUnselected = $refactorDefinition.State.Unselected.IndexOf(($script:nextFile))

                        if ($indexSelected -lt 0) {

                            $null = $refactorDefinition.State.Selected.Add(($script:nextFile))
                        }

                        if ($indexUnselected -ge 0) {

                            $null = $refactorDefinition.State.Unselected.RemoveAt($indexUnselected)

                            if ($indexUnselected -le $refactorDefinition.State.UnselectedIndex) {

                                $refactorDefinition.State.UnselectedIndex = [Math]::Max(-1,
                                    $refactorDefinition.State.UnselectedIndex - 1)
                            }
                        }

                        if ($indexRefactored -ge 0) {

                            $refactorDefinition.State.Refactored.RemoveAt($indexRefactored)
                            if ($indexRefactored -le $refactorDefinition.State.RefactoredIndex) {

                                $refactorDefinition.State.RefactoredIndex = [Math]::Max(-1,
                                    $refactorDefinition.State.RefactoredIndex - 1)
                            }
                        }

                        # persist changes to preferences
                        if ($PSCmdlet.ShouldProcess(
                                "Refactor set: $($refactorDefinition.Name)",
                                "Save changes")) {

                            $json = $refactorDefinition | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10 -Compress
                            $latestJson = (GenXdev.Data\Get-GenXdevPreference `
                                    -Name "refactor_set_$($refactorDefinition.Name)"
                            )
                            if ($null -eq $latestJson) {

                                Microsoft.PowerShell.Utility\Write-Warning "Refactor set has been deleted"
                                break;
                            }

                            $latest = $latestJson | Microsoft.PowerShell.Utility\ConvertFrom-Json -ErrorAction SilentlyContinue
                            if ($null -ne $latest -and ($latest.State.LastUpdated -gt $refactorDefinition.State.LastUpdated)) {

                                $latest.State = $refactorDefinition.State;
                                $latest.Log = $refactorDefinition.Log;

                                $refactorDefinition = $latest;
                            }

                            $now = GenXdev.Console\UtcNow
                            $refactorDefinition.State.LastUpdated = $now
                            $json = $refactorDefinition | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10 -Compress
                            GenXdev.Data\Set-GenXdevPreference `
                                -Name "refactor_set_$($refactorDefinition.Name)" `
                                -Value $json
                        }

                        if ($script:onlyFirst) {

                            break
                        }
                    }
                    else {
                        $now = GenXdev.Console\UtcNow
                        $refactorDefinition.Log.Add(
                            [GenXdev.Helpers.RefactorLogItem]@{
                                Timestamp = $now
                                Message   = "File '$($script:nextFile)' was NOT selected by LLM for refactoring`n$($verboseOutput.ToString())"
                            }
                        )
                    }

                    $script:last = $script:nextFile
                    goNext
                }
            }

            # update state and persist changes if modifications were made
            if (($null -ne $refactorDefinition) -and
                ($refactorDefinition -is [GenXdev.Helpers.RefactorDefinition])) {

                Microsoft.PowerShell.Utility\Write-Verbose ("Updating refactor set state with $script:filesAdded added " +
                    "and $script:filesRemoved removed")

                # $totalFilesLeft = (
                #     ($refactorDefinition.State.Unselected.Count - 1) -
                #     $refactorDefinition.State.UnselectedIndex
                # ) + (
                #     ($refactorDefinition.State.Selected.Count - 1) -
                #     $refactorDefinition.State.SelectedIndex
                # ) + (
                #     ($refactorDefinition.State.Refactored.Count - 1) -
                #     $refactorDefinition.State.RefactoredIndex
                # );

                $totalFilesDone = (
                    $refactorDefinition.State.UnselectedIndex + 1
                ) + (
                    $refactorDefinition.State.SelectedIndex + 1
                ) + (
                    $refactorDefinition.State.RefactoredIndex + 1
                );

                $totalFiles = (
                    $refactorDefinition.State.Unselected.Count
                ) + (
                    $refactorDefinition.State.Selected.Count
                ) + (
                    $refactorDefinition.State.Refactored.Count
                )

                # calculate and update completion percentage
                $refactorDefinition.State.PercentageComplete = [System.Math]::Min(100, [Math]::Round(
                    (100 * $totalFilesDone) / [Math]::Max(1, $totalFiles),
                        0
                    ))

                $now = GenXdev.Console\UtcNow

                if ($script:filesAdded -gt 0 -or $script:filesRemoved -gt 0) {

                    # log status update
                    $refactorDefinition.Log.Add(
                        [GenXdev.Helpers.RefactorLogItem]@{
                            Timestamp = $now
                            Message   = "Refactor set updated, $script:filesAdded files added, " +
                            "$script:filesRemoved files removed, " +
                            "($($refactorDefinition.State.PercentageComplete)% " +
                            "complete)"
                        }
                    )
                }

                # persist changes to preferences
                if ($PSCmdlet.ShouldProcess(
                        "Refactor set: $($refactorDefinition.Name)",
                        "Save changes")) {

                    $latestJson = (GenXdev.Data\Get-GenXdevPreference `
                            -Name "refactor_set_$($refactorDefinition.Name)"
                    )
                    if ($null -eq $latestJson) {

                        Microsoft.PowerShell.Utility\Write-Warning "Refactor set has been deleted"
                        break;
                    }

                    $latest = $latestJson | Microsoft.PowerShell.Utility\ConvertFrom-Json -ErrorAction SilentlyContinue
                    if ($null -ne $latest -and ($latest.State.LastUpdated -lt $refactorDefinition.State.LastUpdated)) {

                        $latest.State = $refactorDefinition.State;
                        $latest.Log = $refactorDefinition.Log;

                        $refactorDefinition = $latest;
                    }

                    $now = GenXdev.Console\UtcNow
                    $refactorDefinition.State.LastUpdated = $now
                    $json = $refactorDefinition | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10 -Compress
                    GenXdev.Data\Set-GenXdevPreference `
                        -Name "refactor_set_$($refactorDefinition.Name)" `
                        -Value $json
                }

                Microsoft.PowerShell.Utility\Write-Verbose "Refactor set updated successfully"
            }
        }
    }

    end {

    }
}
################################################################################