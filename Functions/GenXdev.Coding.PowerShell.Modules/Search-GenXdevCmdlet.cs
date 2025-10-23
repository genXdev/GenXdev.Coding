// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Search-GenXdevCmdlet.cs
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
using System.Threading;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing.
    /// </para>
    ///
    /// <para type="description">
    /// This function searches for GenXdev cmdlets using a pattern and optionally opens
    /// the found cmdlet's source file in Visual Studio Code or Visual Studio for
    /// editing. It retrieves cmdlet information and provides keyboard shortcuts to
    /// quickly navigate to the function definition.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -CmdletName &lt;string&gt;<br/>
    /// Search pattern to filter cmdlets. Supports wildcards. Default is '*' to show all cmdlets.<br/>
    /// - <b>Aliases</b>: Filter, CmdLet, Cmd, FunctionName, Name<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: null<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ModuleName &lt;string[]&gt;<br/>
    /// GenXdev module names to search. Must match pattern starting with 'GenXdev'.<br/>
    /// - <b>Aliases</b>: Module, BaseModuleName, SubModuleName<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: null<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -NoLocal &lt;SwitchParameter&gt;<br/>
    /// Skip searching in local module paths when finding cmdlets.<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -OnlyPublished &lt;SwitchParameter&gt;<br/>
    /// Limit search to published module paths only.<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -FromScripts &lt;SwitchParameter&gt;<br/>
    /// Search in script files instead of module files.<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Code &lt;SwitchParameter&gt;<br/>
    /// Open the found cmdlet in Visual Studio Code.<br/>
    /// - <b>Aliases</b>: c<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -VisualStudio &lt;SwitchParameter&gt;<br/>
    /// Open the found cmdlet in Visual Studio.<br/>
    /// - <b>Aliases</b>: vs<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -EditCmdlet &lt;SwitchParameter&gt;<br/>
    /// Also opens the file in the editor after finding the cmdlet.<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example 1: Opens first matching cmdlet starting with "Get-" in Visual Studio Code</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// Search-GenXdevCmdlet -CmdletName "Get-*" -Code
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Example 2: Searches for Set-GitConfig cmdlet and opens it for editing</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// searchcmdlet "Set-GitConfig" -EditCmdlet
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Search, "GenXdevCmdlet")]
    [Alias("searchcmdlet")]
    [OutputType(typeof(void))]
    public class SearchGenXdevCmdletCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Search pattern to filter cmdlets
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            ValueFromRemainingArguments = false,
            HelpMessage = "Search pattern to filter cmdlets")]
        [Alias("Filter", "CmdLet", "Cmd", "FunctionName", "Name")]
        [SupportsWildcards()]
        public string CmdletName { get; set; }

        /// <summary>
        /// GenXdev module names to search
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            Position = 1,
            HelpMessage = "GenXdev module names to search")]
        [ValidateNotNullOrEmpty()]
        [Alias("Module", "BaseModuleName", "SubModuleName")]
        [ValidatePattern(@"^(GenXdev|GenXde[v]\*|GenXdev(\.[\w*\[\]\?]*)+)+$")]
        [SupportsWildcards()]
        public string[] ModuleName { get; set; }

        /// <summary>
        /// Skip searching in local module paths
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Skip searching in local module paths")]
        public SwitchParameter NoLocal { get; set; }

        /// <summary>
        /// Limit search to published module paths only
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Limit search to published module paths only")]
        public SwitchParameter OnlyPublished { get; set; }

        /// <summary>
        /// Search in script files instead of module files
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Search in script files instead of module files")]
        public SwitchParameter FromScripts { get; set; }

        /// <summary>
        /// Open the found cmdlet in Visual Studio Code
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Open the found cmdlet in Visual Studio Code")]
        [Alias("c")]
        public SwitchParameter Code { get; set; }

        /// <summary>
        /// Open the found cmdlet in Visual Studio
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Open the found cmdlet in Visual Studio")]
        [Alias("vs")]
        public SwitchParameter VisualStudio { get; set; }

        /// <summary>
        /// Also opens the file in the editor after finding
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Also opens the file in the editor after finding")]
        public SwitchParameter EditCmdlet { get; set; }

        private PSObject cmdletInfo;
        private string previousClipboard;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Retrieve and validate the target cmdlet exists
            var invocationParams = CopyIdenticalParamValues("GenXdev.Helpers\\Get-GenXDevCmdlet");
            invocationParams["ExactMatch"] = true;

            var getCmdletScript = ScriptBlock.Create("param($params) GenXdev.Helpers\\Get-GenXDevCmdlet @params | Microsoft.PowerShell.Utility\\Select-Object -First 1");
            var result = getCmdletScript.Invoke(invocationParams);
            cmdletInfo = (PSObject)result[0];

            if (cmdletInfo == null)
            {
                ThrowTerminatingError(new ErrorRecord(
                    new Exception($"Could not find GenXdev cmdlet {CmdletName}"),
                    "CmdletNotFound",
                    ErrorCategory.ObjectNotFound,
                    CmdletName));
            }

            // Initialize core variables for processing
            CmdletName = (string)cmdletInfo.Properties["Name"].Value;

            var getClipboardScript = ScriptBlock.Create("Microsoft.PowerShell.Management\\Get-Clipboard");
            var clipResult = getClipboardScript.Invoke();
            previousClipboard = clipResult[0]?.ToString();

            var setClipboardScript = ScriptBlock.Create("param($value) Microsoft.PowerShell.Management\\Set-Clipboard -Value $value");
            setClipboardScript.Invoke(CmdletName);

            WriteVerbose($"Processing cmdlet: {CmdletName}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Open cmdlet in ide and insert prompt with keyboard shortcuts
            var invocationParams = CopyIdenticalParamValues("GenXdev.Coding\\Open-SourceFileInIde");
            invocationParams["KeysToSend"] = new object[] { "^+f", "^a", "{DELETE}", "^v", "{ENTER}", "^{ENTER}", "^``" };
            invocationParams["Path"] = cmdletInfo.Properties["ScriptFilePath"].Value;
            invocationParams["LineNo"] = cmdletInfo.Properties["LineNo"].Value;

            var openScript = ScriptBlock.Create("param($params) GenXdev.Coding\\Open-SourceFileInIde @params");
            foreach (var line in openScript.Invoke(invocationParams))
            {
                Console.WriteLine(line.ToString().Trim());
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // Wait for ide operations to complete
            Thread.Sleep(3000);

            // Restore original clipboard content
            var setClipboardScript = ScriptBlock.Create("param($value) Microsoft.PowerShell.Management\\Set-Clipboard -Value $value");
            setClipboardScript.Invoke(previousClipboard);

            if (EditCmdlet.ToBool())
            {
                // Copy parameters for editing cmdlet function
                var invocationParams = CopyIdenticalParamValues("GenXdev.Coding\\Show-GenXdevCmdLetInIde");

                var showScript = ScriptBlock.Create("param($params) GenXdev.Coding\\Show-GenXdevCmdLetInIde @params");
                foreach (var line in showScript.Invoke(invocationParams))
                {
                    Console.WriteLine(line.ToString().Trim());
                }
            }
        }
    }
}