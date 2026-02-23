// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Clear-GenXdevModules.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.3.2026
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

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Cleans build artifacts from GenXdev PowerShell modules.
    /// </para>
    ///
    /// <para type="description">
    /// Removes build directories and artifacts from all GenXdev PowerShell modules in
    /// the user's PowerShell Modules directory. Cleans both module root directories and
    /// version-specific subdirectories, removing bin, obj, trash and other build
    /// artifacts.
    /// </para>
    ///
    /// <example>
    /// <para>Cleans build artifacts with verbose output</para>
    /// <para>This example demonstrates how to clean all GenXdev module build artifacts with verbose output enabled.</para>
    /// <code>
    /// Clear-GenXdevModules -Verbose
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Clear, "GenXdevModules")]
    [Alias("cleangenxdev")]
    public class ClearGenXdevModulesCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting cleanup of GenXdev module build artifacts");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            WriteVerbose("Retrieving all GenXdev module directories");

            // Since ModuleBase is two directories higher than $PSScriptRoot, adjust accordingly
            var moduleBase = this.MyInvocation.MyCommand.Module.ModuleBase;
            var modulesPath = GetGenXdevModulesBase();

            // Get all genxdev* directories
            var genxdevDirs = Directory.GetDirectories(modulesPath, "genxdev*", SearchOption.TopDirectoryOnly);

            foreach (var dir in genxdevDirs)
            {
                WriteVerbose($"Processing module directory: {dir}");

                // Save current directory and change to the module directory
                var originalDir = Directory.GetCurrentDirectory();

                try
                {
                    Directory.SetCurrentDirectory(dir);

                    WriteVerbose("Cleaning root level build directories");

                    // Remove build artifacts from root level
                    RemoveDirectoryIfExists("bin");
                    RemoveDirectoryIfExists("obj");
                    RemoveDirectoryIfExists("trash");

                    // Remove older versions
                    var versionDirs = Directory.GetDirectories(".", "*.*.*", SearchOption.TopDirectoryOnly);

                    foreach (var versionDir in versionDirs)
                    {
                        var dirName = Path.GetFileName(versionDir);

                        if (dirName != "2.3.2026")
                        {
                            WriteVerbose($"Removing older version: {dirName}");
                            RemoveDirectoryIfExists(versionDir);
                        }
                    }

                    // Process the current version directory
                    var versionPath = Path.Combine(dir, "2.3.2026");

                    if (Directory.Exists(versionPath))
                    {
                        WriteVerbose("Processing version directory 2.3.2026");
                        Directory.SetCurrentDirectory(versionPath);

                        WriteVerbose("Cleaning version-specific build directories");

                        // Remove build artifacts from version-specific directory
                        RemoveDirectoryIfExists("bin");
                        RemoveDirectoryIfExists("obj");
                        RemoveDirectoryIfExists("net9.0-windows");
                    }
                }
                finally
                {
                    Directory.SetCurrentDirectory(originalDir);
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            WriteVerbose("Module cleanup completed successfully");
        }

        /// <summary>
        /// Removes a directory recursively if it exists
        /// </summary>
        /// <param name="path">The path to the directory to remove</param>
        private void RemoveDirectoryIfExists(string path)
        {
            if (Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }
        }
    }
}