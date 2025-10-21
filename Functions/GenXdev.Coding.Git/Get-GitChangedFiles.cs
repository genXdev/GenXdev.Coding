// ################################################################################
// Part of PowerShell module : GenXdev.Coding.Git
// Original cmdlet filename  : Get-GitChangedFiles.cs
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
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;

namespace GenXdev.Coding.Git
{
    /// <summary>
    /// <para type="synopsis">
    /// Get the list of changed files in a Git repository.
    /// </para>
    ///
    /// <para type="description">
    /// This function retrieves the list of files that have been changed in the current Git repository.
    /// It can be used to identify which files have been modified, added, or deleted.
    /// By default, returns relative paths with .\ prefix. Use -PassThru to get FileInfo objects.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -PassThru &lt;SwitchParameter&gt;<br/>
    /// Returns FileInfo objects (like Get-ChildItem) instead of path strings.<br/>
    /// - <b>Aliases</b>: None<br/>
    /// - <b>Position</b>: Named<br/>
    /// - <b>Default</b>: False<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get changed files as relative paths</para>
    /// <para>Returns relative paths like ".\Modules\GenXdev.AI\1.304.2025\README.md"</para>
    /// <code>
    /// Get-GitChangedFiles
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get changed files as FileInfo objects</para>
    /// <para>Returns FileInfo objects for each changed file</para>
    /// <code>
    /// Get-GitChangedFiles -PassThru
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "GitChangedFiles")]
    [OutputType(typeof(string), typeof(PSObject))]
    [Alias("gitchanged")]
    public class GetGitChangedFilesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Returns FileInfo objects (like Get-ChildItem) instead of path strings.
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Returns FileInfo objects (like Get-ChildItem) instead of path strings.")]
        public SwitchParameter PassThru { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Ensure the current directory is a Git repository
            var isGitRepoResult = InvokeCommand.InvokeScript("git rev-parse --is-inside-work-tree");

            if (isGitRepoResult == null || !isGitRepoResult.Any() || !"true".Equals(isGitRepoResult.First().ToString().Trim(), StringComparison.OrdinalIgnoreCase))
            {
                WriteError(new ErrorRecord(
                    new InvalidOperationException("This command must be run inside a Git repository."),
                    "NotInGitRepository",
                    ErrorCategory.InvalidOperation,
                    null));
                return;
            }

            // Get the list of changed files
            var changedFilesResult = InvokeCommand.InvokeScript("git diff --name-only HEAD");

            if (changedFilesResult == null || !changedFilesResult.Any())
            {
                WriteObject("No changed files found.");
                return;
            }

            var changedFiles = changedFilesResult
                .Select(obj => obj.ToString().Trim())
                .Where(file => !string.IsNullOrEmpty(file))
                .ToList();

            foreach (var file in changedFiles)
            {
                if (PassThru)
                {
                    // Return FileInfo object like Get-ChildItem would
                    var fileExistsResult = InvokeCommand.InvokeScript($"Test-Path -LiteralPath '{file}'");

                    if (fileExistsResult != null && fileExistsResult.Any() && "True".Equals(fileExistsResult.First().ToString(), StringComparison.OrdinalIgnoreCase))
                    {
                        var fileInfoResult = InvokeCommand.InvokeScript($"Get-Item -LiteralPath '{file}'");
                        if (fileInfoResult != null && fileInfoResult.Any())
                        {
                            WriteObject(fileInfoResult.First());
                        }
                    }
                    else
                    {
                        // For deleted files, we can't get FileInfo, so return a custom object
                        var customObject = new PSObject();
                        customObject.Properties.Add(new PSNoteProperty("Name", Path.GetFileName(file)));
                        customObject.Properties.Add(new PSNoteProperty("FullName", null));
                        customObject.Properties.Add(new PSNoteProperty("RelativePath", file));
                        customObject.Properties.Add(new PSNoteProperty("Exists", false));
                        WriteObject(customObject);
                    }
                }
                else
                {
                    // Return relative path with .\ prefix
                    var relativePath = ".\\" + file.Replace('/', '\\');
                    WriteObject(relativePath);
                }
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