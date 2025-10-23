// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Open-GenXdevCmdletsContainingClipboardTextInIde.cs
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
using System.Collections.Generic;
using System.Management.Automation;
using System.Text.RegularExpressions;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Opens files in IDE that contain clipboard text
    /// </para>
    ///
    /// <para type="description">
    /// The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -InputObject &lt;string&gt;<br/>
    /// Search for clipboard text in all GenXdev scripts<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Copilot &lt;SwitchParameter&gt;<br/>
    /// Add sourcefile to Copilot edit-session<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Open files containing clipboard text</para>
    /// <para>Searches for the current clipboard content in all GenXdev scripts and opens matching files in the IDE.</para>
    /// <code>
    /// Open-GenXdevCmdletsContainingClipboardTextInIde
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Open files containing specific text</para>
    /// <para>Searches for the specified text in all GenXdev scripts and opens matching files in the IDE.</para>
    /// <code>
    /// Open-GenXdevCmdletsContainingClipboardTextInIde -InputObject "search text"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Open files with Copilot integration</para>
    /// <para>Searches for clipboard text and opens files with Copilot edit session enabled.</para>
    /// <code>
    /// Open-GenXdevCmdletsContainingClipboardTextInIde -Copilot
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Open, "GenXdevCmdletsContainingClipboardTextInIde")]
    [Alias("vscodesearch")]
    [OutputType(typeof(void))]
    public class OpenGenXdevCmdletsContainingClipboardTextInIdeCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Search for clipboard text in all GenXdev scripts
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            ValueFromPipeline = true,
            HelpMessage = "Search for clipboard text in all GenXdev scripts"
        )]
        public string InputObject { get; set; }

        /// <summary>
        /// Add sourcefile to Copilot edit-session
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Add sourcefile to Copilot edit-session"
        )]
        public SwitchParameter Copilot { get; set; }

        private string clipboardText;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            var clipboardResult = InvokeCommand.InvokeScript("Microsoft.PowerShell.Management\\Get-Clipboard");

            clipboardText = clipboardResult.Count > 0 ? clipboardResult[0]?.ToString() : null;

            if (Copilot.ToBool())
            {
                InvokeCommand.InvokeScript("GenXdev.Coding\\EnsureCopilotKeyboardShortCut");
            }
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            string inputObject = InputObject;

            if (inputObject == null)
            {
                inputObject = clipboardText;
            }

            if (string.IsNullOrWhiteSpace(inputObject))
            {
                WriteError(new ErrorRecord(
                    new ArgumentException("No input object provided. Please provide a string to search for or set a clipboard text."),
                    "NoInput",
                    ErrorCategory.InvalidArgument,
                    null
                ));

                return;
            }

            string searchPattern = Regex.Escape(inputObject);

            // Use base class method to copy identical parameters
            var invocationArgs = CopyIdenticalParamValues("GenXdev.Coding\\Open-SourceFileInIde");
            invocationArgs["Code"] = true;

            if (Copilot.ToBool())
            {
                invocationArgs["KeysToSend"] = new object[] { "^+%{F12}" };
            }

            var script = @"
GenXdev.Helpers\Invoke-OnEachGenXdevModule {
    param($module)
    $filePaths = GenXdev.FileSystem\Find-Item -SearchMask '*.ps1' -Pattern $searchPattern -PassThru -Quiet | Microsoft.PowerShell.Core\ForEach-Object FullNames
    if ($filePaths) {
        $invocationArgs.Path = $filePaths
        GenXdev.Coding\Open-SourceFileInIde @invocationArgs
    }
}
";

            InvokeCommand.InvokeScript(script, new List<PSVariable> {
                new PSVariable("searchPattern", searchPattern),
                new PSVariable("invocationArgs", invocationArgs)
            });
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