// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Test-RefactorLLMSelection.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.304.2025
// ################################################################################
// Copyright (c)  René Vaessen / GenXdev
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ################################################################################



using System;
using System.Collections;
using System.IO;
using System.Management.Automation;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Evaluates source files for refactoring eligibility using LLM analysis.
    /// </para>
    ///
    /// <para type="description">
    /// Uses Language Learning Model (LLM) analysis to determine if a source code file
    /// should be selected for refactoring based on specified criteria. The function
    /// processes the file content through an LLM query and returns a boolean response.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -RefactorDefinition &lt;GenXdev.Helpers.RefactorDefinition&gt;<br/>
    /// A RefactorDefinition object containing the LLM configuration and selection
    /// criteria settings used to evaluate the source file.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Path &lt;string&gt;<br/>
    /// The full filesystem path to the source code file that needs to be evaluated
    /// for potential refactoring.<br/>
    /// - <b>Aliases</b>: FullName<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Test refactor selection for a PowerShell file</para>
    /// <para>This example evaluates whether a source file should be selected for refactoring based on the provided criteria.</para>
    /// <code>
    /// Test-RefactorLLMSelection -RefactorDefinition $refDef -Path "C:\source.ps1"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Test refactor selection using pipeline input</para>
    /// <para>This example demonstrates using the cmdlet with pipeline input for the refactor definition.</para>
    /// <code>
    /// $def | Test-RefactorLLMSelection -Path source.ps1
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsDiagnostic.Test, "RefactorLLMSelection")]
    [OutputType(typeof(bool))]
    public class TestRefactorLLMSelectionCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// A RefactorDefinition object containing the LLM configuration and selection
        /// criteria settings used to evaluate the source file.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "The refactor definition containing LLM settings")]
        [ValidateNotNull]
        public object RefactorDefinition { get; set; }

        /// <summary>
        /// The full filesystem path to the source code file that needs to be evaluated
        /// for potential refactoring.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 1,
            HelpMessage = "The path to the source file to evaluate")]
        [ValidateNotNullOrEmpty]
        [Alias("FullName")]
        public string Path { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting refactor selection analysis for: " + Path);

            // Extract the selection criteria prompt from the refactor settings
            // This is done in BeginProcessing to prepare for ProcessRecord
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Validate that the target file exists before processing
            if (!System.IO.File.Exists(Path))
            {
                throw new System.IO.FileNotFoundException("The file '" + Path + "' does not exist");
            }

            // Extract the selection criteria prompt from the refactor settings
            // Use dynamic to access properties
            dynamic refactorDef = RefactorDefinition;
            string prompt = refactorDef.SelectionSettings.LLM.Prompt;

            // Ensure we have valid selection criteria
            if (string.IsNullOrWhiteSpace(prompt))
            {
                throw new ArgumentException("The prompt is empty");
            }

            // Convert LLM settings to hashtable first
            var convertScript = ScriptBlock.Create(@"
param($obj)
GenXdev.Helpers\ConvertTo-HashTable -InputObject $obj
");

            var llmSettingsHashtable = convertScript.Invoke(refactorDef.SelectionSettings.LLM);

            // Prepare the llm query parameters by matching available parameters
            // Get local variables for default values
            var paramsHashtable = CopyIdenticalParamValues("GenXdev.AI\\Invoke-LLMBooleanEvaluation");

            // Construct the complete instruction set for the llm query
            string instructions = @"
You are a helpfull assistant, the user wants your help to find a true or false answer.
The answer is wheter to select the source code file provided for refactoring.
The user will provide the criteria for the selection.
Your job is to judge the source code file based on the criteria
and return the answer as a boolean value.

The source code file's content will now follow:

" + System.IO.File.ReadAllText(Path);

            // Configure the remaining required llm query parameters
            paramsHashtable["Instructions"] = instructions;
            paramsHashtable["Text"] = prompt;

            WriteVerbose("Invoking LLM analysis with selection criteria");

            // Execute the llm query and convert response to boolean
            // Use ScriptBlock to call Invoke-LLMBooleanEvaluation safely
            var invokeScript = ScriptBlock.Create(@"
param($params)
GenXdev.AI\Invoke-LLMBooleanEvaluation @params -ErrorAction SilentlyContinue -TTLSeconds 120 -LLMQueryType Coding
");

            var result = invokeScript.Invoke(paramsHashtable);

            // Return the boolean result
            WriteObject(result[0].BaseObject);
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}