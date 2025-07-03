        ###############################################################################
function Search-NextGenXdevCmdlet {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    [Alias("nextcmdlet")]

    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
            ParameterSetName = "Default",
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Optional module name to filter cmdlets by"
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $ModuleName = "GenXdev.*",
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = "Key for storing the last cmdlet index"
        )]
        [AllowEmptyString()]
        [string] $Key = "",

        ########################################################################
        [parameter(
            ParameterSetName = "FromScripts",
            HelpMessage = "Switch to scripts from the script folder"
        )]
        [switch] $FromScripts,

        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Indicates to skip cmdlets that already have unit-tests"
        )]
        [switch] $OnlyNonExisting
    )

    begin {

        # initialize cmdlet variable to track current cmdlet being processed
        $cmdlet = $null

        # build parameter hashtable for Get-GenXDevNextCmdLet
        $getNextParams = @{
            ModuleName      = $ModuleName
            Reset           = $Reset
            RedoLast        = $RedoLast
            Key             = $Key
            OnlyNonExisting = $OnlyNonExisting
        }

        # conditionally add FromScripts parameter based on switches
        if ($Integrate -or $FromScripts) {

            $null = $getNextParams.Add('FromScripts', $true)
        }

        # get next cmdlet to process using constructed parameters
        $cmdlet = GenXdev.Coding\Get-GenXDevNextCmdLet @getNextParams

        Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet: $($cmdlet.Name)"

        # prepare parameters for Assert-GenXdevCmdlet
        $params = @{
            CmdletName = ($cmdlet.Name)
        }

        if ($FromScripts) {
            $null = $params.Add('FromScripts', $true)
        }
    }


process {

        # search the current cmdlet with prepared parameters
        GenXdev.Coding\Search-GenXdevCmdlet @params
    }

    end {
    }
}
        ###############################################################################