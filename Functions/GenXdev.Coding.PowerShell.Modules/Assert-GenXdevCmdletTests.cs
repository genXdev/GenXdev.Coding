// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Assert-GenXdevCmdletTests.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.302.2025
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
using System.Management.Automation.Host;
using System.Threading;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Asserts and improves unit-tests of a specified GenXdev cmdlet.
    /// </para>
    ///
    /// <para type="description">
    /// DESCRIPTION
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet helps maintain and improve unit tests for GenXdev
    /// cmdlets by:<br/>
    /// 1. Creating test files if they don't exist<br/>
    /// 2. Opening the cmdlet in VS Code<br/>
    /// 3. Preparing and applying AI prompts for test
    ///    generation/improvement<br/>
    /// 4. Managing test execution workflow<br/>
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -CmdletName &lt;string&gt;<br/>
    /// The name of the cmdlet to improve unit-tests for. Required.<br/>
    /// - <b>Aliases</b>: cmd<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Pipeline Input</b>: true (ByValue, ByPropertyName)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Prompt &lt;string&gt;<br/>
    /// Custom AI prompt text to use for test generation. Optional.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: "" (empty string)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PromptKey &lt;string&gt;<br/>
    /// The AI prompt key to use for template selection. Optional.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: "" (empty string)<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -EditPrompt &lt;switch&gt;<br/>
    /// Switch to only edit the AI prompt without modifying the cmdlet.
    /// Optional.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -AssertFailedTest &lt;switch&gt;<br/>
    /// Switch to indicate assertion of a failed test. Optional.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -FromScripts &lt;switch&gt;<br/>
    /// Search in script files instead of modules. Optional.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ContinuationHandled &lt;switch&gt;<br/>
    /// Internal switch to indicate continuation is handled. Optional.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example 1: Edit prompt for cmdlet test improvement</para>
    /// <para>
    /// Opens the AI prompt editor for the specified cmdlet without making
    /// changes.
    /// </para>
    /// <code>
    /// Assert-GenXdevCmdletTests -CmdletName "Get-GenXDevModuleInfo" `
    ///     -EditPrompt
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>
    /// Example 2: Improve cmdlet tests for failed test (using alias)
    /// </para>
    /// <para>
    /// Uses the alias to improve unit tests after a test failure.
    /// </para>
    /// <code>
    /// improvecmdlettests Get-GenXDevModuleInfo -AssertFailedTest
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet("Assert", "GenXdevCmdletTests")]
    [Alias("improvecmdlettests")]
    [OutputType(typeof(void))]
    public class AssertGenXdevCmdletTestsCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The name of the cmdlet to improve unit-tests for
        /// </summary>
        [Alias("cmd")]
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The name of the cmdlet to improve unit-tests for")]
        [ValidateNotNullOrEmpty]
        public string CmdletName { get; set; }

        /// <summary>
        /// Custom AI prompt text to use
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = false,
            HelpMessage = "Custom AI prompt text to use")]
        [AllowEmptyString]
        public string Prompt { get; set; } = string.Empty;

        /// <summary>
        /// The AI prompt key to use for template selection
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "The AI prompt key to use for template selection")]
        [AllowEmptyString]
        public string PromptKey { get; set; }

        /// <summary>
        /// Switch to only edit the AI prompt
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Switch to only edit the AI prompt")]
        public SwitchParameter EditPrompt { get; set; }

        /// <summary>
        /// Indicates to assert a failed test
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Indicates to assert a failed test")]
        public SwitchParameter AssertFailedTest { get; set; }

        /// <summary>
        /// Search in script files instead of modules
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Search in script files instead of modules")]
        public SwitchParameter FromScripts { get; set; }

        /// <summary>
        /// Internal switch to indicate continuation is handled
        /// </summary>
        [Parameter(Mandatory = false)]
        public SwitchParameter ContinuationHandled { get; set; }

        private PSObject cmdlet;
        private string promptFilePath;
        private string previousClipboard;

        /// <summary>
        /// Begin processing - initialization and prompt preparation
        /// </summary>
        protected override void BeginProcessing()
        {

            // Get target cmdlet information including script position
            var getCmdletParams = CopyIdenticalParamValues(
                "GenXdev.Helpers\\Get-GenXDevCmdlet"
            );

            getCmdletParams["ExactMatch"] = true;
            getCmdletParams["CmdletName"] = CmdletName;

            var getCmdletScript = ScriptBlock.Create(
                "param($params) GenXdev.Helpers\\Get-GenXDevCmdlet @params | " +
                "Microsoft.PowerShell.Utility\\Select-Object -First 1"
            );

            var cmdletResults = getCmdletScript.Invoke(getCmdletParams);

            if (cmdletResults == null || cmdletResults.Count == 0)
            {

                throw new Exception(
                    $"Could not find GenXdev cmdlet {CmdletName}"
                );
            }

            cmdlet = cmdletResults[0];

            // Store cmdlet name for later use
            CmdletName = (string)cmdlet.Properties["Name"].Value;

            string functionDefinition = string.Empty;

            // Determine which prompt template to use based on test file
            // existence
            if (!string.IsNullOrWhiteSpace(PromptKey))
            {

                PromptKey = "CreateUnitTests";

                string scriptFilePath =
                    (string)cmdlet.Properties["ScriptFilePath"].Value;

                functionDefinition = File.ReadAllText(scriptFilePath);

                string scriptTestFilePath =
                    (string)cmdlet.Properties["ScriptTestFilePath"].Value;

                if (File.Exists(scriptTestFilePath) &&
                    !string.IsNullOrWhiteSpace(functionDefinition))
                {

                    PromptKey = AssertFailedTest.ToBool() ?
                        "ResolveFailedTest" :
                        "ImproveUnitTest";
                }
            }

            // Process prompt template if key provided
            if (!string.IsNullOrWhiteSpace(PromptKey))
            {

                // Get the module base path and construct prompt file path
                string moduleBase = GetGenXdevModuleBase("GenXdev.Coding");

                string modulePath = Path.Combine(
                    moduleBase,
                    "Prompts",
                    "GenXdev.Coding.PowerShell.Modules",
                    $"Assert-{PromptKey}.txt"
                );

                // Expand and ensure directory exists
                promptFilePath = ExpandPath(
                    modulePath,
                    CreateDirectory: true
                );

                // Load template and replace placeholder
                Prompt = File.ReadAllText(promptFilePath).Replace(
                    "$Prompt",
                    Prompt
                );
            }

            // Populate template variables
            Prompt = Prompt.Replace("$CmdletName", CmdletName);
            Prompt = Prompt.Replace("$CmdLetNoTestName", CmdletName);

            string scriptTestFilePath2 =
                (string)cmdlet.Properties["ScriptTestFilePath"].Value;

            Prompt = Prompt.Replace(
                "$ScriptTestFileName",
                Path.GetFileName(scriptTestFilePath2)
            );

            string moduleName = (string)cmdlet.Properties["ModuleName"].Value;

            Prompt = Prompt.Replace("$FullModuleName", moduleName);

            string[] moduleNameParts = moduleName.Split('.');
            string baseModuleName = moduleNameParts.Length >= 2 ?
                string.Join(".", moduleNameParts[0], moduleNameParts[1]) :
                moduleName;

            Prompt = Prompt.Replace("$BaseModuleName", baseModuleName);

            string scriptFilePath2 =
                (string)cmdlet.Properties["ScriptFilePath"].Value;

            Prompt = Prompt.Replace(
                "$ScriptFileName",
                Path.GetFileName(scriptFilePath2)
            );

            Prompt = Prompt.Replace("$FunctionDefinition", functionDefinition);
            Prompt = Prompt.Replace("\t", "  ");

            // Copy final prompt for use
            var getClipboardScript = ScriptBlock.Create(
                "Microsoft.PowerShell.Management\\Get-Clipboard"
            );

            var clipboardResults = getClipboardScript.Invoke();

            if (clipboardResults != null && clipboardResults.Count > 0)
            {

                previousClipboard = clipboardResults[0]?.ToString() ??
                    string.Empty;
            }
            else
            {

                previousClipboard = string.Empty;
            }

            var setClipboardScript = ScriptBlock.Create(
                "param($value) " +
                "Microsoft.PowerShell.Management\\Set-Clipboard -Value $value"
            );

            setClipboardScript.Invoke(Prompt);
        }

        /// <summary>
        /// Process record - main cmdlet logic for test improvement
        /// </summary>
        protected override void ProcessRecord()
        {

            // Handle prompt editing request
            if (EditPrompt.ToBool())
            {

                var pScript = ScriptBlock.Create("p -c");
                foreach (var line in pScript.Invoke())
                {
                    Console.WriteLine(line.ToString().Trim());
                }

                var codeScript = ScriptBlock.Create(
                    "param($path) code $path"
                );

                foreach (var line in codeScript.Invoke(promptFilePath))
                {
                    Console.WriteLine(line.ToString().Trim());
                }

                return;
            }

            bool found = true;

            string scriptTestFilePath =
                (string)cmdlet.Properties["ScriptTestFilePath"].Value;

            // Create test file if missing
            if (!File.Exists(scriptTestFilePath) ||
                File.ReadAllText(scriptTestFilePath).Trim() == string.Empty)
            {

                found = false;

                WriteVerbose("Creating new unit test file");

                string expandedPath = ExpandPath(
                    scriptTestFilePath,
                    CreateFile: true
                );
            }

            // Ensure copilot keyboard shortcut is configured
            var ensureShortcutScript = ScriptBlock.Create(
                "GenXdev.Coding\\EnsureCopilotKeyboardShortCut"
            );

            ensureShortcutScript.Invoke();

            // Open cmdlet in vscode and activate copilot
            var showCmdletParams = CopyIdenticalParamValues(
                "GenXdev.Coding\\Show-GenXdevCmdLetInIde"
            );

            showCmdletParams["UnitTests"] = true;
            showCmdletParams["CmdletName"] = CmdletName;
            showCmdletParams["Code"] = true;

            var keysToSendFirst = new string[]
            {
                "^`", "^`", "^+i", "^n", "^a", "{DELETE}", "^%b"
            };

            var keysToSendLast = new string[]
            {
                "^+%{F12}", "{ENTER}", "^v", "{ENTER}", "^{ENTER}", "^`"
            };

            var allKeys = new string[keysToSendFirst.Length +
                keysToSendLast.Length];

            Array.Copy(keysToSendFirst, 0, allKeys, 0,
                keysToSendFirst.Length);

            Array.Copy(keysToSendLast, 0, allKeys, keysToSendFirst.Length,
                keysToSendLast.Length);

            showCmdletParams["KeysToSend"] = allKeys;

            var showCmdletScript = ScriptBlock.Create(
                "param($params) " +
                "GenXdev.Coding\\Show-GenXdevCmdLetInIde @params"
            );

            foreach (var line in showCmdletScript.Invoke(showCmdletParams))
            {
                Console.WriteLine(line.ToString().Trim());
            }

            // Switch to test file and paste prompt
            WriteVerbose("Applying AI prompt from clipboard");

            showCmdletParams["KeysToSend"] = keysToSendLast;
            showCmdletParams["UnitTests"] = false;

            foreach (var line in showCmdletScript.Invoke(showCmdletParams))
            {
                Console.WriteLine(line.ToString().Trim());
            }

            Thread.Sleep(1000);

            var setClipboardScript = ScriptBlock.Create(
                "param($value) " +
                "Microsoft.PowerShell.Management\\Set-Clipboard -Value $value"
            );

            setClipboardScript.Invoke(previousClipboard);

            Thread.Sleep(4000);

            if (ContinuationHandled.ToBool())
            {

                return;
            }

            // Handle workflow based on whether test file existed
            if (!found)
            {

                var choice = PromptForChoice(
                    "Make a choice",
                    "What to do next?",
                    new string[]
                    {
                        "&Stop",
                        "&Test the new unit tests",
                        "Redo &Last"
                    },
                    1
                );

                switch (choice)
                {
                    case 0:

                        throw new Exception("Stopped");

                    case 1:

                        var testNewScript = ScriptBlock.Create(
                            "param($cmdletName) " +
                            "GenXdev.Coding\\Assert-GenXdevTest " +
                            "-CmdletName $cmdletName " +
                            "-TestFailedAction SolveWithAI -IncludeScripts"
                        );

                        var testNewResults = testNewScript.Invoke(CmdletName);

                        if (testNewResults != null)
                        {

                            WriteObject(testNewResults, true);
                        }

                        return;

                    case 2:

                        var redoParams = new Hashtable();
                        redoParams["CmdletName"] = CmdletName;
                        redoParams["Prompt"] = Prompt;
                        redoParams["PromptKey"] = PromptKey;
                        redoParams["EditPrompt"] = EditPrompt.ToBool();
                        redoParams["AssertFailedTest"] =
                            AssertFailedTest.ToBool();
                        redoParams["FromScripts"] = FromScripts.ToBool();
                        redoParams["ContinuationHandled"] =
                            ContinuationHandled.ToBool();

                        var redoScript = ScriptBlock.Create(
                            "param($params) " +
                            "GenXdev.Coding\\Assert-GenXdevCmdletTests @params"
                        );

                        var redoResults = redoScript.Invoke(redoParams);

                        if (redoResults != null)
                        {

                            WriteObject(redoResults, true);
                        }

                        return;
                }
            }
            else
            {

                var choice = PromptForChoice(
                    "Make a choice",
                    "What to do next?",
                    new string[]
                    {
                        "&Stop",
                        "&Test the improved unit tests",
                        "Redo &Last"
                    },
                    1
                );

                switch (choice)
                {
                    case 0:

                        throw new Exception("Stopped");

                    case 1:

                        var testImprovedScript = ScriptBlock.Create(
                            "param($cmdletName) " +
                            "GenXdev.Coding\\Assert-GenXdevTest " +
                            "-CmdletName $cmdletName " +
                            "-TestFailedAction SolveWithAI -IncludeScripts"
                        );

                        var testImprovedResults = testImprovedScript.Invoke(
                            CmdletName
                        );

                        if (testImprovedResults != null)
                        {

                            WriteObject(testImprovedResults, true);
                        }

                        return;

                    case 2:

                        var redoParams = new Hashtable();
                        redoParams["CmdletName"] = CmdletName;
                        redoParams["Prompt"] = Prompt;
                        redoParams["PromptKey"] = PromptKey;
                        redoParams["EditPrompt"] = EditPrompt.ToBool();
                        redoParams["AssertFailedTest"] =
                            AssertFailedTest.ToBool();
                        redoParams["FromScripts"] = FromScripts.ToBool();
                        redoParams["ContinuationHandled"] =
                            ContinuationHandled.ToBool();

                        var redoScript = ScriptBlock.Create(
                            "param($params) " +
                            "GenXdev.Coding\\Assert-GenXdevCmdletTests @params"
                        );

                        var redoResults = redoScript.Invoke(redoParams);

                        if (redoResults != null)
                        {

                            WriteObject(redoResults, true);
                        }

                        return;
                }
            }
        }

        /// <summary>
        /// Helper method to prompt user for choice
        /// </summary>
        private int PromptForChoice(
            string caption,
            string message,
            string[] choices,
            int defaultChoice)
        {

            var choiceDescriptions = new System.Collections.ObjectModel
                .Collection<ChoiceDescription>();

            foreach (var choice in choices)
            {

                choiceDescriptions.Add(new ChoiceDescription(choice));
            }

            return Host.UI.PromptForChoice(
                caption,
                message,
                choiceDescriptions,
                defaultChoice
            );
        }

        /// <summary>
        /// End processing - cleanup
        /// </summary>
        protected override void EndProcessing()
        {

        }
    }
}
