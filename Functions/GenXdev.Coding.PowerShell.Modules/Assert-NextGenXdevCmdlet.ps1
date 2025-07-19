###############################################################################
<#
.SYNOPSIS
Asserts and improves the next GenXdev cmdlet in sequence.

.DESCRIPTION
This function processes GenXdev cmdlets one at a time, opening them in Visual
Studio Code and updating their AI prompts. It can filter by module name, reset
the sequence, customize prompts, and handle scripts integration.

.PARAMETER ModuleName
Name of the module to filter cmdlets by. Accepts wildcards. Default: "GenXdev.*"

.PARAMETER Key
Storage key for tracking the current cmdlet index in the sequence.

.PARAMETER PromptKey
Template key for selecting the AI prompt to use.

.PARAMETER Prompt
Custom AI prompt text to override the template.

.PARAMETER EditPrompt
Switch to modify only the AI prompt without changing the cmdlet.

.PARAMETER FromScripts
Switch to process scripts from the script folder instead of module cmdlets.

.PARAMETER Integrate
Switch to integrate scripts from the script folder into the module.

.PARAMETER OnlyNonExisting
Switch to skip cmdlets that already have associated unit tests.

.PARAMETER Reset
Switch to restart processing from the first cmdlet in the sequence.

.PARAMETER RedoLast
Switch to reprocess the previously handled cmdlet instead of advancing.

.EXAMPLE
Assert-NextGenXdevCmdlet -ModuleName "GenXdev.Helpers" `
                        -PromptKey "CheckAllRequirements" `
                        -Reset

.EXAMPLE
nextcmdlet GenXdev.Helpers -Reset
#>
function Assert-NextGenXdevCmdlet {

    [CmdletBinding()]
    [Alias('nextcmdlet')]
    param(
        ########################################################################
        [Alias('Name', 'Module')]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Optional module name to filter cmdlets by'
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string] $ModuleName = 'GenXdev.*',
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'Key for storing the last cmdlet index'
        )]
        [AllowEmptyString()]
        [string] $Key = '',
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'The AI prompt key to use for template selection'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey = 'CheckAllRequirements',
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = 'Custom AI prompt text to use'
        )]
        [AllowEmptyString()]
        [string] $Prompt = '',
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Switch to only edit the AI prompt'
        )]
        [switch] $EditPrompt,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Switch to scripts from the script folder'
        )]
        [switch] $FromScripts,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Switch to integrating scripts from script folder'
        )]
        [switch] $Integrate,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Skip cmdlets that already have unit-tests'
        )]
        [switch] $OnlyNonExisting
    )

    begin {
    }


    process {

        # retrieve the next cmdlet to process based on filters and state
            $cmdlet = GenXdev.Coding\Get-GenXDevNextCmdLet `
                -ModuleName $ModuleName `
                -Reset:$Reset `
                -RedoLast:$RedoLast `
                -Key:$Key `
                -OnlyNonExisting:$OnlyNonExisting

        # validate that we found a cmdlet to process
        if ($null -eq $cmdlet) {

            Microsoft.PowerShell.Utility\Write-Error 'Cmdlet not found'
            return;
        }

        # log verbose information about current cmdlet
        Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet: $($cmdlet.Name)"

        # copy matching parameters for Assert-GenXdevCmdlet function
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Coding\Assert-GenXdevCmdlet' `
            -BoundParameters $PSBoundParameters `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

        # set required parameters for cmdlet assertion
        $invocationParams.CmdletName = $cmdlet.Name
        $invocationParams.Prompt = $Prompt

        # execute the cmdlet assertion with prepared parameters
        GenXdev.Coding\Assert-GenXdevCmdlet @$invocationParams
    }

    end {
    }
}