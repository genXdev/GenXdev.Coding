<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Start-NextRefactor.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.302.2025
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
<#
.SYNOPSIS
Continues or restarts a code refactoring session.

.DESCRIPTION
Manages code refactoring operations by processing refactor definitions in
priority order. Handles file selection, progress tracking, error handling, and
provides interactive user control over the refactoring process.

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

.PARAMETER Speak
Enables text-to-speech for refactoring progress and notifications.

.EXAMPLE
Start-NextRefactor -Name "RefactorProject" -Reset -CleanUpDeletedFiles
Restarts refactoring for "RefactorProject" and removes deleted files.

.EXAMPLE
nextrefactor -Name "*Test*" -Speak
Processes all refactor sets matching "*Test*" pattern with speech enabled.
#>
function Start-NextRefactor {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('nextrefactor')]

    param (
        #######################################################################
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
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'Filenames to add'
        )]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToAdd = @(),
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Filenames to remove'
        )]
        [ValidateNotNull()]
        [System.IO.FileInfo[]] $FilesToRemove = @(),
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = 'Clean up deleted files'
        )]
        [switch] $CleanUpDeletedFiles,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Start from the beginning of the refactor set'
        )]
        [switch] $Reset,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restart all LLM selections'
        )]
        [switch] $ResetLMSelections,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Mark all files as refactored'
        )]
        [switch] $MarkAllCompleted,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Redo the last refactor'
        )]
        [switch] $RedoLast,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Speak out the details of next refactor'
        )]
        [switch] $Speak
        #######################################################################
    )

    begin {

        # output detailed module filter pattern for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Starting refactoring operation for patterns: $($Name -join ', ')"
        )

        # load and sort refactor definitions by priority first
        [GenXdev.Helpers.RefactorDefinition[]] $refactorSet = GenXdev.Coding\Get-Refactor `
            -Name $Name |
            Microsoft.PowerShell.Utility\Sort-Object -Property Priority -Descending

        # exit if no matching refactors found
        if ($null -eq $refactorSet) {

            Microsoft.PowerShell.Utility\Write-Warning (
                "No refactor set found matching patterns: $($Name -join ', ')"
            )
            return
        }

        # pass the loaded refactor objects directly and only perform auto selections
        $null = GenXdev.Coding\Update-Refactor `
            -Refactor $refactorSet `
            -PerformAutoSelections `
            -RedoLast:$RedoLast `
            -Reset:$Reset `
            -MarkAllCompleted:$MarkAllCompleted `
            -CleanUpDeletedFiles:$CleanUpDeletedFiles `
            -FilesToRemove $FilesToRemove `
            -ResetLMSelections:$ResetLMSelections `
            -Verbose:$Verbose
    }


    process {

        # process each refactor definition in priority order
        foreach ($refactorDefinition in $refactorSet) {

            if ($PSCmdlet.ShouldProcess(
                    "Refactor set '$($refactorDefinition.Name)'",
                    'Process refactoring')) {

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Processing refactor: $($refactorDefinition.Name)"
                )

                try {
                    # update configuration with new files and process settings
                    $null = GenXdev.Coding\Update-Refactor `
                        -Refactor @($refactorDefinition) `
                        -Verbose:$Verbose
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning (
                        "Failed to update refactor set: $_"
                    )
                }

                # main refactoring loop - process files one at a time
                while ($refactorDefinition.State.Selected.Count -gt 0) {

                    # reset status to indicate active refactoring when items are available
                    if ($refactorDefinition.State.Status -eq 'Refactored') {
                        $refactorDefinition.State.Status = 'Refactoring'
                    }

                    # determine next file to process
                    if ($refactorDefinition.State.Selected.Count -gt 0) {
                        # get next file from selection queue
                        $next = $refactorDefinition.State.Selected[0]
                        $null = $refactorDefinition.State.Selected.RemoveAt(0)

                        # skip files that no longer exist on disk
                        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $next -PathType Leaf)) {
                            Microsoft.PowerShell.Utility\Write-Verbose (
                                "Skipping non-existent file: $next"
                            )
                            continue
                        }

                        # update selection tracking index after removing item
                        $refactorDefinition.State.SelectedIndex = [Math]::Max(
                            -1,
                            $refactorDefinition.State.SelectedIndex - 1
                        )

                        # add to refactored list immediately to track progress
                        $null = $refactorDefinition.State.Refactored.Add($next)
                        $refactorDefinition.State.RefactoredIndex =
                        $refactorDefinition.State.Refactored.Count - 1
                    }
                    else {
                        # process unprocessed file from refactored list
                        $nextIndex = $refactorDefinition.State.RefactoredIndex + 1
                        $next = $refactorDefinition.State.Refactored[$nextIndex]

                        Microsoft.PowerShell.Utility\Write-Verbose (
                            "Processing unprocessed file at index $nextIndex`: $next"
                        )

                        # check if file still exists
                        if (-not (Microsoft.PowerShell.Management\Test-Path -LiteralPath $next -PathType Leaf)) {
                            Microsoft.PowerShell.Utility\Write-Verbose (
                                "File no longer exists, advancing RefactoredIndex: $next"
                            )
                            $refactorDefinition.State.RefactoredIndex = $nextIndex
                            continue
                        }

                        # advance the index for this file
                        $refactorDefinition.State.RefactoredIndex = $nextIndex
                    }

                    # process current file
                    $refactorDefinition.State.Status = 'Refactoring'
                    $fileName = GenXdev.FileSystem\Find-Item $next -NoRecurse -PassThru -ErrorAction SilentlyContinue |
                        Microsoft.PowerShell.Utility\Select-Object -ExpandProperty Name
                    $infoText = (
                        "Refactoring file '$fileName' of set " +
                        "'$($refactorDefinition.Name)' using prompt " +
                        "'$($refactorDefinition.RefactorSettings.PromptKey)'"
                    )

                    Microsoft.PowerShell.Utility\Write-Host `
                        -ForegroundColor Blue $infoText

                    if ($Speak) {

                        GenXdev.Console\Start-TextToSpeech $infoText
                    }

                    $continueProcessing = $true
                    while ($continueProcessing) {

                        try {
                            # perform refactoring on current file
                            GenXdev.Coding\Assert-RefactorFile `
                                -RefactorSettings $refactorDefinition.RefactorSettings `
                                -Path $next

                            # refactoring succeeded, show progress
                            $infoText = (
                                "Refactoring set named $($refactorDefinition.Name) " +
                                "now $($refactorDefinition.State.PercentageComplete)% " +
                                "completed"
                            )

                            GenXdev.Coding\Get-Refactor -Name:$Name

                            Microsoft.PowerShell.Utility\Write-Host `
                                -ForegroundColor Green $infoText

                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech $infoText
                            }

                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech 'What to do next?'
                            }

                            # get user input for next action after successful refactor
                            $userAnswer = $host.ui.PromptForChoice(
                                'Make a choice',
                                'What to do next?',
                                @('&Continue', '&Redo', '&Stop'),
                                0
                            )

                            switch ($userAnswer) {
                                0 {
                                    # continue to next file
                                    $continueProcessing = $false
                                    break
                                }
                                1 {
                                    # redo current file - keep in while loop
                                    if ($Speak) {

                                        GenXdev.Console\Start-TextToSpeech `
                                            'Redoing current file'
                                    }
                                    break
                                }
                                2 {
                                    $refactorDefinition.State.Status = 'Stopped'
                                    return
                                }
                            }
                        }
                        catch {
                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech (
                                    'An error occurred with message: ' +
                                    $_.Exception.Message
                                )
                            }
                            # log error details and timestamp
                            $now = Microsoft.PowerShell.Utility\Get-Date
                            $expandedPath = GenXdev.FileSystem\Expand-Path $next
                            $null = $refactorDefinition.Log.Add(@{
                                    Timestamp = $now
                                    Message   = (
                                        "Error refactoring file $expandedPath`: " +
                                        "$($_.Exception.Message)"
                                    )
                                })

                            Microsoft.PowerShell.Utility\Write-Error `
                                $_.Exception.Message
                            $refactorDefinition.State.Status = 'Error'

                            if ($Speak) {

                                GenXdev.Console\Start-TextToSpeech `
                                    'What to do next?'
                            }

                            # handle error with user input
                            $userAnswer = $host.ui.PromptForChoice(
                                'Make a choice',
                                'What to do next?',
                                @('&Continue', '&Redo', '&Stop'),
                                0
                            )

                            switch ($userAnswer) {
                                0 {
                                    # continue to next file despite error
                                    $refactorDefinition.State.Status = 'Refactoring'
                                    $continueProcessing = $false
                                    break
                                }
                                1 {
                                    # redo current file - keep in while loop
                                    $refactorDefinition.State.Status = 'Refactoring'
                                    break
                                }
                                2 {
                                    $refactorDefinition.State.Status = 'Stopped'
                                    throw 'Refactor stopped'
                                    return
                                }
                            }
                        }
                    }

                    try {
                        # save current progress after processing file
                        $null = GenXdev.Coding\Update-Refactor `
                            -Refactor @($refactorDefinition) `
                            -Verbose:$Verbose
                    }
                    catch {
                        Microsoft.PowerShell.Utility\Write-Warning (
                            "Failed to update refactor state: $_"
                        )
                    }
                }

                # all files processed successfully
                if ($Speak) {

                    GenXdev.Console\Start-TextToSpeech (
                        "Completed refactoring set: " +
                        "'$($refactorDefinition.Name)'"
                    )
                }

                Microsoft.PowerShell.Utility\Write-Verbose (
                    "Completed refactoring $($refactorDefinition.Name)"
                )
                $refactorDefinition.State.Status = 'Refactored'

                try {
                    # save final state
                    $null = GenXdev.Coding\Update-Refactor `
                        -Refactor @($refactorDefinition) `
                        -Verbose:$Verbose
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning (
                        "Failed to update refactor state: $_"
                    )
                }
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
################################################################################