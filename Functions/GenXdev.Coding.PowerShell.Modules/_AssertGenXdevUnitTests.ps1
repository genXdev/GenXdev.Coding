################################################################################
<#
.SYNOPSIS
Executes Pester unit tests for specified PowerShell modules.

.DESCRIPTION
This function runs Pester unit tests for PowerShell modules with configurable
output settings. It can test specific modules or cmdlets, filter out unwanted
modules, and control the verbosity of test results and stack traces.

.PARAMETER BaseModuleName
Specifies the base module name pattern to filter which modules to test.
Accepts wildcards such as "GenXdev*" to match multiple modules.

.PARAMETER ModuleFilter
Optional filter to exclude modules that match the specified patterns.
Any modules matching these patterns will be skipped during testing.

.PARAMETER CmdletName
Name of a specific cmdlet to test. If specified, only tests this cmdlet.
Allows focused testing of individual cmdlets.

.PARAMETER NoLocal
When specified, excludes local development modules from testing.

.PARAMETER OnlyPublished
When specified, only tests modules that have been published.

.PARAMETER FromScripts
When specified, includes script modules in the testing process.

.PARAMETER Verbosity
Controls the detail level of test output.
Valid values: None, Normal, Detailed, Diagnostic

.PARAMETER StackTraceVerbosity
Controls the amount of stack trace information shown in test results.
Valid values: None, FirstLine, Filtered, Full

.EXAMPLE
_AssertGenXdevUnitTests -BaseModuleName "GenXdev.Helpers" -Verbosity Detailed `
    -StackTraceVerbosity Full -NoLocal

.EXAMPLE
_AssertGenXdevUnitTests "GenXdev*" -CmdletName "Get-Something" -Verbose
#>

[CmdletBinding()]
param (
    ############################################################################
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
    ############################################################################
    [Parameter(
        Mandatory = $false,
        HelpMessage = "Filter for selecting modules"
    )]
    [string[]] $ModuleFilter = $null,
    ############################################################################
    [Parameter(
        Mandatory = $false,
        Position = 1,
        HelpMessage = "Filter for select cmdlets"
    )]
    [Alias("Filter", "CmdLet", "Cmd", "FunctionName", "Name")]
    [string] $CmdletName,
    ############################################################################
    [Parameter(
        Mandatory = $false,
        HelpMessage = "Exclude local development modules"
    )]
    [switch] $NoLocal,
    ############################################################################
    [Parameter(
        Mandatory = $false,
        HelpMessage = "Only test published modules"
    )]
    [switch] $OnlyPublished,
    ############################################################################
    [Parameter(
        Mandatory = $false,
        HelpMessage = "Include script modules"
    )]
    [switch] $FromScripts,
    ############################################################################
    [Parameter(
        Mandatory = $false,
        Position = 2,
        HelpMessage = "Sets the output verbosity level"
    )]
    [ValidateSet("None", "Normal", "Detailed", "Diagnostic")]
    [string] $Verbosity = "None",
    ############################################################################
    [Parameter(
        Mandatory = $false,
        Position = 3,
        HelpMessage = "Controls stack trace information detail"
    )]
    [ValidateSet("None", "FirstLine", "Filtered", "Full")]
    [string] $StackTraceVerbosity = "FirstLine"
)

begin {

    # store current location to restore it later
    $originalLocation = (Get-Location).Path
    Write-Verbose "Original location saved: $originalLocation"

    # initialize pester configuration
    Write-Verbose "Initializing Pester configuration"
    $config = New-PesterConfiguration
    $config.Output.Verbosity = $Verbosity
    $config.Output.StackTraceVerbosity = $StackTraceVerbosity
    $config.Run.Exit = $true
    $config.Run.PassThru = $true
    $config.TestResult.Enabled = $true
    $config.TestResult.OutputFormat = "NUnitXml"
    $config.Output.RenderMode = "Ansi"

    # initialize results tracking
    $results = $null
}

process {

    try {
        # ensure consistent test execution location
        Write-Verbose "Setting location to solution root"
        Set-Location "$PSScriptRoot\..\..\..\..\.."

        # process single cmdlet test if specified
        if (-not [string]::IsNullOrWhiteSpace($CmdletName)) {

            Write-Verbose "Processing single cmdlet test for: $CmdletName"

            # locate the specified cmdlet
            $cmdlet = Get-GenXDevCmdlets -CmdletName $CmdletName |
            Select-Object -First 1

            if ($null -eq $cmdlet) {
                Write-Warning "Cmdlet $CmdletName not found"
                return
            }

            Import-Module -Name ($cmdlet.BaseModule) -Force

            # verify test file exists
            $testFilePath = $cmdlet.ScriptTestFilePath
            if (-not (Test-Path $testFilePath)) {
                Write-Warning "No test file found at $testFilePath"
                return
            }

            # configure single test execution
            $config.Run.Path = $null
            $config.TestResult.Enabled = $false
            $config.Run.Container = @(
                New-PesterContainer -Path $testFilePath
            )

            Write-Verbose ("Running tests for cmdlet $CmdletName from file " +
                "$testFilePath")

            # execute tests
            $results = Invoke-Pester -Configuration $config

            # output results
            @($results) | ForEach-Object -ErrorAction SilentlyContinue {
                $_
            }
        }
        else {
            # copy parameters for module iteration
            $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -FunctionName "GenXdev.Helpers\Invoke-OnEachGenXdevModule" `
                -BoundParameters $PSBoundParameters

            # process all modules
            . GenXdev.Helpers\Invoke-OnEachGenXdevModule @invocationParams -Script {

                param($module)

                # apply module filters
                if ($null -ne $ModuleFilter) {
                    foreach ($filtr in $ModuleFilter) {
                        if ($module.Name -like $filtr) {
                            Write-Verbose "Skipping filtered module $($module.Name)"
                            return
                        }
                    }
                }

                # configure test settings
                $config.TestResult.Enabled = $true
                $config.TestResult.OutputPath = GenXdev.FileSystem\Expand-Path (
                    ".\Tests\TestResults.xml"
                )
                $config.Run.Container = $null
                $config.Run.Path = GenXdev.FileSystem\Expand-Path ".\Tests\"

                # verify test files exist
                if (@(Get-ChildItem .\Tests\*.Tests.ps1 -File -Recurse `
                            -ErrorAction SilentlyContinue).Count -eq 0) {
                    Write-Warning "No tests found for module $($module.Name)"
                    return
                }

                Write-Verbose "Running tests for module $($module.Name)"

                # execute module tests
                Invoke-Pester -Configuration $config |
                ForEach-Object -ErrorAction SilentlyContinue {
                    Write-Output $_
                }
            }
        }
    }
    finally {
        # restore original location
        Write-Verbose "Restoring original location: $originalLocation"
        Set-Location $originalLocation
    }
}

end {
}
################################################################################
