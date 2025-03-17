################################################################################
<#
.SYNOPSIS
Executes unit tests for specified PowerShell modules and cmdlets with detailed
reporting.

.DESCRIPTION
This script provides a comprehensive test runner for PowerShell modules and
cmdlets. It offers configurable verbosity levels, interactive debugging of
failed tests, and color-coded output. Results can be displayed directly or
returned as objects for pipeline processing.

The script supports filtering by module name or specific cmdlet, handling of
local vs published modules, and various output formatting options.

.PARAMETER BaseModuleName
Target modules to test. Accepts wildcards and multiple module names.
Default value: "GenXdev*"

.PARAMETER ModuleFilter
Optional filter to exclude certain modules from testing.

.PARAMETER CmdletName
Name of specific cmdlet to test. Limits testing scope to just this cmdlet.

.PARAMETER NoLocal
When specified, excludes local development versions of modules from testing.

.PARAMETER OnlyPublished
When specified, only tests modules that have been published to repositories.

.PARAMETER FromScripts
When specified, sources tests from script files rather than module files.

.PARAMETER Verbosity
Controls detail level of test output.
Valid values: None, Normal, Detailed, Diagnostic

.PARAMETER StackTraceVerbosity
Controls stack trace detail in error output.
Valid values: None, FirstLine, Filtered, Full

.PARAMETER AllowLongRunningTests
When specified, includes tests marked as long-running in the test execution.

.PARAMETER DebugFailedTests
When specified, enables interactive debugging of failed tests with retry option.

.PARAMETER Passthru
When specified, returns test result objects instead of formatted console output.

.EXAMPLE
Assert-GenXdevUnitTests -BaseModuleName "MyModule" -Verbosity Detailed `
    -StackTraceVerbosity Full -DebugFailedTests

.EXAMPLE
Assert-GenXdevUnitTests "MyModule*" -NoLocal -OnlyPublished
#>
################################################################################
function Assert-GenXdevUnitTests {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "Assert-GenXdevUnitTests")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "Assert-GenXdevUnitTests")]
    [Alias("rungenxdevtests")]
    param (
        ################################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Filter to apply to module names"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("Module", "ModuleName")]
        [string[]] $BaseModuleName = @("GenXdev*"),
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Filter for selecting modules"
        )]
        [string[]]$ModuleFilter = $null,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Filter for select cmdlets"
        )]
        [Alias("Filter", "CmdLet", "Cmd", "FunctionName", "Name")]
        [string] $CmdletName,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Excludes local module versions"
        )]
        [switch] $NoLocal,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Tests only published modules"
        )]
        [switch] $OnlyPublished,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Sources tests from script files"
        )]
        [switch] $FromScripts,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Output detail level"
        )]
        [ValidateSet("None", "Normal", "Detailed", "Diagnostic")]
        [string]$Verbosity = "None",
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Stack trace detail level"
        )]
        [ValidateSet("None", "FirstLine", "Filtered", "Full")]
        [string]$StackTraceVerbosity = "FirstLine",
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Also selects unit-tests that have long running durations"
        )]
        [switch]$AllowLongRunningTests,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable interactive test debugging"
        )]
        [switch]$DebugFailedTests,
        ################################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Return result objects"
        )]
        [switch]$Passthru
    )

    begin {

        GenXdev.FileSystem\AssurePester

        & "$PSScriptRoot\Add-MissingGenXdevUnitTests.ps1"

        # store allow long running tests setting in script scope
        $Script:AllowLongRunningTests = ($Local:AllowLongRunningTests -eq $true)

        # load required modules
        Import-GenXdevModules

        Write-Verbose "Starting unit test execution"

        # remove debug parameter if present to avoid passing it downstream
        if ($PSBoundParameters.ContainsKey("DebugFailedTests")) {
            $null = $PSBoundParameters.Remove("DebugFailedTests")
        }

        if ($PSBoundParameters.ContainsKey("Passthru")) {
            $null = $PSBoundParameters.Remove("Passthru")
        }

        # define ANSI color codes for output formatting
        $ansiStartForgroundRed = "`e[91m"
        $ansiStartForgroundDarkGreen = "`e[32m"
        $ansiEndForground = "`e[0m"

        # store original verbose preference to restore later
        $origVerbosePref = $VerbosePreference
    }

    process {

        $results = $null
        # track overall test success state
        $Script:testSuccess = $true

        try {
            do {
                # execute the actual test runner script
                Write-Verbose "Executing test runner script"
                try {
                    # copy parameter values to the internal script with matching parameters
                    $identicalParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                        -FunctionName "$PSScriptRoot\_AssertGenXdevUnitTests.ps1" `
                        -BoundParameters $PSBoundParameters

                    $Script:testSuccess = $true
                    $results = (. "$PSScriptRoot\_AssertGenXdevUnitTests.ps1" @identicalParams |
                        ForEach-Object {

                            $PSItem.Tests | ForEach-Object {

                                $PSItem
                                # extract relevant test properties for display
                                $null = $_ |
                                Select-Object -Property @(
                                    "Block",
                                    "Name",
                                    "ErrorRecord",
                                    "UserDuration",
                                    "Duration",
                                    "Result"
                                ) |
                                ForEach-Object {
                                    $test = @{
                                        Block       = $_.Block
                                        Name        = $_.Name
                                        ErrorRecord = $_.ErrorRecord
                                        Duration    = $_.UserDuration
                                        Result      = $_.Result
                                    }

                                    # format failed tests with red coloring
                                    if ($test.Result -like "*Failed*") {
                                        $Script:testSuccess = $false
                                        $test.Result = (
                                            "$ansiStartForgroundRed$($test.Result)" +
                                            "$ansiEndForground"
                                        )
                                        $test.Block = "$($test.Block)".Replace(
                                            "[-]",
                                            "$ansiStartForgroundRed[❌]$ansiEndForground"
                                        ).Replace(
                                            "[+]",
                                            "$ansiStartForgroundRed[❌]$ansiEndForground"
                                        ).Replace(
                                            "[!]",
                                            "$ansiStartForgroundDarkGreen[❗]$ansiEndForground"
                                        )
                                    }
                                    # format passed tests with green coloring
                                    elseif ($test.Result -eq "Passed") {
                                        $test.Result = (
                                            "$ansiStartForgroundDarkGreen$($test.Result)" +
                                            "$ansiEndForground"
                                        )
                                        $test.Block = "$($test.Block)".Replace(
                                            "[+]",
                                            "$ansiStartForgroundDarkGreen[✅]$ansiEndForground"
                                        ).Replace(
                                            "[-]",
                                            "$ansiStartForgroundDarkGreen[✅]$ansiEndForground"
                                        ).Replace(
                                            "[!]",
                                            "$ansiStartForgroundDarkGreen[✅]$ansiEndForground"
                                        )
                                    }
                                    elseif ($test.Result -eq "Skipped") {
                                        $test.Result = (
                                            "$ansiStartForgroundDarkGreen$($test.Result)" +
                                            "$ansiEndForground"
                                        )
                                        $test.Block = "$($test.Block)".Replace(
                                            "[+]",
                                            "$ansiStartForgroundDarkGreen[❗]$ansiEndForground"
                                        ).Replace(
                                            "[-]",
                                            "$ansiStartForgroundDarkGreen[❗]$ansiEndForground"
                                        ).Replace(
                                            "[!]",
                                            "$ansiStartForgroundDarkGreen[❗]$ansiEndForground"
                                        )
                                    }
                                }

                                # format and display test results
                                $test | ForEach-Object {
                                    # calculate padding based on console width
                                    [int] $p = [Math]::Min(
                                    ([Console]::WindowWidth - 75) / 2,
                                        20
                                    )

                                    # format output string with fixed column widths
                                    [string] $s = (
                                        "$("$($_.Block)".Substring(0,[Math]::Min("$($_.Block)".Length, 35+$p)).PadRight(35+$p,' ')) " +
                                        "$("$($_.Name)".Substring(0,[Math]::Min("$($_.Name)".Length, 35+$p)).PadRight(35+$p,' ')) " +
                                        "$("$($_.UserDuration)".Substring(0,[Math]::Min("$($_.UserDuration)".Length, 15)).PadRight(15,' ')) " +
                                        "$("$($_.Result)".Substring(0,[Math]::Min("$($_.Result)".Length, 15)).PadRight(15,' ')) "
                                    )

                                    # add error message if present
                                    if ($_.ErrorRecord) {
                                        $s = $s + (
                                            "`r`n$ansiStartForgroundRed" +
                                            "$($_.ErrorRecord.Exception.Message)" +
                                            "$ansiEndForground"
                                        )
                                    }

                                    $s

                                } | Out-Host
                            }
                        }
                    )
                }
                catch {
                    $results = @(New-Object PSObject -Property @{
                            Block        = "Error"
                            Name         = "Error"
                            ErrorRecord  = $_.ErrorRecord
                            UserDuration = "0"
                            Result       = "Failed"
                        })
                }

                # handle failed test debugging if requested
                if ($DebugFailedTests) {
                    foreach ($result in $results) {
                        if ($result.Result -like "*Failed*") {
                            $Script:testSuccess = $false

                            # extract failed command name for debugging
                            $nextFailedCommand = $result |
                            ForEach-Object {
                                if (($null -eq $_) -or ($null -eq $_.ExpandedPath)) {
                                    return;
                                }
                                $_.ExpandedPath.Replace(" ", ".").Split(". :".ToCharArray())[0]
                            }

                            # show interactive debug prompt with test failure information
                            try {
                                Assert-GenXdevCmdletTests `
                                    -AssertFailedTest `
                                    -CmdletName $nextFailedCommand `
                                    -Prompt @"
        Unit test failed for unit test: $($result.ExpandedPath)
        The error was: $($result.ErrorRecord.Exception.Message)
"@

                                # prompt user for next action
                                switch ($host.ui.PromptForChoice(
                                        "Make a choice",
                                        "What to do next?",
                                        @("&Stop", "&Test again"),
                                        0)) {
                                    0 { throw "Stopped"; return; }
                                    1 { break }
                                }
                            }
                            catch {

                            }
                        }
                    }
                }

            } while ((-not $Script:testSuccess) -and $DebugFailedTests)
        }
        finally {
            # output results according to Passthru parameter
            if ($Passthru) {
                Write-Output $results
            }
            else {
                [int] $failures = 0

                # count failed tests in results
                $null = $results |
                Select-Object -Unique |
                ForEach-Object {
                    $failures += $PSItem.Block.FailedCount
                }

                # show summary message with appropriate color
                if ($failures -gt 0) {
                    Write-Output "`e[91m There were $failures failed tests`e[0m"
                }
                else {
                    Write-Output "`e[32m All tests passed`e[0m"
                }
            }
        }
    }

    end {
        # restore original verbose preference
        $VerbosePreference = $origVerbosePref
    }
}
################################################################################
