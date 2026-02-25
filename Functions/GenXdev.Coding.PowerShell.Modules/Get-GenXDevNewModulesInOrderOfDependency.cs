// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Get-GenXDevNewModulesInOrderOfDependency.cs
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

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves GenXDev modules in dependency order.
    /// </para>
    ///
    /// <para type="description">
    /// This function returns a list of GenXDev modules arranged in the correct dependency
    /// order to ensure proper module loading. It first retrieves all module information
    /// and then orders them based on their dependencies, starting with core modules and
    /// ending with dependent modules. This ensures modules are loaded in the correct
    /// sequence.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -ModuleName &lt;string[]&gt;<br/>
    /// One or more module names to filter the results. If not provided, all modules are
    /// returned in their dependency order. The function will maintain the correct
    /// dependency chain even when filtering specific modules.<br/>
    /// - <b>Aliases</b>: Module, BaseModuleName, SubModuleName<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: GenXdev*<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get modules in dependency order for specific module</para>
    /// <para>This example retrieves modules in dependency order, filtering for the GenXdev.Helpers module.</para>
    /// <code>
    /// Get-GenXDevNewModulesInOrderOfDependency -ModuleName "GenXdev.Helpers"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get modules in dependency order using pipeline</para>
    /// <para>This example demonstrates using pipeline input to specify module names.</para>
    /// <code>
    /// "GenXdev.Console" | Get-GenXDevNewModulesInOrderOfDependency
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "GenXDevNewModulesInOrderOfDependency")]
    [OutputType(typeof(PSObject))]
    public class GetGenXDevNewModulesInOrderOfDependencyCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// One or more module names to filter by
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "One or more module names to filter by"
        )]
        [ValidateNotNullOrEmpty]
        [Alias("Module", "BaseModuleName", "SubModuleName")]
        [ValidatePattern(@"^(GenXdev|GenXde[v]\*|GenXdev(\.[\w*\[\]\?]*)+)+$")]
        [SupportsWildcards]
        public string[] ModuleName { get; set; } = new string[] { "GenXdev*" };

        private List<string> allModuleNames = new List<string>();
        private PSObject[] modules;

        /// <summary>
        /// Begin processing - retrieve all available genxdev module information
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Retrieving GenXDev module information...");
            var scriptBlock = ScriptBlock.Create("GenXdev.Coding\\Get-GenXDevModuleInfo");
            var results = InvokeCommand.InvokeScript(SessionState, scriptBlock);
            modules = results?.ToArray() ?? new PSObject[0];
        }

        /// <summary>
        /// Process record - collect module names from pipeline input
        /// </summary>
        protected override void ProcessRecord()
        {
            if (ModuleName != null)
            {
                allModuleNames.AddRange(ModuleName);
            }
        }

        /// <summary>
        /// End processing - filter and order modules, then output results
        /// </summary>
        protected override void EndProcessing()
        {
            // Create a hashset to remove duplicates while preserving order
            var uniqueModuleNames = new HashSet<string>(allModuleNames, StringComparer.OrdinalIgnoreCase);
            var results = new List<PSObject>();

            // Helper function to find a module by name if it matches the filter
            PSObject FindModule(string requested)
            {
                bool found = false;
                foreach (var m in uniqueModuleNames)
                {
                    if (WildcardPattern.ContainsWildcardCharacters(m))
                    {
                        var pattern = new WildcardPattern(m, WildcardOptions.IgnoreCase);
                        if (pattern.IsMatch(requested))
                        {
                            found = true;
                            break;
                        }
                    }
                    else if (requested.IndexOf(m, StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        found = true;
                        break;
                    }
                }
                if (!found)
                {
                    return null;
                }

                // Find module by ModuleName property
                foreach (var mod in modules)
                {
                    try
                    {
                        string moduleName = null;
                        // Try accessing as hashtable (BaseObject is Hashtable)
                        var hashtable = mod.BaseObject as System.Collections.Hashtable;
                        if (hashtable != null)
                        {
                            moduleName = hashtable["ModuleName"]?.ToString();
                        }
                        else
                        {
                            // Fall back to Properties collection
                            moduleName = mod.Properties["ModuleName"]?.Value?.ToString();
                        }

                        if (moduleName == requested)
                        {
                            return mod;
                        }
                    }
                    catch
                    {
                        // Continue to next module if property access fails
                        continue;
                    }
                }
                return null;
            }

            WriteVerbose("Adding modules in dependency order...");
            // Add modules in the exact dependency order as specified in the original function
            var moduleNamesToCheck = new[] { "GenXdev.FileSystem", "GenXdev.Helpers", "GenXdev.Data", "GenXdev.Windows", "GenXdev.Webbrowser", "GenXdev.Console", "GenXdev.Queries", "GenXdev.AI", "GenXdev.Coding", "GenXdev.Media", "GenXdev" };
            foreach (var moduleName in moduleNamesToCheck)
            {
                var moduleObj = FindModule(moduleName);
                if (moduleObj != null)
                {
                    results.Add(moduleObj);
                }
            }

            WriteVerbose($"Returning {results.Count} modules");
            foreach (var result in results)
            {
                WriteObject(result);
            }
        }
    }
}