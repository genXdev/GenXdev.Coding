// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Get-GenXDevModule.cs
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



using System.IO;
using System.Linq;
using System.Management.Automation;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves all GenXDev modules from a specified path.
    /// </para>
    ///
    /// <para type="description">
    /// This cmdlet searches through a directory structure for GenXdev modules,
    /// excluding any with '.local' in the name. For each valid module found, it returns
    /// the most recent version folder (1.x) that contains a valid module manifest
    /// (.psd1) file.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Path &lt;String&gt;<br/>
    /// The root directory to search for GenXdev modules. If not specified, defaults to
    /// the parent directory of the script's location.<br/>
    /// - <b>Aliases</b>: RootPath, FullPath<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: ModuleBase\..\..<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get-GenXDevModule -Path "C:\PowerShell\Modules"</para>
    /// <para>Retrieves all GenXdev modules from the specified path.</para>
    /// <code>
    /// Get-GenXDevModule -Path "C:\PowerShell\Modules"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get-GenXDevModule "C:\PowerShell\Modules"</para>
    /// <para>Retrieves all GenXdev modules from the specified path using positional parameter.</para>
    /// <code>
    /// Get-GenXDevModule "C:\PowerShell\Modules"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "GenXDevModule")]
    [OutputType(typeof(DirectoryInfo))]
    public class GetGenXDevModuleCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The root directory to search for GenXdev modules
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "The root path to search for GenXdev modules")]
        [Alias("RootPath", "FullPath")]
        public string Path { get; set; }

        /// <summary>
        /// Begin processing - set default path if not provided
        /// </summary>
        protected override void BeginProcessing()
        {
            // Set default path if not provided - navigate up 2 levels from ModuleBase
            if (string.IsNullOrEmpty(Path))
            {
                Path = System.IO.Path.GetFullPath(System.IO.Path.Combine(MyInvocation.MyCommand.Module.ModuleBase, "..", ".."));
            }

            // Log the path being searched
            WriteVerbose($"Searching for GenXdev modules in: {Path}");
        }

        /// <summary>
        /// Process record - enumerate and filter GenXdev modules
        /// </summary>
        protected override void ProcessRecord()
        {
            // Enumerate all directories starting with 'GenXdev'
            foreach (var moduleDir in Directory.EnumerateDirectories(Path, "GenXdev*"))
            {
                // Create DirectoryInfo for the module directory
                var moduleDirectoryInfo = new DirectoryInfo(moduleDir);
                var moduleName = moduleDirectoryInfo.Name;

                // Skip modules containing '.local' in their name
                if (moduleName.ToLowerInvariant().Contains(".local"))
                {
                    WriteVerbose($"Skipping local module: {moduleName}");
                    continue;
                }

                // Find the highest numbered 1.x version directory
                var versionDirs = Directory.EnumerateDirectories(moduleDir, "1.*")
                    .Select(d => new DirectoryInfo(d))
                    .OrderByDescending(d => d.Name)
                    .FirstOrDefault();

                if (versionDirs != null)
                {
                    // Verify existence of module manifest
                    var manifestPath = System.IO.Path.Combine(versionDirs.FullName, $"{moduleName}.psd1");
                    if (File.Exists(manifestPath))
                    {
                        WriteVerbose($"Found valid module: {moduleName} in {versionDirs.FullName}");
                        WriteObject(versionDirs);
                    }
                }
            }
        }

        /// <summary>
        /// End processing - no cleanup needed
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}