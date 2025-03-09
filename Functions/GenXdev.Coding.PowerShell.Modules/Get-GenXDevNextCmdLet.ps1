################################################################################
<#
.SYNOPSIS
Retrieves the next GenXdev cmdlet to be improved.

.DESCRIPTION
This function manages a sequential list of GenXdev cmdlets for systematic
improvement. It tracks progress using a key-value store and can filter cmdlets by
module name. The function supports starting over, redoing the last cmdlet, and
filtering for cmdlets without unit tests.

.PARAMETER ModuleName
The name of the module to filter cmdlets (supports wildcards). Default: GenXdev.*

.PARAMETER Reset
Switch to restart the sequence from the beginning.

.PARAMETER RedoLast
Switch to process the previous cmdlet again instead of advancing.

.PARAMETER Key
Custom key name for storing progress in the key-value store.

.PARAMETER FromScripts
Switch to process scripts from the Scripts folder instead of module cmdlets.

.PARAMETER OnlyNonExisting
Switch to skip cmdlets that already have unit tests.

.EXAMPLE
Get-GenXDevNextCmdLet -ModuleName "GenXdev.Helpers" -Reset

.EXAMPLE
Get-GenXDevNextCmdLet GenXdev.Helpers
#>
function Get-GenXDevNextCmdLet {

    [CmdletBinding()]

    param (
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = "Search pattern to filter cmdlets"
        )]
        [Alias("Filter", "CmdLet", "Cmd", "FunctionName", "Name")]
        [SupportsWildcards()]
        [string] $CmdletName = "*",
        ########################################################################
        [parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 1,
            HelpMessage = "GenXdev module names to search"
        )]
        [Alias("Module", "ModuleName")]
        [SupportsWildcards()]
        [string[]] $BaseModuleName = @("GenXdev*"),
        ########################################################################
        [Parameter(Mandatory = $false)]
        [switch] $NoLocal,
        ########################################################################

        [Parameter(Mandatory = $false)]
        [switch] $OnlyPublished,
        ########################################################################

        [Parameter(Mandatory = $false)]
        [switch] $FromScripts,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Start from the beginning"
        )]
        [switch] $Reset,

        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't advance to the next cmdlet"
        )]
        [switch] $RedoLast,

        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Key for storing the last cmdlet index"
        )]
        [string] $Key = "",

        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Indicates to skip cmdlets that already have unit-tests"
        )]
        [switch] $OnlyNonExisting
    )

    begin {

        Write-Verbose "Initializing cmdlet retrieval process"

        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.Helpers\Get-GenXDevCmdlets" `
            -BoundParameters $PSBoundParameters

        $filteredCmdLets = GenXdev.Helpers\Get-GenXDevCmdlets @invocationParams

        if ($OnlyNonExisting) {

            # filter out cmdlets that already have tests
            Write-Verbose "Filtering for cmdlets without unit tests"
            $filteredCmdLets = $filteredCmdLets |
                ForEach-Object {

                    if (-not [IO.File]::Exists($PSItem.ScriptTestFilePath)) {

                        $PSItem
                    }
                }
        }

        # determine storage key for progress tracking
        if ([string]::IsNullOrWhiteSpace($Key)) {

            $Key = "$($ModuleName.ToLowerInvariant())"
        }
        else {

            $Key = "$($ModuleName.ToLowerInvariant())_$Key"
        }

        # retrieve current position from store
        Write-Verbose "Getting current index from store with key: $Key"
        [int] $currentIndex = Get-ValueByKeyFromStore -StoreName ModelDev `
            -KeyName $Key -DefaultValue -1

        # determine next cmdlet index
        [int] $index = $currentIndex

        if (-not $RedoLast -and -not $Reset) {

            $index++

            if ($index -ge $filteredCmdLets.Length) {

                $index = -1
                Set-ValueByKeyInStore -StoreName ModelDev -KeyName $Key -Value $index

                throw "This was the last command in the list. Reissue the command to start from the beginning."
            }
        }

        # ensure index wraps around list length
        $index = $index % [Math]::Max(1, $filteredCmdLets.Length)

        # handle reset request
        if ($Reset) { $index = 0 }

        # verify cmdlets were found
        if ($index -gt ($filteredCmdLets.Length - 1)) {

            throw "No commandlets found for module $ModuleName"
            return
        }

        # update stored index unless redoing last cmdlet
        if (-not $RedoLast) {

            Write-Verbose "Updating stored index to: $index"
            Set-ValueByKeyInStore -StoreName ModelDev -KeyName $Key -Value $index
        }

        # get the selected cmdlet
        $nextCmdLet = $filteredCmdLets[$index]
    }

    process {

        $nextCmdLet
    }

    end {
    }
}
################################################################################
