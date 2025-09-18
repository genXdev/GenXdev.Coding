<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Remove-Refactor.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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
###############################################################################
<#
.SYNOPSIS
Removes refactor sets from GenXdev preferences system.

.DESCRIPTION
Manages refactor sets in the GenXdev preferences system by removing specified
entries. Works with both custom and default refactor sets. Default sets are
protected unless explicitly allowed for removal. All refactor sets are
identified by the prefix "refactor_set_" in the preferences system.

.PARAMETER Name
One or more name patterns used to match refactor sets for removal. Supports
wildcard patterns like "*" and "?" for flexible matching. Multiple patterns can
be provided to target specific sets.

.PARAMETER RemoveDefault
Switch parameter that, when enabled, allows the removal of protected default or
standard refactor sets. By default, these sets are protected from deletion.

.EXAMPLE
Remove-Refactor -Name "CustomRefactor" -RemoveDefault
Removes a specific refactor set named "CustomRefactor" and allows removal
of default sets if matched

#>
function Remove-Refactor {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The name of the refactor, accepts wildcards',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [Alias('PreferenceName')]
        [string[]] $Name,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ParameterSetName = 'All',
            HelpMessage = 'Switch to also remove the standard refactor set'
        )]
        [switch] $RemoveDefault,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Database path for preference data files'
        )]
        [Alias('DatabasePath')]
        [string] $PreferencesDatabasePath,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The default value if preference is not found'
        )]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias('DefaultPreference')]
        [string] $DefaultValue,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for Data ' +
                'preferences like Language, Database paths, etc')
        )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear the session setting (Global variable) before ' +
                'retrieving')
        )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Dont use alternative settings stored in session for ' +
                'Data preferences like Language, Database paths, etc')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ########################################################################
    )

    begin {

        # log operation start and search patterns for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose ('Starting refactor removal process')
        Microsoft.PowerShell.Utility\Write-Verbose ("Search patterns to process: $($Name -join ', ')")
    }


    process {

        # copy identical parameters for GenXdev.Data\Get-GenXdevPreferenceNames
        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Data\Get-GenXdevPreferenceNames' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # retrieve all preference names matching the refactor_set pattern
        GenXdev.Data\Get-GenXdevPreferenceNames @params |
            Microsoft.PowerShell.Core\Where-Object { $_ -like 'refactor_set_*' } |
            Microsoft.PowerShell.Core\ForEach-Object {

                # store current preference name for processing
                $preferenceName = $_
                Microsoft.PowerShell.Utility\Write-Verbose "Processing preference: $preferenceName"

                # extract refactor name by removing the standard prefix
                $refactorName = $preferenceName.Substring('refactor_set_'.Length)

                # process each provided name pattern against current refactor
                $Name | Microsoft.PowerShell.Core\ForEach-Object {

                    # skip if pattern doesn't match current refactor name
                    if (-not ($refactorName -like $_)) {
                        return
                    }

                    # copy identical parameters for Get-GenXdevPreference
                    $getParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                        -BoundParameters $PSBoundParameters `
                        -FunctionName 'GenXdev.Data\Get-GenXdevPreference' `
                        -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                            -Scope Local `
                            -ErrorAction SilentlyContinue)

                    # retrieve current preference value
                    $preferenceValue = GenXdev.Data\Get-GenXdevPreference `
                        @getParams `
                        -Name $preferenceName `
                        -ErrorAction SilentlyContinue

                    # only process if preference exists and has a value
                    if (-not [string]::IsNullOrWhiteSpace($preferenceValue)) {

                        # confirm removal with user before proceeding
                        if ($PSCmdlet.ShouldProcess(
                                "Refactor set: $refactorName",
                                'Remove')) {

                            Microsoft.PowerShell.Utility\Write-Verbose ('Removing refactor set: ' +
                                "$refactorName")

                            # copy identical parameters for Remove-GenXdevPreference
                            $removeParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                                -BoundParameters $PSBoundParameters `
                                -FunctionName 'GenXdev.Data\Remove-GenXdevPreference' `
                                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                                    -Scope Local `
                                    -ErrorAction SilentlyContinue)

                            # remove preference from system
                            $null = GenXdev.Data\Remove-GenXdevPreference `
                                @removeParams `
                                -Name $preferenceName `
                                -RemoveDefault:$RemoveDefault
                        }
                    }
                }
            }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose 'Refactor removal process completed'
    }
}