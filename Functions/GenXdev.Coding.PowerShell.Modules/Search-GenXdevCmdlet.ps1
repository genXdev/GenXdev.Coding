
################################################################################
function Search-GenXdevCmdlet {

    [CmdletBinding(DefaultParameterSetName = "Default")]
    [Alias("searchcmdlet")]
    param(
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
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The ide to open the file in"
        )]
        [Alias("c")]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open in Visual Studio"
        )]
        [Alias("vs")]
        [switch] $VisualStudio
        #######################################################################
    )

    begin {

        # retrieve and validate the target cmdlet exists
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.Helpers\Get-GenXDevCmdlets" `
            -BoundParameters $PSBoundParameters

        $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlets @invocationParams |
        Select-Object -First 1

        if ($null -eq $cmdlet) {

            throw "Could not find GenXdev cmdlet $CmdletName"
        }

        # initialize core variables
        $CmdletName = $cmdlet.Name
        $previousClipboard = Get-Clipboard
        $CmdletName | Set-Clipboard

        Write-Verbose "Processing cmdlet: $CmdletName"
    }

    process {

        # open cmdlet in vscode and insert prompt
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.Coding\Open-SourceFileInIde" `
            -BoundParameters $PSBoundParameters

        $invocationParams.KeysToSend = @("^+f", "^a", "{DELETE}", "^v", "{ENTER}")
        $invocationParams.Path = $cmdlet.ScriptFilePath
        $invocationParams.LineNo = $cmdlet.LineNo

        Open-SourceFileInIde @invocationParams
    }

    end {

        Start-Sleep 3;
        # copy final prompt for use
        $null = Set-Clipboard -Value $previousClipboard
    }
}
################################################################################
