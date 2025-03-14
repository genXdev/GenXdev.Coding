################################################################################
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
# Removes a specific refactor set named "CustomRefactor" and allows removal
# of default sets if matched

# Removes all non-default refactor sets using the alias
#>
function Remove-Refactor {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The name of the refactor, accepts wildcards",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $Name,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ParameterSetName = 'All',
            HelpMessage = "Switch to also remove the standard refactor set"
        )]
        [switch] $RemoveDefault
        ########################################################################
    )

    begin {

        # log operation start and search patterns for troubleshooting
        Write-Verbose ("Starting refactor removal process")
        Write-Verbose ("Search patterns to process: $($Name -join ', ')")
    }

    process {

        # retrieve all preference names matching the refactor_set pattern
        Get-GenXdevPreferenceNames |
        Where-Object { $_ -like "refactor_set_*" } |
        ForEach-Object {

            # store current preference name for processing
            $preferenceName = $_
            Write-Verbose "Processing preference: $preferenceName"

            # extract refactor name by removing the standard prefix
            $refactorName = $preferenceName.Substring("refactor_set_".Length)

            # process each provided name pattern against current refactor
            $Name | ForEach-Object {

                # skip if pattern doesn't match current refactor name
                if (-not ($refactorName -like $_)) {
                    return
                }

                # retrieve current preference value
                $preferenceValue = Get-GenXdevPreference `
                    -Name $preferenceName

                # only process if preference exists and has a value
                if (-not [string]::IsNullOrWhiteSpace($preferenceValue)) {

                    # confirm removal with user before proceeding
                    if ($PSCmdlet.ShouldProcess(
                            "Refactor set: $refactorName",
                            "Remove")) {

                        Write-Verbose ("Removing refactor set: " +
                            "$refactorName")

                        # remove preference from system
                        $null = Remove-GenXdevPreference `
                            -Name $preferenceName `
                            -RemoveDefault:$RemoveDefault
                    }
                }
            }
        }
    }

    end {

        Write-Verbose "Refactor removal process completed"
    }
}
################################################################################