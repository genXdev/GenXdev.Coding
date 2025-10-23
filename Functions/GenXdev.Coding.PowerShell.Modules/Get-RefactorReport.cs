// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Get-RefactorReport.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.1.2025
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
using System.Management.Automation;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Generates a detailed report of refactoring operations and their status.
    /// </para>
    ///
    /// <para type="description">
    /// Analyzes and reports on the progress of refactoring operations by examining
    /// their current state, completion status, and affected functions. Provides output
    /// in either structured hashtable format or human-readable aligned text columns.
    /// The report includes refactor name, prompt key, priority, status, function count
    /// and completion percentage.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Name &lt;string[]&gt;<br/>
    /// The name pattern to filter refactors. Supports wildcards. Multiple names can be
    /// specified. Default value is "*" to display all refactors.<br/>
    /// - <b>Aliases</b>: none<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: "*"<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PreferencesDatabasePath &lt;string&gt;<br/>
    /// Specifies the path to the preferences database file.<br/>
    /// - <b>Aliases</b>: DatabasePath<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: none<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SessionOnly &lt;SwitchParameter&gt;<br/>
    /// If set, only use the session cache for refactor data.<br/>
    /// - <b>Aliases</b>: none<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ClearSession &lt;SwitchParameter&gt;<br/>
    /// If set, clear the session cache before running.<br/>
    /// - <b>Aliases</b>: none<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SkipSession &lt;SwitchParameter&gt;<br/>
    /// If set, skip loading session cache.<br/>
    /// - <b>Aliases</b>: FromPreferences<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -AsText &lt;SwitchParameter&gt;<br/>
    /// Output report in text format instead of Hashtable<br/>
    /// - <b>Aliases</b>: none<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-RefactorReport -Name "DatabaseRefactor" -AsText</para>
    /// <para>Generates a text report for refactors matching "DatabaseRefactor"</para>
    /// <code>
    /// Get-RefactorReport -Name "DatabaseRefactor" -AsText
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>refactorreport "*"</para>
    /// <para>Generates hashtable report for all refactors using alias</para>
    /// <code>
    /// refactorreport "*"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "RefactorReport")]
    [Alias("refactorreport")]
    [OutputType(typeof(Hashtable))]
    [OutputType(typeof(string))]
    public class GetRefactorReportCommand : PSGenXdevCmdlet
    {
        private bool headerOutput = false;

        private string textHeader = null;

        /// <summary>
        /// The name pattern to filter refactors. Supports wildcards. Multiple names can be
        /// specified. Default value is "*" to display all refactors.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            HelpMessage = "The name of the refactor, accepts wildcards",
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty]
        [SupportsWildcards]
        public string[] Name { get; set; } = new string[] { "*" };

        /// <summary>
        /// Specifies the path to the preferences database file.
        /// </summary>
        [Alias("DatabasePath")]
        [Parameter(
            Mandatory = false,
            HelpMessage = "Specifies the path to the preferences database file.")]
        public string PreferencesDatabasePath { get; set; }

        /// <summary>
        /// If set, only use the session cache for refactor data.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "If set, only use the session cache for refactor data.")]
        public SwitchParameter SessionOnly { get; set; }

        /// <summary>
        /// If set, clear the session cache before running.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "If set, clear the session cache before running.")]
        public SwitchParameter ClearSession { get; set; }

        /// <summary>
        /// If set, skip loading session cache.
        /// </summary>
        [Alias("FromPreferences")]
        [Parameter(
            Mandatory = false,
            HelpMessage = "If set, skip loading session cache.")]
        public SwitchParameter SkipSession { get; set; }

        /// <summary>
        /// Output report in text format instead of Hashtable
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Output report in text format instead of Hashtable")]
        public SwitchParameter AsText { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Initialize text output header if AsText parameter is specified
            WriteVerbose("Starting refactor report generation for pattern: " + string.Join(" ", Name));

            if (AsText.ToBool())
            {
                // Create aligned column headers with proper spacing
                textHeader = string.Join(" ", new string[]
                {
                    "Name".PadRight(10),
                    "PromptKey".PadRight(10),
                    "Prio".PadRight(4),
                    "Status".PadRight(10),
                    "Num".PadRight(4),
                    "%"
                });
            }
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Output header and separator for text format
            if (AsText.ToBool() && textHeader != null && !headerOutput)
            {
                WriteObject(textHeader);
                WriteObject(new string('-', textHeader.Length));
                headerOutput = true;
            }

            // Process each matching refactor
            var getRefactorScript = ScriptBlock.Create(@"
param($Name, $PreferencesDatabasePath, $SessionOnly, $ClearSession, $SkipSession)
GenXdev.Coding\Get-Refactor -Name $Name -PreferencesDatabasePath $PreferencesDatabasePath -SessionOnly:$SessionOnly -ClearSession:$ClearSession -SkipSession:$SkipSession
");
            var results = getRefactorScript.Invoke(Name, PreferencesDatabasePath, SessionOnly.ToBool(), ClearSession.ToBool(), SkipSession.ToBool());

            foreach (var result in results)
            {
                var psObject = (PSObject)result;

                // Calculate total functions affected by this refactor
                var selected = ((ArrayList)((PSObject)psObject.Properties["State"].Value).Properties["Selected"].Value).Count;
                var refactored = ((ArrayList)((PSObject)psObject.Properties["State"].Value).Properties["Refactored"].Value).Count;
                var unselected = ((ArrayList)((PSObject)psObject.Properties["State"].Value).Properties["Unselected"].Value).Count;
                var totalFunctions = selected + refactored + unselected;

                WriteVerbose("Processing refactor: " + (string)psObject.Properties["Name"].Value + " with " + totalFunctions + " items");

                if (AsText.ToBool())
                {
                    // Format text output with truncated columns
                    var name = ((string)psObject.Properties["Name"].Value).Substring(0,
                        Math.Min(10, ((string)psObject.Properties["Name"].Value).Length));
                    var promptKey = ((string)((PSObject)psObject.Properties["RefactorSettings"].Value).Properties["PromptKey"].Value).Substring(0,
                        Math.Min(10, ((string)((PSObject)psObject.Properties["RefactorSettings"].Value).Properties["PromptKey"].Value).Length));
                    var status = ((string)((PSObject)psObject.Properties["State"].Value).Properties["Status"].Value).Substring(0,
                        Math.Min(10, ((string)((PSObject)psObject.Properties["State"].Value).Properties["Status"].Value).Length));
                    var percent = ((double)((PSObject)psObject.Properties["State"].Value).Properties["PercentageComplete"].Value).ToString().Substring(0,
                        Math.Min(4, ((double)((PSObject)psObject.Properties["State"].Value).Properties["PercentageComplete"].Value).ToString().Length));

                    // Output formatted text row
                    var output = string.Format("{0} {1} {2} {3} {4} {5}%",
                        name.PadRight(10),
                        promptKey.PadRight(10),
                        ((int)psObject.Properties["Priority"].Value).ToString().PadRight(4),
                        status.PadRight(10),
                        totalFunctions.ToString().PadRight(4),
                        percent);
                    WriteObject(output);
                }
                else
                {
                    // Return hashtable with refactor details
                    var hashtable = new Hashtable
                    {
                        { "Name", psObject.Properties["Name"].Value },
                        { "PromptKey", ((PSObject)psObject.Properties["RefactorSettings"].Value).Properties["PromptKey"].Value },
                        { "Priority", psObject.Properties["Priority"].Value },
                        { "Status", ((PSObject)psObject.Properties["State"].Value).Properties["Status"].Value },
                        { "FunctionCount", totalFunctions },
                        { "PercentageComplete", ((PSObject)psObject.Properties["State"].Value).Properties["PercentageComplete"].Value }
                    };
                    WriteObject(hashtable);
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            WriteVerbose("Completed refactor report generation");
        }
    }
}