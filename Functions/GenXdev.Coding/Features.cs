// ################################################################################
// Part of PowerShell module : GenXdev.Coding
// Original cmdlet filename  : Features.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 3.3.2026
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



using System.Management.Automation;
using System.Collections;

namespace GenXdev.Coding
{
    /// <summary>
    /// <para type="synopsis">
    /// Displays features from a README.md file.
    /// </para>
    ///
    /// <para type="description">
    /// Shows all features from the "## Features" section of a README.md file. Can use
    /// either the README in the current location, PowerShell profile directory, or
    /// OneDrive directory.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -UseHomeREADME &lt;SwitchParameter&gt;<br/>
    /// Use README.md from PowerShell profile directory instead of current location.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -UseOneDriveREADME &lt;SwitchParameter&gt;<br/>
    /// Use README.md from OneDrive directory instead of current location.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Display features from home README</para>
    /// <para>Shows all features from the README.md in the PowerShell profile directory.</para>
    /// <code>
    /// Features -UseHomeREADME
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "Features")]
    [Alias("features")]
    [OutputType(typeof(PSObject))]
    public class GetFeaturesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Use README.md from PowerShell profile directory instead of current location.
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            HelpMessage = "Use README in PowerShell profile directory"
        )]
        public SwitchParameter UseHomeREADME { get; set; }

        /// <summary>
        /// Use README.md from OneDrive directory instead of current location.
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = false,
            HelpMessage = "Use README in OneDrive directory"
        )]
        public SwitchParameter UseOneDriveREADME { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting Features function");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Invoke the script and write the results
            Hashtable ht = new System.Collections.Hashtable();
            ht["Show"] = true;
            string[] results = InvokeCmdlet<string>("GenXdev.Coding\\Add-FeatureLineToREADME", ht, true).ToArray<string>();
            foreach (string result in results)
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