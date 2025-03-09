################################################################################
<#
.SYNOPSIS
Sets the current cmdlet position for module development navigation.

.DESCRIPTION
This function stores the index position of a specified cmdlet in a module to
enable efficient navigation between cmdlets during module development. It uses
caching to improve performance and maintains state between sessions.

.PARAMETER CmdletName
The name of the cmdlet to set as the current position. This cmdlet will be the
next one in the navigation sequence.

.PARAMETER Key
Optional key to use for storing the cmdlet index position. If not specified,
defaults to using just the module name as the storage key.

.EXAMPLE
Set-GenXDevNextCmdLet -CmdletName "Get-Something"

.EXAMPLE
Set-GenXDevNextCmdLet "Get-Something" -Key "CustomKey"
#>
function Set-GenXDevNextCmdLet {

    [CmdletBinding()]
    param (
        ###########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Name of the cmdlet to set as current position"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $CmdletName,
        ###########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Key for storing the last cmdlet index"
        )]
        [string] $Key = ""
    )

    begin {

        # check if cmdlets are already cached, if so use cache to improve performance
        $allCmdlets = if ($Global:AllGenXdevCmdletsCache) {
            Write-Verbose "Using existing cmdlet cache for better performance"
            $Global:AllGenXdevCmdletsCache
        }
        else {
            Write-Verbose "Building initial cmdlet cache"
            Get-GenXDevCmdlets -ModuleName GenXdev.*
        }

        # maintain cache for subsequent calls
        $Global:AllGenXdevCmdletsCache = $allCmdlets

        # filter cmdlets to only those matching the module name pattern
        $filteredCmdlets = $allCmdlets |
        Where-Object -Property "ModuleName" -Like $ModuleName

        # construct storage key using module name and optional custom key
        $storageKey = if ([string]::IsNullOrWhiteSpace($Key)) {
            "$($ModuleName.ToLowerInvariant())"
        }
        else {
            "$($ModuleName.ToLowerInvariant())_$Key"
        }

        Write-Verbose "Using storage key: $storageKey for state persistence"

        # retrieve current index from persistent storage
        [int] $currentIndex = Get-ValueByKeyFromStore `
            -StoreName ModelDev `
            -KeyName $storageKey `
            -DefaultValue -1

        Write-Verbose "Retrieved current index: $currentIndex"
    }

    process {

        $found = $false

        # search for the specified cmdlet in the filtered list
        for ($i = 0; $i -lt $filteredCmdlets.Length; $i++) {

            $cmdlet = $filteredCmdlets[$i]
            if ($cmdlet.Name -eq $CmdletName) {

                # set index to previous position so this becomes "next"
                $currentIndex = $i - 1
                $found = $true
                Write-Information "Found cmdlet '$CmdletName' and set as next in sequence"
                break
            }
        }

        # persist the index if cmdlet was found
        if ($found) {

            Write-Verbose "Persisting index $currentIndex with key $storageKey"
            $null = Set-ValueByKeyFromStore `
                -StoreName ModelDev `
                -KeyName $storageKey `
                -Value $currentIndex
        }
        else {
            Write-Warning "Cmdlet '$CmdletName' not found in module"
        }
    }

    end {
    }
}
################################################################################
