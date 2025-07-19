###############################################################################
<#
.SYNOPSIS
Opens the specified GenXdev cmdlet in Visual Studio Code.

.DESCRIPTION
This function retrieves the script file and line number for the specified GenXdev
cmdlet and opens it in Visual Studio Code. It can open either the main function
implementation or its associated unit tests, based on the UnitTests switch
parameter.

.PARAMETER CmdletName
The name of the GenXdev cmdlet to locate and open in Visual Studio Code.

.PARAMETER UnitTests
When specified, opens the unit test file for the cmdlet instead of the main
implementation file.

.EXAMPLE
Show-GenXdevCmdLetInIde -CmdletName "Get-GenXDevModuleInfo"
Opens the implementation of Get-GenXDevModuleInfo in VSCode.

.EXAMPLE
editcmdlet Get-GenXDevModuleInfo -UnitTests
Opens the unit tests for Get-GenXDevModuleInfo using the alias.
#>
function Show-GenXdevCmdLetInIde {

    [CmdletBinding()]
    [Alias('editcmdlet')]
    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'Search pattern to filter cmdlets'
        )]
        [Alias('Filter', 'CmdLet', 'Cmd', 'FunctionName', 'Name')]
        [SupportsWildcards()]
        [string] $CmdletName = '*',
        ########################################################################
        [parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 1,
            HelpMessage = 'GenXdev module names to search'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Module', 'ModuleName')]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.\w+)+)+$')]
        [string[]] $BaseModuleName = @('GenXdev*'),
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
            HelpMessage = 'The ide to open the file in'
        )]
        [Alias('c')]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open in Visual Studio'
        )]
        [Alias('vs')]
        [switch] $VisualStudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Show the function's unit-tests instead of the function"
        )]
        [switch] $UnitTests,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The keys to send'
        )]
        [Alias('keys')]
        [string[]] $KeysToSend = @(),
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Add to Co-Pilot edit session'
        )]
        [switch] $CoPilot,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Also global search for the cmdlet'
        )]
        [switch] $Search
    )

    begin {

        $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut

        # retrieve and validate the target cmdlet exists
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Helpers\Get-GenXDevCmdlets' `
            -BoundParameters $PSBoundParameters
        $invocationParams.ExactMatch = $true
        $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlets @invocationParams |
            Microsoft.PowerShell.Utility\Select-Object -First 1

        if ($null -eq $cmdlet) {

            throw "Could not find GenXdev cmdlet $CmdletName"
        }

        # initialize core variables
        $CmdletName = $cmdlet.Name

        Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet: $CmdletName"
    }


    process {

        # open cmdlet in vscode and insert prompt
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Coding\Open-SourceFileInIde' `
            -BoundParameters $PSBoundParameters

        $invocationParams.Path = $UnitTests ? $cmdlet.ScriptTestFilePath : $cmdlet.ScriptFilePath
        $invocationParams.LineNo = $UnitTests ? 0 : ($cmdlet.LineNo)
        $invocationParams.KeysToSend = ($CoPilot ? @('+%E', '+%S', '^+%{F12}') : @('+%E', '+%S')) + @($KeysToSend ? $KeysToSend : @())

        GenXdev.Coding\Open-SourceFileInIde @invocationParams
    }

    end {

        if ($Search) {

            $invocationArgs = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Coding\Search-GenXdevCmdlet'

            $null = GenXdev.Coding\Search-GenXdevCmdlet @invocationArgs
        }
    }
}