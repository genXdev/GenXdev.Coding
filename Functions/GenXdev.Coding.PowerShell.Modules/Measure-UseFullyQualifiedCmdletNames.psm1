using namespace System.Management.Automation.Language
using namespace Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic

<#
.SYNOPSIS
Measure-UseFullyQualifiedCmdletNames

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
#>
function Measure-UseFullyQualifiedCmdletNames {
    [Microsoft.Windows.PowerShell.ScriptAnalyzer.ScriptAnalyzer.RuleInfoAttribute(
        "UseFullyQualifiedCmdletNames",
        "Use fully qualified cmdlet names to improve clarity and avoid namespace collisions",
        "Commands should be referenced with their fully qualified module name (e.g., 'ModuleName\\CommandName') to improve script clarity and avoid command name conflicts.",
        "Error",
        $true
    )]
    [CmdletBinding()]
    [OutputType([Microsoft.Windows.Powershell.ScriptAnalyzer.Generic.DiagnosticRecord[]])]

    Param (
        [ScriptBlockAst]
        $ScriptBlockAst
    )

    Process {
        $results = @()
        try {
            Write-Verbose "Starting analysis of script block for unqualified cmdlet names"

            if (-not $ScriptBlockAst) {
                Write-Verbose "No ScriptBlockAst provided - exiting"
                return $results
            }

            Write-Verbose "Searching for command invocations in the script block"
            $commands = $ScriptBlockAst.FindAll({
                    $args[0] -is [CommandAst]
                }, $true)

            Write-Verbose "Found $($commands.Count) command invocations to analyze"

            foreach ($command in $commands) {
                $commandName = $command.GetCommandName()
                Write-Verbose "Processing command: $commandName"

                if (-not $commandName) {
                    Write-Verbose "Skipping: Unable to get command name"
                    continue
                }

                if ($commandName -notmatch '\\') {
                    Write-Verbose "Command '$commandName' is not fully qualified - attempting to resolve"

                    Write-Verbose "Attempting to get command information for '$commandName'"
                    $resolvedCommand = Get-Command -Name $commandName -ErrorAction SilentlyContinue
                    if ($null -eq $resolvedCommand) {
                        Write-Verbose "Get-Command failed, trying ExecutionContext"
                        $resolvedCommand = $ExecutionContext.InvokeCommand.GetCommand($commandName, [CommandTypes]::All)
                    }

                    if ($resolvedCommand) {
                        Write-Verbose "Command resolved as $($resolvedCommand.CommandType) from module $($resolvedCommand.ModuleName)"

                        if (($resolvedCommand.CommandType -eq 'Cmdlet' -or $resolvedCommand.CommandType -eq 'Function') -and
                            $resolvedCommand.ModuleName) {
                            $fullyQualifiedName = "$($resolvedCommand.ModuleName)\$commandName"
                            Write-Verbose "Suggested fully qualified name: $fullyQualifiedName"

                            Write-Verbose "Creating diagnostic record for $commandName"
                            $result = [DiagnosticRecord]@{
                                Message              = "Command '$commandName' should be fully qualified with its module name (e.g., '$fullyQualifiedName')."
                                Extent               = $command.CommandElements[0].Extent
                                RuleName             = $PSCmdlet.MyInvocation.InvocationName
                                Severity             = 'Error'
                                SuggestedCorrections = @(
                                    [CorrectionExtent]@{
                                        Text              = $fullyQualifiedName
                                        StartLineNumber   = $command.CommandElements[0].Extent.StartLineNumber
                                        EndLineNumber     = $command.CommandElements[0].Extent.EndLineNumber
                                        StartColumnNumber = $command.CommandElements[0].Extent.StartColumnNumber
                                        EndColumnNumber   = $command.CommandElements[0].Extent.EndColumnNumber
                                        Description       = "Use fully qualified name: $fullyQualifiedName"
                                    }
                                )
                            }
                            $results += $result
                        }
                        else {
                            Write-Verbose "Skipping: Command is not a cmdlet or function, or has no module name"
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

            Write-Verbose "Completed analysis of script block with $($results.Count) issues found"
            return $results
        }
        catch {
            Write-Verbose "Error occurred: $($_.Exception.Message)"
            $PSCmdlet.ThrowTerminatingError($PSItem)
        }
    }
}

Export-ModuleMember -Function Measure-UseFullyQualifiedCmdletNames