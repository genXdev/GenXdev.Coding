function Invoke-GenXdevScriptAnalyzer {
    [CmdletBinding(DefaultParameterSetName = 'Path')]
    param (
        # Use -Path for file-based analysis and -ScriptDefinition for script content analysis.
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ParameterSetName = 'Path',
            HelpMessage = 'Specifies the path to the script file.')]
        [string] $Path,

        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'Script',
            HelpMessage = 'Specifies the script definition as a string.'
        )]
        [string] $ScriptDefinition,

        [Parameter(HelpMessage = 'Specifies that the tool should exit on error.')]
        [switch] $EnableExit,

        [Parameter(HelpMessage = 'Enables automatic fixing of violations.')]
        [switch] $Fix,

        [Parameter(HelpMessage = 'Recursively process files.')]
        [switch] $Recurse,

        [Parameter(HelpMessage = 'Reports a summary after analysis.')]
        [switch] $ReportSummary
    )

    begin {
        $settings = Microsoft.PowerShell.Utility\Invoke-Expression ([IO.File]::ReadAllText((GenXdev.FileSystem\Expand-Path "$PSScriptRoot\PSScriptAnalyzerSettings.psd1")))

        #  Write-Verbose "Using Script Analyzer settings:`n$($invocationParams.Settings | ConvertTo-Json -Depth 5)"
    }

    process {
        try {
            $invocationParams = $null

            # check paramset
            if ($PSCmdlet.ParameterSetName -eq 'Path') {
                $invocationParams = @{
                    Path                  = $Path
                    IncludeRule           = $settings.IncludeRules
                    ExcludeRule           = $settings.ExcludeRules
                    CustomRulePath        = $settings.CustomRulePath
                    IncludeDefaultRules   = $settings.IncludeDefaultRules
                    RecurseCustomRulePath = $settings.RecurseCustomRulePath
                    # Severity      = $settings.Severity
                    Recurse               = !!$Recurse
                    Fix                   = !!$Fix
                    EnableExit            = !!$EnableExit
                    ReportSummary         = !!$ReportSummary
                    # Verbose       = $true
                    # ErrorAction      = "Continue"
                }
            }
            else {
                $invocationParams = @{
                    ScriptDefinition      = $ScriptDefinition
                    IncludeRule           = $settings.IncludeRules
                    ExcludeRule           = $settings.ExcludeRules
                    # Severity         = $settings.Severity

                    CustomRulePath        = $settings.CustomRulePath
                    IncludeDefaultRules   = $settings.IncludeDefaultRules
                    RecurseCustomRulePath = $settings.RecurseCustomRulePath
                    Recurse               = !!$Recurse
                    Fix                   = !!$Fix
                    EnableExit            = !!$EnableExit
                    ReportSummary         = !!$ReportSummary
                    # ErrorAction      = "Continue"
                }
            }

            try {
                $results = @(& "PSScriptAnalyzer\Invoke-ScriptAnalyzer" @invocationParams)
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Warning "ScriptAnalyzer error: $($_.Exception.Message)"
                return
            }

            if ($results -and ($results.Length -gt 0)) {

                $results | Microsoft.PowerShell.Core\ForEach-Object {
                    $r = $_ | GenXdev.Helpers\ConvertTo-HashTable
                    $r.Description = (PSScriptAnalyzer\Get-ScriptAnalyzerRule -Name $r.RuleName).Description
                    Microsoft.PowerShell.Utility\Write-Output $r
                }
            }
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Output @{
                Message     = $_.Exception.Message
                RuleName    = ($Null -eq $Path ? "?" : [IO.Path]::GetFileNameWithoutExtension($Path)) + " @ Invocation in Invoke-GenXdevScriptAnalyzer"
                Description = "An error occurred while invoking the Script Analyzer."
            }
        }
    }

    end {
    }
}