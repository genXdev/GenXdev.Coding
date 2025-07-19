###############################################################################
<#
.SYNOPSIS
Continues or restarts a code refactoring session.

.DESCRIPTION
Manages code refactoring operations by processing refactor definitions in priority
order. Handles file selection, progress tracking, error handling, and provides
interactive user control over the refactoring process.

.PARAMETER Name
Name pattern(s) of refactors to process. Accepts wildcards. Default is "*".

.PARAMETER FilesToAdd
Files to include in the refactoring process.

.PARAMETER FilesToRemove
Files to exclude from the refactoring process.

.PARAMETER CleanUpDeletedFiles
Remove files that no longer exist from the refactor set.

.PARAMETER Reset
Restart processing from the beginning of the refactor set.

.PARAMETER ResetLMSelections
Restart all LLM selections in the refactoring process.

.PARAMETER MarkAllCompleted
Marks all files in the refactor set as completed.

.PARAMETER RedoLast
Repeat the last refactoring operation.

.PARAMETER EditPrompt
Only modify the AI prompt for the refactoring.

.PARAMETER Speak
Enables text-to-speech for refactoring progress and notifications.

.EXAMPLE
Start-NextRefactor -Name "RefactorProject" -Reset -CleanUpDeletedFiles
Restarts refactoring for "RefactorProject" and removes deleted files.
#>
function Start-NextRefactor {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('nextrefactor')]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'The name of the refactor, accepts wildcards',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $Name = @('*'),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'Filenames to add'
        )]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToAdd = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Filenames to remove'
        )]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToRemove = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = 'Clean up deleted files'
        )]
        [switch] $CleanUpDeletedFiles,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Start from the beginning of the refactor set'
        )]
        [switch] $Reset,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Restart all LLMSelections'
        )]
        [switch] $ResetLMSelections,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Mark all files as refactored'
        )]
        [switch] $MarkAllCompleted,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Redo the last refactor'
        )]
        [switch] $RedoLast,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Switch to only edit the AI prompt'
        )]
        [switch] $EditPrompt,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Speak out the details of next refactor'
        )]
        [switch] $Speak
        ########################################################################
    )

    begin {

        # output detailed module filter pattern for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Starting refactoring operation for patterns: $($Name -join ', ')"

        # load and sort refactor definitions by priority
        [GenXdev.Helpers.RefactorDefinition[]] $refactorSet = GenXdev.Coding\Get-Refactor `
            -Name $Name |
            Microsoft.PowerShell.Utility\Sort-Object -Property Priority -Descending

        # exit if no matching refactors found
        if ($null -eq $refactorSet) {

            Microsoft.PowerShell.Utility\Write-Warning "No refactor set found matching patterns: $($Name -join ', ')"
            return
        }
    }


    process {

        # process each refactor definition in priority order
        foreach ($refactorDefinition in $refactorSet) {
            if ($PSCmdlet.ShouldProcess(
                    "Refactor set '$($refactorDefinition.Name)'",
                    'Process refactoring')) {

                Microsoft.PowerShell.Utility\Write-Verbose "Processing refactor: $($refactorDefinition.Name)"

                try {
                    # update configuration with new files and process settings
                    $null = GenXdev.Coding\Update-Refactor `
                        -Refactor @($refactorDefinition) `
                        -FilesToAdd $FilesToAdd `
                        -FilesToRemove $FilesToRemove `
                        -CleanUpDeletedFiles:$CleanUpDeletedFiles `
                        -PerformLLMSelections `
                        -AskBeforeLLMSelection `
                        -RedoLast:$RedoLast `
                        -Reset:$Reset `
                        -ResetLMSelections:$Reset `
                        -MarkAllCompleted:$MarkAllCompleted `
                        -Speak:$Speak
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning "Failed to update refactor set: $_"
                }

                # main refactoring loop
                do {
                    $next = $null

                    do {
                        $refactorDefinition.State.RefactoredIndex = [Math]::Min(
                            $refactorDefinition.State.RefactoredIndex + 1,
                            $refactorDefinition.State.Refactored.Count
                        );
                    } while (
                        (
                            $refactorDefinition.State.RefactoredIndex -le
                            $refactorDefinition.State.Refactored.Count - 1
                        ) -and (
                            -not (
                                [IO.File]::Exists(
                                    $refactorDefinition.State.Refactored[
                                    $refactorDefinition.State.RefactoredIndex
                                    ]
                                )
                            )
                        )
                    )

                    # check if we need to get next file from selection queue
                    if ($refactorDefinition.State.RefactoredIndex -gt
                        $refactorDefinition.State.Refactored.Count - 1) {

                        $refactorDefinition.State.RefactoredIndex--;

                        # check if all files have been processed
                        if ($refactorDefinition.State.Selected.Count -eq 0) {

                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech "Completed refactoring set: '$($refactorDefinition.Name)'"
                            }

                            Microsoft.PowerShell.Utility\Write-Verbose "Completed refactoring $($refactorDefinition.Name)"
                            $refactorDefinition.State.Status = 'Refactored'

                            try {
                                # save final state
                                $null = GenXdev.Coding\Update-Refactor -Refactor @($refactorDefinition)
                            }
                            catch {
                                Microsoft.PowerShell.Utility\Write-Warning "Failed to update refactor state: $_"
                            }

                            continue
                        }

                        # get next file from selection queue
                        $next = $refactorDefinition.State.Selected[0]
                        $null = $refactorDefinition.State.Selected.RemoveAt(0)

                        # update selection tracking index
                        if ($refactorDefinition.State.SelectedIndex -lt
                            $refactorDefinition.State.Selected.Count - 1) {

                            $refactorDefinition.State.SelectedIndex =
                            [Math]::Max(-1, $refactorDefinition.State.SelectedIndex - 1)
                        }

                        # update refactoring progress trackers
                        $null = $refactorDefinition.State.Refactored.Add($next)
                        $refactorDefinition.State.RefactoredIndex =
                        $refactorDefinition.State.Refactored.Count - 1
                    }
                    else {
                        # get next file from completed items
                        $next = $refactorDefinition.State.Refactored[
                        $refactorDefinition.State.RefactoredIndex]
                    }

                    # process current file if available
                    if ($null -ne $next) {

                        $refactorDefinition.State.Status = 'Refactoring'
                        $infoText = "Refactoring file '$([IO.Path]::GetFileName($next))' " +
                        "of set '$($refactorDefinition.Name)' " +
                        "using prompt '$(
                                    $refactorDefinition.RefactorSettings.PromptKey
                         )'"

                        Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Blue $infoText

                        if ($Speak) {

                            GenXdev.Console\Start-TextToSpeech $infoText
                        }

                        $skipPostMenu = $false
                        try {
                            # perform refactoring on current file
                            GenXdev.Coding\Assert-RefactorFile `
                                -RefactorDefinition $refactorDefinition `
                                -Path $next `
                                -EditPrompt:$EditPrompt

                            if ($EditPrompt) {

                                break
                            }
                        }
                        catch {
                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech (
                                    'An error occured with message: ' +
                                    $_.Exception.Message
                                )
                            }
                            # log error detaails and timestamp
                            $now = Microsoft.PowerShell.Utility\Get-Date
                            $null = $refactorDefinition.Log.Add(@{
                                    Timestamp = $now
                                    Message   = ("Error refactoring file $($next.FullName): " +
                                        "$($_.Exception.Message)")
                                })

                            Microsoft.PowerShell.Utility\Write-Error $_.Exception.Message
                            $refactorDefinition.State.Status = 'Error'

                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech 'What to do next?'
                            }

                            # handle error with user input
                            $userAnswer = $host.ui.PromptForChoice(
                                'Make a choice',
                                'What to do next?',
                                @('&Continue', '&Redo', '&Stop'),
                                0
                            )

                            switch ($userAnswer) {
                                2 {
                                    $refactorDefinition.State.Status = 'Stopped'
                                    throw 'Refactor stopped'
                                    return
                                }
                                1 {
                                    $refactorDefinition.State.Status = 'Refactoring'
                                    $refactorDefinition.State.RefactoredIndex--
                                    break;
                                }
                                0 {
                                    $refactorDefinition.State.Status = 'Refactoring'
                                    $skipPostMenu = $false
                                    break;
                                }
                            }
                        }

                        try {
                            # save current progress
                            $null = GenXdev.Coding\Update-Refactor -Refactor @($refactorDefinition)
                        }
                        catch {
                            Microsoft.PowerShell.Utility\Write-Warning "Failed to update refactor state: $_"
                        }

                        if ($skipPostMenu) {

                            continue
                        }

                        $infoText = "Refactoring set named $($refactorDefinition.Name) now for $($refactorDefinition.State.PercentageComplete)% completed"

                        GenXdev.Coding\Show-RefactorReport -Name:$Name

                        Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Green $infoText

                        if ($Speak) {

                            GenXdev.Console\Start-TextToSpeech $infoText
                        }

                        if ($Speak) {

                            GenXdev.Console\Start-TextToSpeech 'What to do next?'
                        }

                        # get user input for next action
                        $userAnswer = $host.ui.PromptForChoice(
                            'Make a choice',
                            'What to do next?',
                            @('&Continue', '&Redo', '&Stop'),
                            0
                        )

                        switch ($userAnswer) {
                            1 {
                                $refactorDefinition.State.RefactoredIndex--
                                break;
                            }
                            2 {
                                $refactorDefinition.State.Status = 'Stopped'
                                return
                            }
                        }
                    }
                } while (
                    ($refactorDefinition.State.RefactoredIndex -lt
                    $refactorDefinition.State.Refactored.Count - 1) -or
                    ($refactorDefinition.State.SelectedIndex -lt
                    $refactorDefinition.State.Selected.Count - 1)
                )
            }
        }

        Microsoft.PowerShell.Utility\Write-Host -ForegroundColor Green 'All done.'

        if ($Speak) {

            GenXdev.Console\Start-TextToSpeech 'All refactorings completed'
        }
    }

    end {
    }
}