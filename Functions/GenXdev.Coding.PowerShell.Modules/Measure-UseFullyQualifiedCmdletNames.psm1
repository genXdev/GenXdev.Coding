<#
.SYNOPSIS
Detects invocations of non fully-qualified cmdlet names

.DESCRIPTION
Ensures all cmdlets and functions are called with their fully qualified module name

.EXAMPLE
Invoke-ScriptAnalyzer -Path script.ps1 -CustomRulePath ./CustomPSScriptAnalyzerRules

.INPUTS
[System.Management.Automation.Language.ScriptBlockAst]

.OUTPUTS
[Microsoft.Windows.Powershell.ScriptAnalyzer.Generic.DiagnosticRecord[]]

.NOTES
PSScriptAnalyzer custom rules must follow specific patterns to be recognized
##############################################################################
#>
function Measure-UseFullyQualifiedCmdletNames {
    [CmdletBinding()]
    [OutputType([Microsoft.Windows.Powershell.ScriptAnalyzer.Generic.DiagnosticRecord[]])]

    Param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.Language.ScriptBlockAst[]]
        $ScriptBlockAst
    )
    begin {

        $ss = @()
        $s = Expand-Path ("$($Env:LOCALAPPDATA)\GenXdev.PowerShell\ScriptAnalyzerFixes.json") -CreateDirectory

        $I = 0;

    }
    Process {
        [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord[]]$results = @()

        try {
            Write-Verbose 'Starting analysis of script block for unqualified cmdlet names'

            if ($null -eq $ScriptBlockAst -or $ScriptBlockAst.Count -eq 0) {
                Write-Verbose 'No valid ScriptBlockAst provided - exiting'
                return $results
            }

            foreach ($block in $ScriptBlockAst) {
                if ($null -eq $block) { continue }

                Write-Verbose 'Searching for command invocations in the script block'
                $commands = @($block.FindAll({
                            param($ast)
                            return $ast -is [System.Management.Automation.Language.CommandAst]
                        }, $true))

                Write-Verbose "Found $($commands.Count) command invocations to analyze"

                foreach ($command in $commands) {
                    if ($null -eq $command) { continue }

                    $commandName = $command.GetCommandName()
                    Write-Verbose "Processing command: $commandName"

                    if ([string]::IsNullOrEmpty($commandName)) {
                        Write-Verbose 'Skipping: Unable to get command name'
                        continue
                    }

                    if ($commandName -notmatch '\\') {
                        Write-Verbose "Command '$commandName' is not fully qualified - attempting to resolve"

                        Write-Verbose "Attempting to get command information for '$commandName'"
                        $resolvedCommand = Get-Command -Name $commandName -ErrorAction SilentlyContinue
                        if ($null -eq $resolvedCommand) {
                            Write-Verbose 'Get-Command failed, trying ExecutionContext'
                            $resolvedCommand = $ExecutionContext.InvokeCommand.GetCommand($commandName, [System.Management.Automation.CommandTypes]::All)
                        }

                        if ($resolvedCommand) {
                            Write-Verbose "Command resolved as $($resolvedCommand.CommandType) from module $($resolvedCommand.ModuleName)"

                            if (($resolvedCommand.CommandType -eq 'Cmdlet' -or $resolvedCommand.CommandType -eq 'Function') -and
                                $resolvedCommand.ModuleName) {
                                $fullyQualifiedName = "$($resolvedCommand.ModuleName)\$commandName"
                                Write-Verbose "Suggested fully qualified name: $fullyQualifiedName"

                                Write-Verbose "Creating diagnostic record for $commandName"
                                $extent = $command.CommandElements[0].Extent

                                # Get file path from ScriptBlockAst first, then extent
                                $filePath = $block.Extent.File
                                if ([string]::IsNullOrEmpty($filePath)) {
                                    $filePath = $extent.File
                                    if ([string]::IsNullOrEmpty($filePath)) {
                                        $currentAst = $command
                                        while ($null -ne $currentAst.Parent) {
                                            $currentAst = $currentAst.Parent
                                            if (-not [string]::IsNullOrEmpty($currentAst.Extent.File)) {
                                                $filePath = $currentAst.Extent.File
                                                break
                                            }
                                        }
                                    }
                                }

                                # Only proceed if we have a valid file path
                                if ([string]::IsNullOrEmpty($filePath)) {
                                    Write-Verbose "Skipping: Unable to determine file path for command '$commandName'"
                                    continue
                                }

                                $ss += @{
                                    StartLineNumber    = $extent.StartLineNumber
                                    EndLineNumber      = $extent.EndLineNumber
                                    StartColumnNumber  = $extent.StartColumnNumber
                                    EndColumnNumber    = $extent.EndColumnNumber
                                    fullyQualifiedName = $fullyQualifiedName
                                    FilePath           = $filePath
                                }

                                # Create correction extent with the fully qualified command name
                                $correction = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.CorrectionExtent]::new(
                                    $extent.StartLineNumber,
                                    $extent.EndLineNumber,
                                    $extent.StartColumnNumber,
                                    $extent.EndColumnNumber,
                                    $fullyQualifiedName,
                                    "Use fully qualified command name: $fullyQualifiedName"
                                )

                                # Create corrections array with the correction
                                [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.CorrectionExtent[]]$corrections = @()
                                if ($null -ne $correction) {
                                    $corrections += $correction
                                }

                                # Create diagnostic record with correct constructor parameters
                                $result = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]::new(
                                    "Command '$commandName' should be fully qualified with its module name (e.g., '$fullyQualifiedName').",
                                    $extent,
                                    'UseFullyQualifiedCmdletNames',
                                    'Error',
                                    $filePath,
                                    'UseFullyQualifiedCmdletNames',
                                    $corrections
                                )

                                # Set corrections after creation
                                $result.SuggestedCorrections = $corrections

                                $results += $result
                            }
                            else {
                                Write-Verbose 'Skipping: Command is not a cmdlet or function, or has no module name'
                            }
                        }
                        else {
                            Write-Verbose "Skipping: Unable to resolve command '$commandName'"
                        }
                    }
                    else {
                        Write-Verbose "Skipping: Command '$commandName' is already fully qualified"
                    }
                }
            }

            Write-Verbose "Completed analysis of script block with $($results.Count) issues found"
            return $results
        }
        catch {
            Write-Verbose "Error occurred: $($_.Exception.Message)"
            $PSCmdlet.ThrowTerminatingError($PSItem)
        }
    }

    end {
        while ($i++ -lt 8) {
            try {
                if ([io.file]::Exists($s)) {
                    $st = [IO.File]::ReadAllText($s)
                    if ([string]::IsNullOrEmpty($s)) {
                        $ss = @()
                        break;
                    }
                    $ss += @($st | ConvertFrom-Json)
                }
                $ss | ConvertTo-Json -Depth 10 | Set-Content -Path $s -Force
                break;
            }
            catch {
                Start-Sleep -Milliseconds ([Math]::Round(([Random]::new().NextDouble()) * 10, 0))
            }
        }
    }
}
