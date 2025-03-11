################################################################################
<#
.SYNOPSIS
Creates a new GenXdev PowerShell cmdlet with proper structure and validation.

.DESCRIPTION
Creates a new PowerShell cmdlet following GenXdev standards, including parameter
validation, help documentation, and proper verb-noun naming convention. The
function validates the verb against approved PowerShell verbs and ensures proper
casing of both verb and noun components.

.PARAMETER CmdletName
The name of the cmdlet to create. Must follow the Verb-Noun format using an
approved PowerShell verb.

.PARAMETER PromptKey
The AI prompt key used to select a template for generating the cmdlet content.
Defaults to "NewGenXdevCmdLet".

.PARAMETER Prompt
Custom AI prompt text to guide the generation of the cmdlet content. Defaults to
a basic boilerplate request.

.PARAMETER EditPrompt
When specified, only opens the AI prompt for editing without creating the cmdlet.

.PARAMETER Integrate
When specified, integrates the new cmdlet into an existing module structure.

.EXAMPLE
New-GenXdevCmdlet -CmdletName "Get-SystemInfo" -PromptKey "SystemAnalysis"

.EXAMPLE
gcmd Get-SystemInfo -EditPrompt
#>
function New-GenXdevCmdlet {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("gcmd")]
    param (
        ########################################################################
        [Alias("cmd")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The name of the cmdlet to create (must use approved verb)"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $CmdletName,
        ########################################################################
        [parameter(
            ParameterSetName = "PromptKey",
            Position = 1,
            HelpMessage = "The AI prompt key to use for template selection"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey = "NewGenXdevCmdLet",
        ########################################################################
        [parameter(
            HelpMessage = "Custom AI prompt text to use for cmdlet generation"
        )]
        [AllowEmptyString()]
        [string] $Prompt = "Create a boilerplate GenXdev cmdlet that does what it's name suggests",
        ########################################################################
        [parameter(
            ParameterSetName = "Default",
            HelpMessage = "Only edit the AI prompt without creating the cmdlet"
        )]
        [parameter(
            ParameterSetName = "PromptKey",
            HelpMessage = "Only edit the AI prompt without creating the cmdlet"
        )]
        [switch] $EditPrompt,
        ########################################################################
        [parameter(
            HelpMessage = "Integrate the new cmdlet into an existing module"
        )]
        [switch] $Integrate
    )

    begin {

        # find the position of the verb-noun separator
        $verbNounSplit = $CmdletName.IndexOf('-')
        $verb = $null
        $noun = $null

        # separate the cmdlet name into verb and noun components
        if ($verbNounSplit -eq -1) {
            $verb = $CmdletName
            $noun = ''
        }
        else {
            $verb = $CmdletName.Substring(0, $verbNounSplit)
            $noun = $CmdletName.Substring($verbNounSplit + 1)
        }

        Write-Verbose "Processing cmdlet name: Verb='$verb', Noun='$noun'"
    }

    process {

        # validate the verb against the official powershell approved verbs list
        $verbs = @(Get-Verb | ForEach-Object Verb)
        if (-not ($verbs -contains $verb)) {
            throw "Invalid verb: $verb"
            return
        }

        # ensure the cmdlet doesn't already exist in the current session
        if ($null -ne (Get-Command -Name $CmdletName -ErrorAction SilentlyContinue)) {
            throw "Cmdlet $CmdletName already exists"
            return
        }

        # ensure proper casing for verb (first letter capital, rest lowercase)
        $verb = $verb.Substring(0, 1).ToUpper() + $verb.Substring(1).ToLower()

        # handle noun casing and reconstruct cmdlet name
        if (-not [string]::IsNullOrWhiteSpace($noun)) {
            $noun = $noun.Substring(0, 1).ToUpper() + $noun.Substring(1)
            $CmdletName = $verb + '-' + $noun
        }
        else {
            $CmdletName = $verb
        }

        Write-Verbose "Creating cmdlet with normalized name: $CmdletName"

        # ensure required parameters are present
        if (-not ($PSBoundParameters.ContainsKey('PromptKey'))) {
            $null = $PSBoundParameters.Add('PromptKey', $PromptKey)
        }

        if (-not ($PSBoundParameters.ContainsKey('Prompt'))) {
            $null = $PSBoundParameters.Add('Prompt', $Prompt)
        }

        # check if we should proceed with cmdlet creation
        $target = "PowerShell Cmdlet '$CmdletName'"
        $action = "Create new cmdlet file and validate structure"

        if ($PSCmdlet.ShouldProcess($target, $action)) {

            Write-Verbose "Creating cmdlet file at: $PSScriptRoot\$CmdletName.ps1"

            # create the new cmdlet file in the appropriate location
            $null = GenXdev.FileSystem\Expand-Path `
                "$PSScriptRoot\..\..\..\..\..\Scripts\$CmdletName.ps1" `
                -CreateFile

            # setup and execute the cmdlet assertion
            $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName "Assert-GenXdevCmdlet" `
                -DefaultValues (Get-Variable -Scope Local -Name * `
                    -ErrorAction SilentlyContinue)

            Assert-GenXdevCmdlet @invocationParams
        }
    }

    end {
    }
}
################################################################################