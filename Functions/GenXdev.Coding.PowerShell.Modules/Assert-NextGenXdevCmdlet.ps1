################################################################################
<#
.SYNOPSIS
Asserts and improves the next GenXdev cmdlet in sequence.

.DESCRIPTION
This function processes GenXdev cmdlets one at a time, opening them in Visual
Studio Code and updating their AI prompts. It can filter by module name, reset
the sequence, customize prompts, and handle scripts integration.

.PARAMETER ModuleName
Name of the module to filter cmdlets by. Accepts wildcards. Default: "GenXdev.*"

.PARAMETER Reset
Switch to restart processing from the first cmdlet in the sequence.

.PARAMETER RedoLast
Switch to reprocess the previously handled cmdlet instead of advancing.

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

.EXAMPLE
Assert-NextGenXdevCmdlet -ModuleName "GenXdev.Helpers" `
                        -PromptKey "CheckAllRequirements" `
                        -Reset

.EXAMPLE
nextcmdlet GenXdev.Helpers -Reset
#>
function Assert-NextGenXdevCmdlet {

    [CmdletBinding()]
    [Alias("nextcmdlet")]

    param(
        ########################################################################
        [Alias("Name", "Module")]
        [parameter(
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
            Position = 1,
            HelpMessage = "Key for storing the last cmdlet index"
        )]
        [AllowEmptyString()]
        [string] $Key = "",

        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "The AI prompt key to use for template selection"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey = "CheckAllRequirements",

        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = "Custom AI prompt text to use"
        )]
        [AllowEmptyString()]
        [string] $Prompt = "",
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Switch to only edit the AI prompt"
        )]
        [switch] $EditPrompt,
        ########################################################################
        [parameter(
            HelpMessage = "Switch to scripts from the script folder"
        )]
        [switch] $FromScripts,
        ########################################################################
        [parameter(
            HelpMessage = "Switch to integrating scripts from the script folder"
        )]
        [switch] $Integrate,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Indicates to skip cmdlets that already have unit-tests"
        )]
        [switch] $OnlyNonExisting
    )

    process {


        # get the next cmdlet to process based on tracking state and filters
        $cmdlet = Get-GenXDevNextCmdLet `
            -ModuleName $ModuleName `
            -Reset:$Reset `
            -RedoLast:$RedoLast `
            -Key:$Key `
            -OnlyNonExisting:$OnlyNonExisting

	if ($null -eq $cmdlet) {

	    Write-Error "Cmdlet not found"
	    return;
	}

        # log the current cmdlet being processed for diagnostics

        Write-Verbose "Processing cmdlet: $($cmdlet.Name)"

        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName Assert-GenXdevCmdlet `
            -BoundParameters $PSBoundParameters `
            -DefaultValues (Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)

        # prepare parameters for test assertion call
        $invocationParams.CmdletName = $cmdlet.Name
        $invocationParams.Prompt     = $Prompt



        # execute the test assertion with prepared parameters
        Assert-GenXdevCmdlet @$invocationParams
    }

    end {
    }
}
################################################################################