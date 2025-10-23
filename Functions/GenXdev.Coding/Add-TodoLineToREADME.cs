// ################################################################################
// Part of PowerShell module : GenXdev.Coding
// Original cmdlet filename  : Add-TodoLineToREADME.cs
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
using System.Management.Automation;

namespace GenXdev.Coding
{
    /// <summary>
    /// <para type="synopsis">
    /// Adds a todo item to the README.md file.
    /// </para>
    ///
    /// <para type="description">
    /// Adds a timestamped todo item to the "## Todoos" section of a README.md file.
    /// The todo items can be marked as done and the modified section can be displayed.
    /// Each new todo item is automatically timestamped unless marking as done.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Line &lt;String&gt;<br/>
    /// The todo item text to add. Will be prefixed with current date if not empty.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: ""<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Code &lt;SwitchParameter&gt;<br/>
    /// Opens the README in Visual Studio Code after modification.<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Show &lt;SwitchParameter&gt;<br/>
    /// Displays the modified section after changes.<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Done &lt;SwitchParameter&gt;<br/>
    /// Marks the specified todo item as completed.<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseHomeREADME &lt;SwitchParameter&gt;<br/>
    /// Uses README in PowerShell profile directory instead of current location.<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseOneDriveREADME &lt;SwitchParameter&gt;<br/>
    /// Uses README in OneDrive directory instead of current location.<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Add a todo item to the README</para>
    /// <para>Adds "Implement new feature" as a todo item and opens the README in VS Code.</para>
    /// <code>
    /// Add-TodoLineToREADME -Line "Implement new feature" -Show -Code
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Mark a todo item as done using alias</para>
    /// <para>Uses the 'todo' alias to mark "Fix bug" as completed.</para>
    /// <code>
    /// todo "Fix bug" -Done
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Add, "TodoLineToREADME")]
    [Alias("todo")]
    [OutputType(typeof(void))]
    public class AddTodoLineToREADMECommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The todo item text to add
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            ValueFromRemainingArguments = false,
            ValueFromPipeline = true,
            HelpMessage = "The todo item text to add"
        )]
        [AllowEmptyString()]
        public string Line { get; set; } = "";

        /// <summary>
        /// Open README in Visual Studio Code
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Open README in Visual Studio Code"
        )]
        public SwitchParameter Code { get; set; }

        /// <summary>
        /// Show the modified section
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Show the modified section"
        )]
        public SwitchParameter Show { get; set; }

        /// <summary>
        /// Mark todo item as completed
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Mark todo item as completed"
        )]
        public SwitchParameter Done { get; set; }

        /// <summary>
        /// Use README in PowerShell profile directory
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Use README in PowerShell profile directory"
        )]
        public SwitchParameter UseHomeREADME { get; set; }

        /// <summary>
        /// Use README in OneDrive directory
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Use README in OneDrive directory"
        )]
        public SwitchParameter UseOneDriveREADME { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose($"Starting Add-TodoLineToREADME with parameters: Line='{Line}', Code={Code}, Show={Show}, Done={Done}, UseHomeREADME={UseHomeREADME}, UseOneDriveREADME={UseOneDriveREADME}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Only add timestamp if line is not empty and not marking as done
            string processedLine = Line;
            if (!string.IsNullOrWhiteSpace(Line) && !Done)
            {
                // Prefix line with current date in yyyyMMdd format
                processedLine = $"{DateTime.Now.ToString("yyyyMMdd")} --> {Line}";
                WriteVerbose($"Formatted todo line: {processedLine}");
            }

            // Call Add-LineToREADME using ScriptBlock for safe parameter passing
            var scriptBlock = ScriptBlock.Create(@"
                param($Code, $Show, $Done, $Section, $Prefix, $Line, $UseHomeREADME, $UseOneDriveREADME)
                GenXdev.Coding\Add-LineToREADME -Code:$Code -Show:$Show -Done:$Done -Section $Section -Prefix $Prefix -Line $Line -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
            ");

            // Invoke the script block with parameters and output results
            var results = scriptBlock.Invoke(
                Code.ToBool(),
                Show.ToBool(),
                Done.ToBool(),
                "## Todoos",
                "- ☐ ",
                processedLine,
                UseHomeREADME.ToBool(),
                UseOneDriveREADME.ToBool()
            );
            foreach (var result in results)
            {
                WriteObject(result);
            }
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