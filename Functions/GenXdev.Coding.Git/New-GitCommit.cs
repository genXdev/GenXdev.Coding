// ################################################################################
// Part of PowerShell module : GenXdev.Coding.Git
// Original cmdlet filename  : New-GitCommit.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.308.2025
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

namespace GenXdev.Coding.Git
{
    /// <summary>
    /// <para type="synopsis">
    /// Creates and pushes a new git commit with all changes.
    /// </para>
    ///
    /// <para type="description">
    /// Stages all changes in the current git repository, creates a commit with the
    /// specified title, and pushes the changes to the remote origin. Automatically sets
    /// up upstream tracking if needed.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Title &lt;String&gt;<br/>
    /// The message to use for the git commit. If not specified, defaults to
    /// "Improved scripts".<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: "Improved scripts"<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Create a commit with a custom message</para>
    /// <para>This example creates a commit with the message "Added new authentication feature".</para>
    /// <code>
    /// New-GitCommit -Title "Added new authentication feature"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Create a commit using the alias</para>
    /// <para>This example uses the 'commit' alias to create a commit with default message.</para>
    /// <code>
    /// commit "Hotfix for login issue"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.New, "GitCommit")]
    [Alias("commit")]
    [OutputType(typeof(void))]
    public class NewGitCommitCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The commit message title to use
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            ValueFromRemainingArguments = false,
            HelpMessage = "The commit message title to use")]
        public string Title { get; set; } = "Improved scripts";

        private string branch;

        /// <summary>
        /// Initialize the cmdlet and extract the current branch name
        /// </summary>
        protected override void BeginProcessing()
        {
            // Extract the current branch name from git's symbolic reference
            var branchResult = InvokeCommand.InvokeScript("git symbolic-ref refs/remotes/origin/HEAD");

            if (branchResult.Count > 0 && branchResult[0].BaseObject != null)
            {
                string branchRef = branchResult[0].BaseObject.ToString();
                branch = branchRef.Split('/')[3];
                WriteVerbose($"Operating on git branch: {branch}");
                Console.WriteLine($"Current branch: {branch}");
            }
            else
            {
                WriteError(new ErrorRecord(new Exception("Failed to get branch information"), "BranchDetectionFailed", ErrorCategory.OperationStopped, null));
                return;
            }
        }

        /// <summary>
        /// Process the commit operation
        /// </summary>
        protected override void ProcessRecord()
        {
            if (string.IsNullOrEmpty(branch))
            {
                WriteError(new ErrorRecord(
                    new InvalidOperationException("Branch information is not available."),
                    "BranchNotSet",
                    ErrorCategory.InvalidOperation,
                    null));
                return;
            }

            // Add all changed files to git staging area
            WriteVerbose("Staging all modified files...");
            if (ShouldProcess("all changes", "git add"))
            {
                var addScript = ScriptBlock.Create("$gitOutput = git add * 2>&1; $gitOutput; $LASTEXITCODE");
                var addResult = addScript.Invoke();
                int exitCode = 0;
                for (int i = 0; i < addResult.Count; i++)
                {
                    if (i == addResult.Count - 1 && addResult[i].BaseObject is int ec)
                    {
                        exitCode = ec;
                    }
                    else if (addResult[i].BaseObject != null && addResult[i].BaseObject is string output)
                    {
                        Console.WriteLine(output);
                    }
                }
                if (exitCode != 0)
                {
                    WriteError(new ErrorRecord(new Exception("Failed to stage changes"), "GitAddFailed", ErrorCategory.OperationStopped, null));
                    return;
                }
            }

            // Create a new commit with the specified title
            WriteVerbose($"Creating commit with message: {Title}");
            if (ShouldProcess($"commit with title: {Title}", "git commit"))
            {
                var commitScript = ScriptBlock.Create("param($title) $gitOutput = git commit -m $title 2>&1; $gitOutput; $LASTEXITCODE");
                var commitResult = commitScript.Invoke(Title);
                int exitCode = 0;
                for (int i = 0; i < commitResult.Count; i++)
                {
                    if (i == commitResult.Count - 1 && commitResult[i].BaseObject is int ec)
                    {
                        exitCode = ec;
                    }
                    else if (commitResult[i].BaseObject != null && commitResult[i].BaseObject is string output)
                    {
                        Console.WriteLine(output);
                    }
                }
                if (exitCode != 0)
                {
                    WriteError(new ErrorRecord(new Exception("Failed to create commit"), "GitCommitFailed", ErrorCategory.OperationStopped, null));
                    return;
                }
            }

            // Ensure branch is tracking upstream remote
            WriteVerbose($"Configuring upstream tracking to origin/{branch}");
            if (ShouldProcess($"upstream branch to origin/{branch}", "git push -u"))
            {
                var upstreamScript = ScriptBlock.Create("param($branch) $gitOutput = git push -u origin $branch 2>&1; $gitOutput; $LASTEXITCODE");
                var upstreamResult = upstreamScript.Invoke(branch);
                int exitCode = 0;
                for (int i = 0; i < upstreamResult.Count; i++)
                {
                    if (i == upstreamResult.Count - 1 && upstreamResult[i].BaseObject is int ec)
                    {
                        exitCode = ec;
                    }
                    else if (upstreamResult[i].BaseObject != null && upstreamResult[i].BaseObject is string output)
                    {
                        Console.WriteLine(output);
                    }
                }
                if (exitCode != 0)
                {
                    WriteError(new ErrorRecord(new Exception("Failed to set upstream branch"), "GitUpstreamFailed", ErrorCategory.OperationStopped, null));
                    return;
                }
            }

            // Push committed changes to remote repository
            WriteVerbose("Pushing changes to remote repository...");
            if (ShouldProcess("changes to remote", "git push"))
            {
                var pushScript = ScriptBlock.Create("$gitOutput = git push 2>&1; $gitOutput; $LASTEXITCODE");
                var pushResult = pushScript.Invoke();
                int exitCode = 0;
                for (int i = 0; i < pushResult.Count; i++)
                {
                    if (i == pushResult.Count - 1 && pushResult[i].BaseObject is int ec)
                    {
                        exitCode = ec;
                    }
                    else if (pushResult[i].BaseObject != null && pushResult[i].BaseObject is string output)
                    {
                        Console.WriteLine(output);
                    }
                }
                if (exitCode != 0)
                {
                    WriteError(new ErrorRecord(new Exception("Failed to push changes"), "GitPushFailed", ErrorCategory.OperationStopped, null));
                    return;
                }
            }
        }

        /// <summary>
        /// Clean up after processing
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}