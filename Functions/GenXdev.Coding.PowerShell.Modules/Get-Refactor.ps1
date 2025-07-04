###############################################################################
<#
.SYNOPSIS
Retrieves refactor definitions from GenXdev preferences based on name patterns.

.DESCRIPTION
Searches for and loads refactor definition sets stored in GenXdev preferences.
Each refactor set is stored as a JSON string in a preference with name starting
with 'refactor_set_'. The function deserializes matching sets into objects.

.PARAMETER Name
One or more name patterns to match against refactor set names. Patterns are
matched against the portion of the preference name after 'refactor_set_' prefix.
Supports wildcards. If omitted, returns all refactor sets.

.EXAMPLE
Get-Refactor -Name "CodeStyle*"
        ###############################################################################Returns refactor definitions matching pattern "CodeStyle*"

.EXAMPLE
refactor "UnitTest"
        ###############################################################################Uses alias to find refactor definitions containing "UnitTest"
        ###############################################################################>
function Get-Refactor {

    [CmdletBinding()]
    [Alias("refactor")]
    [OutputType([GenXdev.Helpers.RefactorDefinition[]])]
    param (
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Pattern(s) to search for refactor definitions",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $Name = @("*"),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Database path for preference data files"
        )]
        [string] $PreferencesDatabasePath
        ########################################################################
        )

    begin {
        # no initialization needed
    }


process {
        # get all preference names that could contain refactor definitions
        Microsoft.PowerShell.Utility\Write-Verbose "Searching for refactor set preferences..."
        $prefNames = GenXdev.Data\Get-GenXdevPreferenceNames -PreferencesDatabasePath $PreferencesDatabasePath |
        Microsoft.PowerShell.Core\Where-Object { $_ -like "refactor_set_*" }
        & {
            foreach ($prefName in $prefNames) {

                Microsoft.PowerShell.Utility\Write-Verbose "Processing preference: $prefName"

                # check each provided name pattern against current preference
                foreach ($pattern in $Name) {

                    # extract name portion after refactor_set_ prefix
                    $actualName = $prefName.Substring("refactor_set_".Length)

                    # skip if pattern doesn't match the actual name
                    if (-not ($actualName -like $pattern)) {

                        continue
                    }

                    # attempt to load and parse the JSON content
                    $existingJson = GenXdev.Data\Get-GenXdevPreference -Name $prefName -PreferencesDatabasePath $PreferencesDatabasePath `
                        -ErrorAction SilentlyContinue

                    # process non-empty JSON content
                    if (-not [string]::IsNullOrWhiteSpace($existingJson)) {
                        try {
                            # deserialize JSON into refactor definition object
                            [GenXdev.Helpers.RefactorDefinition] $refactorSet = (Microsoft.PowerShell.Utility\ConvertFrom-Json $existingJson) -as [GenXdev.Helpers.RefactorDefinition]

                            # check containers
                            if (($null -eq $refactorSet.State.Unselected) -or

                                ($null -eq $refactorSet.State.Selected) -or
                                ($null -eq $refactorSet.State.Refactored) -or
                                ($null -eq $refactorSet.Log)) {

                                $newSet = [GenXdev.Helpers.RefactorDefinition]::new()
                                $new.Name = $refactorSet.Name
                                $new.Priority = $refactorSet.Priority
                                $new.SelectionSettings.Script = (!!$refactorSet.SelectionSettings ? $refactorSet.SelectionSettings.Script : "")

                                $refactorSet = $newSet
                            }

                            Microsoft.PowerShell.Utility\Write-Verbose ("Successfully parsed refactor set from " +
                                "preference: $prefName")
                            Microsoft.PowerShell.Utility\Write-Output $refactorSet
                        }
                        catch {
                            $errorMsg = "Failed to parse refactor set from $prefName"
                            Microsoft.PowerShell.Utility\Write-Error $errorMsg
                            Microsoft.PowerShell.Utility\Write-Verbose "$errorMsg : $_"
                        }
                    }

                    break;
                }
            }
        }.GetNewClosure() | Microsoft.PowerShell.Utility\Sort-Object -Property Priority -Descending
    }

    end {
    }
}
        ###############################################################################