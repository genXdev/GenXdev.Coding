// ################################################################################
// Part of PowerShell module : GenXdev.Coding
// Original cmdlet filename  : Add-ReleaseNoteLineToREADME.cs
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
using System.Management.Automation;

namespace GenXdev.Coding
{
    /// <summary>
    /// <para type="synopsis">
    /// Adds a ReleaseNote line to the README file with a timestamp.
    /// </para>
    ///
    /// <para type="description">
    /// Adds a ReleaseNote line to the specified README file, prefixed with the current date
    /// in yyyyMMdd format. The line can be formatted as code and optionally displayed.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Line &lt;String&gt;<br/>
    /// The ReleaseNote description text to add to the README file.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: ""<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Code &lt;SwitchParameter&gt;<br/>
    /// Switch to format the line as code in the README file.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Show &lt;SwitchParameter&gt;<br/>
    /// Switch to display the README file after adding the line.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseHomeREADME &lt;SwitchParameter&gt;<br/>
    /// Switch to use the README file in the home directory.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseOneDriveREADME &lt;SwitchParameter&gt;<br/>
    /// Switch to use the README file in the OneDrive directory.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Add a release note to the README</para>
    /// <para>Adds a release note with the current date to the README file.</para>
    /// <code>
    /// Add-ReleaseNoteLineToREADME -Line "Added new Git ReleaseNote"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Add a release note using the alias and format as code</para>
    /// <para>Adds a release note formatted as code and displays the README.</para>
    /// <code>
    /// ReleaseNote "Added new Git ReleaseNote" -Code -Show
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Add, "ReleaseNoteLineToREADME")]
    [Alias("releasenote")]
    [OutputType(typeof(void))]
    public class AddReleaseNoteLineToREADMECommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The ReleaseNote description text to add
        /// </summary>
        [Parameter(
            Position = 0,
            ValueFromRemainingArguments = false,
            Mandatory = false,
            HelpMessage = "The ReleaseNote description text to add")]
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
            WriteVerbose("Starting Add-ReleaseNoteLineToREADME with line: " + Line);
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
                "## Release notes",
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
        }
    }
}