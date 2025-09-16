<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Get-GenXdevCmdletUsageAnalysis.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
<#
.SYNOPSIS
    Analyzes GenXdev cmdlet usage patterns to identify most frequently called functions.

.DESCRIPTION
    This script uses Get-GenXDevCmdlet to scan all GenXdev PowerShell modules and their
    functions to analyze which cmdlets are called most frequently by other cmdlets.
    This helps prioritize which functions to refactor to C# first, starting with the
    most commonly used ones.

.PARAMETER OutputFormat
    Format for output: Table, List, or CSV. Default is Table.

.PARAMETER Top
    Number of top results to show. Default is 50.

.PARAMETER IncludeCallChains
    Include detailed call chain information showing which functions call which.

.PARAMETER IncludeScripts
    Include script files in addition to module cmdlets.

.EXAMPLE
    Get-GenXdevCmdletUsageAnalysis

.EXAMPLE
    Get-GenXdevCmdletUsageAnalysis -Top 20 -OutputFormat List

.EXAMPLE
    Get-GenXdevCmdletUsageAnalysis -IncludeCallChains -IncludeScripts | Export-Csv -Path "cmdlet-usage.csv"
#>
function Get-GenXdevCmdletUsageAnalysis {
    [CmdletBinding()]
    param(
        [ValidateSet('Table', 'List', 'CSV')]
        [string]$OutputFormat = 'Table',
        [int]$Top = 50,
        [switch]$IncludeCallChains,
        [switch]$IncludeScripts
    )

    function GetPowerShellFunctionCalls {
        param(
            [string]$FilePath,
            [hashtable]$AllFunctions
        )

        try {
            $content = Microsoft.PowerShell.Management\Get-Content -LiteralPath $FilePath -Raw -ErrorAction Stop

            # Remove comments and strings to avoid false positives
            $cleanedContent = $content -replace '#.*$', '' -replace '(?s)<#.*?#>', ''
            $cleanedContent = $cleanedContent -replace '"[^"]*"', '""' -replace "'[^']*'", "''"

            $calls = @()

            # Find function calls in various patterns
            $patterns = @(
                # Direct function calls: FunctionName, Module\FunctionName
                '(?:^|\s|;|\||\(|\{)([A-Za-z][A-Za-z0-9]*(?:\.[A-Za-z][A-Za-z0-9]*)*\\)?([A-Za-z][A-Za-z0-9]*-[A-Za-z][A-Za-z0-9]*)\s*(?:\s|\(|$)',
                # Ampersand calls: & FunctionName
                '&\s+([A-Za-z][A-Za-z0-9]*(?:\.[A-Za-z][A-Za-z0-9]*)*\\)?([A-Za-z][A-Za-z0-9]*-[A-Za-z][A-Za-z0-9]*)',
                # Dot sourcing: . FunctionName
                '\.\s+([A-Za-z][A-Za-z0-9]*(?:\.[A-Za-z][A-Za-z0-9]*)*\\)?([A-Za-z][A-Za-z0-9]*-[A-Za-z][A-Za-z0-9]*)'
            )

            foreach ($pattern in $patterns) {
                $regexMatches = [regex]::Matches($cleanedContent, $pattern, 'IgnoreCase')
                foreach ($match in $regexMatches) {
                    $fullName = if ($match.Groups[1].Value) {
                        $match.Groups[1].Value + $match.Groups[2].Value
                    }
                    else {
                        $match.Groups[2].Value
                    }

                    $functionName = $match.Groups[2].Value

                    # Only include if it's a known GenXdev function
                    if ($AllFunctions.ContainsKey($functionName) -or
                        $AllFunctions.ContainsKey($fullName)) {
                        $calls += $functionName
                    }
                }
            }

            return $calls | Microsoft.PowerShell.Utility\Sort-Object -Unique
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Warning "Error processing file ${FilePath}: $($_.Exception.Message)"
            return @()
        }
    }

    function BuildCallGraph {
        param([hashtable]$AllFunctions)

        $callGraph = @{}
        $usageCount = @{}
        $callChains = @{}

        # Initialize counts
        foreach ($funcName in $AllFunctions.Keys) {
            $usageCount[$funcName] = 0
            $callChains[$funcName] = @()
        }

        $total = $AllFunctions.Count
        $current = 0

        foreach ($function in $AllFunctions.GetEnumerator()) {
            $current++
            Microsoft.PowerShell.Utility\Write-Progress -Activity "Analyzing GenXdev cmdlet usage patterns" -Status "Processing $($function.Key)" -PercentComplete (($current / $total) * 100) -CurrentOperation "$current of $total functions analyzed"

            $calledFunctions = GetPowerShellFunctionCalls -FilePath $function.Value.FilePath -AllFunctions $AllFunctions
            $callGraph[$function.Key] = $calledFunctions

            # Count usage
            foreach ($calledFunc in $calledFunctions) {
                if ($usageCount.ContainsKey($calledFunc)) {
                    $usageCount[$calledFunc]++
                    $callChains[$calledFunc] += $function.Key
                }
            }
        }

        Microsoft.PowerShell.Utility\Write-Progress -Activity "Analyzing GenXdev cmdlet usage patterns" -Completed

        return @{
            CallGraph  = $callGraph
            UsageCount = $usageCount
            CallChains = $callChains
        }
    }

    function GetAllGenXdevFunctions {
        # Use the existing Get-GenXDevCmdlet to get all cmdlets
        $cmdlets = if ($IncludeScripts) {
            GenXdev.Helpers\Get-GenXDevCmdlet -IncludeScripts
        }
        else {
            GenXdev.Helpers\Get-GenXDevCmdlet
        }

        $allFunctions = @{}

        foreach ($cmdlet in $cmdlets) {
            if ($cmdlet.ScriptFilePath -and (Microsoft.PowerShell.Management\Test-Path -LiteralPath $cmdlet.ScriptFilePath)) {
                $allFunctions[$cmdlet.Name] = @{
                    FilePath     = $cmdlet.ScriptFilePath
                    ModuleName   = $cmdlet.ModuleName
                    RelativePath = if ($cmdlet.ScriptFilePath) {
                        try {
                            $relativePath = [System.IO.Path]::GetRelativePath((Microsoft.PowerShell.Management\Get-Location).Path, $cmdlet.ScriptFilePath)
                            if ($relativePath.Length -gt 50) {
                                "..." + $relativePath.Substring($relativePath.Length - 47)
                            }
                            else {
                                $relativePath
                            }
                        }
                        catch {
                            [System.IO.Path]::GetFileName($cmdlet.ScriptFilePath)
                        }
                    }
                    else {
                        "Unknown"
                    }
                    Description  = $cmdlet.Description
                    Aliases      = $cmdlet.Aliases
                }
            }
            else {
                Microsoft.PowerShell.Utility\Write-Warning "Skipping $($cmdlet.Name) - file not found: $($cmdlet.ScriptFilePath)"
            }
        }

        return $allFunctions
    }

    # Main execution
    try {
        # Import GenXdev module to ensure Get-GenXDevCmdlet is available
        Microsoft.PowerShell.Core\Import-Module GenXdev -Force

        # Discover all functions using the existing cmdlet
        Microsoft.PowerShell.Utility\Write-Progress -Activity "Initializing GenXdev cmdlet usage analysis" -Status "Discovering GenXdev functions" -PercentComplete 10
        $allFunctions = GetAllGenXdevFunctions

        if (-not $allFunctions -or $allFunctions.Count -eq 0) {
            throw "No functions found in GenXdev modules"
        }

        # Build call graph and usage analysis
        Microsoft.PowerShell.Utility\Write-Progress -Activity "Initializing GenXdev cmdlet usage analysis" -Status "Building call graph for $($allFunctions.Count) functions" -PercentComplete 20
        $analysis = BuildCallGraph -AllFunctions $allFunctions

        # Create results
        Microsoft.PowerShell.Utility\Write-Progress -Activity "Finalizing GenXdev cmdlet usage analysis" -Status "Processing results" -PercentComplete 80
        $results = @()
        foreach ($func in $analysis.UsageCount.GetEnumerator()) {
            $result = [PSCustomObject]@{
                FunctionName = $func.Key
                UsageCount   = $func.Value
                ModuleName   = $allFunctions[$func.Key].ModuleName
                RelativePath = $allFunctions[$func.Key].RelativePath
                FilePath     = $allFunctions[$func.Key].FilePath
                Description  = $allFunctions[$func.Key].Description
                Aliases      = ($allFunctions[$func.Key].Aliases -join ", ")
            }

            if ($IncludeCallChains) {
                $result | Microsoft.PowerShell.Utility\Add-Member -NotePropertyName "CalledBy" -NotePropertyValue ($analysis.CallChains[$func.Key] -join ", ")
                $result | Microsoft.PowerShell.Utility\Add-Member -NotePropertyName "Calls" -NotePropertyValue ($analysis.CallGraph[$func.Key] -join ", ")
            }

            $results += $result
        }

        # Sort by usage count (descending) and take top N
        Microsoft.PowerShell.Utility\Write-Progress -Activity "Finalizing GenXdev cmdlet usage analysis" -Status "Sorting and formatting results" -PercentComplete 90
        $sortedResults = $results | Microsoft.PowerShell.Utility\Sort-Object UsageCount -Descending | Microsoft.PowerShell.Utility\Select-Object -First $Top

        Microsoft.PowerShell.Utility\Write-Progress -Activity "Finalizing GenXdev cmdlet usage analysis" -Completed

        switch ($OutputFormat) {
            'Table' {
                if ($IncludeCallChains) {
                    $sortedResults | Microsoft.PowerShell.Utility\Format-Table -Property FunctionName, UsageCount, ModuleName, CalledBy -AutoSize
                }
                else {
                    $sortedResults | Microsoft.PowerShell.Utility\Format-Table -Property FunctionName, UsageCount, ModuleName, Aliases -AutoSize
                }
            }
            'List' {
                $sortedResults | Microsoft.PowerShell.Utility\Format-List
            }
            'CSV' {
                $sortedResults | Microsoft.PowerShell.Utility\ConvertTo-Csv -NoTypeInformation
            }
        }

        # Summary statistics
        $totalFunctions = $results.Count
        $functionsWithUsage = ($results | Microsoft.PowerShell.Core\Where-Object { $_.UsageCount -gt 0 }).Count
        $maxUsage = ($results | Microsoft.PowerShell.Utility\Measure-Object UsageCount -Maximum).Maximum
        $avgUsage = [math]::Round(($results | Microsoft.PowerShell.Utility\Measure-Object UsageCount -Average).Average, 2)

        # Output summary to console
        Microsoft.PowerShell.Utility\Write-Output "`nGenXdev Cmdlet Usage Analysis Summary:"
        Microsoft.PowerShell.Utility\Write-Output "Total Functions: $totalFunctions"
        Microsoft.PowerShell.Utility\Write-Output "Functions with Usage > 0: $functionsWithUsage"
        Microsoft.PowerShell.Utility\Write-Output "Maximum Usage Count: $maxUsage"
        Microsoft.PowerShell.Utility\Write-Output "Average Usage Count: $avgUsage"

        Microsoft.PowerShell.Utility\Write-Output "`nTop Priority for C# Conversion:"
        $top5 = $sortedResults | Microsoft.PowerShell.Utility\Select-Object -First 5
        foreach ($item in $top5) {
            Microsoft.PowerShell.Utility\Write-Output "  $($item.UsageCount.ToString().PadLeft(3)) uses: $($item.FunctionName)"
            Microsoft.PowerShell.Utility\Write-Output "$($item.FilePath)"  # Output filename to stdout
            if ($item.Aliases) {
                Microsoft.PowerShell.Utility\Write-Output "       Aliases: $($item.Aliases)"
            }
        }

        # Return the full results for further processing
        return $sortedResults
    }
    catch {
        Microsoft.PowerShell.Utility\Write-Error "Analysis failed: $($_.Exception.Message)"
        Microsoft.PowerShell.Utility\Write-Error $_.ScriptStackTrace
    }
}