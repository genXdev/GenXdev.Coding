################################################################################
<#
.SYNOPSIS
Evaluates source files for refactoring eligibility using LLM analysis.

.DESCRIPTION
Uses Language Learning Model (LLM) analysis to determine if a source code file
should be selected for refactoring based on specified criteria. The function
processes the file content through an LLM query and returns a boolean response.

.PARAMETER RefactorDefinition
A RefactorDefinition object containing the LLM configuration and selection
criteria settings used to evaluate the source file.

.PARAMETER Path
The full filesystem path to the source code file that needs to be evaluated
for potential refactoring.

.EXAMPLE
Test-RefactorLLMSelection -RefactorDefinition $refDef -Path "C:\source.ps1"

.EXAMPLE
$def | Test-RefactorLLMSelection -Path source.ps1
#>
function Test-RefactorLLMSelection {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The refactor definition containing LLM settings"
        )]
        [ValidateNotNull()]
        [GenXdev.Helpers.RefactorDefinition] $RefactorDefinition,
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "The path to the source file to evaluate"
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("FullName")]
        [string] $Path
        ########################################################################
    )

    begin {

        Write-Verbose "Starting refactor selection analysis for: $Path"

        # extract the selection criteria prompt from the refactor settings
        $prompt = $RefactorDefinition.SelectionSettings.LLM.Prompt
    }

    process {

        # validate that the target file exists before processing
        if (-not [System.IO.File]::Exists($Path)) {
            throw "The file '$Path' does not exist"
        }

        # ensure we have valid selection criteria
        if ([string]::IsNullOrWhiteSpace($prompt)) {
            throw "The prompt is empty"
        }

        # prepare the llm query parameters by matching available parameters
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters ($RefactorDefinition.SelectionSettings.LLM | ConvertTo-HashTable) `
            -FunctionName "GenXdev.AI\Invoke-LLMQuery" `
            -DefaultValues (Get-Variable -Scope Local -Name * `
                -ErrorAction SilentlyContinue)

        # construct the complete instruction set for the llm query
        $invocationParams.Instructions = @"
You are a helpfull assistant, the user wants your help to find a true or false answer.
The answer is wheter to select the source code file provided for refactoring.
The user will provide the criteria for the selection.
Your job is to judge the source code file based on the criteria
and return the answer as a boolean value wrapped as a json string.
so only output either "true" or "false", nothing else.

The source code file's content will now follow:

$([System.IO.File]::ReadAllText($Path))
"@

        # configure the remaining required llm query parameters
        $invocationParams.Query = $prompt
        $invocationParams.ChatMode = "none"
        $invocationParams.ChatOnce = $false
        $invocationParams.IncludeThoughts = $false

        Write-Verbose "Invoking LLM analysis with selection criteria"

        # execute the llm query and convert response to boolean
        return ("$((GenXdev.AI\Invoke-LLMQuery @invocationParams -ErrorAction SilentlyContinue -TTLSeconds 120 -Verbose:$false | Out-String))".ToLowerInvariant().Contains("true"))
    }

    end {
    }
}
################################################################################