################################################################################
<#
.SYNOPSIS
Automates testing improvements for GenXdev cmdlets by managing test creation.

.DESCRIPTION
Systematically processes GenXdev cmdlets to create or improve their unit tests.
It can work through cmdlets sequentially, allowing for AI-assisted test
generation using customizable prompts. The function maintains state to track
progress and can skip cmdlets that already have tests.

.PARAMETER ModuleName
The module name pattern to filter cmdlets (e.g., "GenXdev.*"). Used to focus
test creation on specific modules.

.PARAMETER Reset
When specified, restarts the cmdlet processing from the beginning of the list.

.PARAMETER RedoLast
When specified, processes the same cmdlet again instead of moving to the next.

.PARAMETER Key
Custom identifier for storing the progress state. The string ".Tests" will be
appended to this key.

.PARAMETER Prompt
Custom AI prompt text to use for test generation guidance.

.PARAMETER EditPrompt
When specified, allows editing of the AI prompt without processing the cmdlet.

.PARAMETER OnlyNonExisting
When specified, skips cmdlets that already have unit tests implemented.

.EXAMPLE
Assert-NextGenXdevCmdletTest -ModuleName "GenXdev.Helpers" `
                             -Reset `
                             -OnlyNonExisting

.EXAMPLE
nextcmdlettest GenXdev.Helpers -Reset
#>
function Assert-NextGenXdevCmdletTest {

    [CmdletBinding()]
    [Alias("nextcmdlettest")]

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
            HelpMessage = "Switch to start from the beginning of the cmdlet list"
        )]
        [switch] $Reset,

        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "Switch to not advance to the next cmdlet"
        )]
        [switch] $RedoLast,

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
            Mandatory = $false,
            Position = 4,
            HelpMessage = "Custom AI prompt text to use"
        )]
        [AllowEmptyString()]
        [string] $Prompt = "",

        ########################################################################
        [parameter(
            Position = 5,
            Mandatory = $false,
            HelpMessage = "The AI prompt key to use for template selection"
        )]
        [AllowEmptyString()]
        [string] $PromptKey,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Switch to only edit the AI prompt"
        )]
        [switch] $EditPrompt,

        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Indicates to skip cmdlets that already have unit-tests"
        )]
        [switch] $OnlyNonExisting
    )


process {

        # append '.Tests' to the tracking key to differentiate from main cmdlets
        $Key = "$Key.Tests"

        # get the next cmdlet to process based on tracking state and filters
        $cmdlet = GenXdev.Coding\Get-GenXDevNextCmdLet `
            -ModuleName $ModuleName `
            -Reset:$Reset `
            -RedoLast:$RedoLast `
            -Key:$Key `
            -OnlyNonExisting:$OnlyNonExisting

        if ($null -eq $cmdlet) {
            Microsoft.PowerShell.Utility\Write-Error "Cmdlet not found"
            return;
        }

        # log the current cmdlet being processed for diagnostics
        Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet: $($cmdlet.Name)"

        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.Coding\Assert-GenXdevCmdletTests" `
            -BoundParameters $PSBoundParameters `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)

        # prepare parameters for test assertion call
        $invocationParams.CmdletName = $cmdlet.Name
        $invocationParams.Prompt = $Prompt

        # execute the test assertion with prepared parameters
        GenXdev.Coding\Assert-GenXdevCmdletTests @$invocationParams
    }

    end {
    }
}
################################################################################