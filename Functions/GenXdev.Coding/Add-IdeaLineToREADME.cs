// ################################################################################
// Part of PowerShell module : GenXdev.Coding
// Original cmdlet filename  : Add-IdeaLineToREADME.cs
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
    /// Adds an idea item to the README.md file.
    /// </para>
    ///
    /// <para type="description">
    /// Adds a timestamped idea to the "## Ideas" section of a README.md file.
    /// Can display the modified section and open in Visual Studio Code.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Line &lt;String&gt;<br/>
    /// The idea text to add. Will be prefixed with current date if not empty.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: ""<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Code &lt;SwitchParameter&gt;<br/>
    /// Opens the README in Visual Studio Code after modification.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Show &lt;SwitchParameter&gt;<br/>
    /// Displays the modified section after changes.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseHomeREADME &lt;SwitchParameter&gt;<br/>
    /// Uses README in PowerShell profile directory instead of current location.<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseOneDriveREADME &lt;SwitchParameter&gt;<br/>
    /// Uses README in OneDrive directory instead of current location.<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Add an idea to the README</para>
    /// <para>Adds a timestamped idea to the README file.</para>
    /// <code>
    /// Add-IdeaLineToREADME -Line "Create new PowerShell module" -Show
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Use the alias to add an idea</para>
    /// <para>Demonstrates using the 'idea' alias to add an idea.</para>
    /// <code>
    /// idea "New feature idea" -UseOneDriveREADME
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Add, "IdeaLineToREADME")]
    [Alias("idea")]
    [OutputType(typeof(PSObject))]
    public class AddIdeaLineToREADMECommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The idea text to add. Will be prefixed with current date if not empty.
        /// </summary>
        [Parameter(
            Position = 0,
            ValueFromRemainingArguments = false,
            Mandatory = false,
            HelpMessage = "The idea text to add")]
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
            WriteVerbose("Starting Add-IdeaLineToREADME");
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
                "## Ideas",
                "- ☐ ",
                processedLine,
                UseHomeREADME.ToBool(),
                UseOneDriveREADME.ToBool()
            );
            foreach (var result in results)
            {
                WriteObject(result.ToString().Trim());
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