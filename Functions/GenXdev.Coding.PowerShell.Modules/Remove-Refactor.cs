// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Remove-Refactor.cs
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



using System.Collections;
using System.Management.Automation;

namespace GenXdev.Coding.PowerShell.Modules
{
    /// <summary>
    /// <para type="synopsis">
    /// Removes refactor sets from GenXdev preferences system.
    /// </para>
    ///
    /// <para type="description">
    /// Manages refactor sets in the GenXdev preferences system by removing specified
    /// entries. Works with both custom and default refactor sets. Default sets are
    /// protected unless explicitly allowed for removal. All refactor sets are
    /// identified by the prefix "refactor_set_" in the preferences system.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Name &lt;string[]&gt;<br/>
    /// One or more name patterns used to match refactor sets for removal. Supports
    /// wildcard patterns like "*" and "?" for flexible matching. Multiple patterns can
    /// be provided to target specific sets.<br/>
    /// - <b>Aliases</b>: PreferenceName<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -RemoveDefault &lt;SwitchParameter&gt;<br/>
    /// Switch parameter that, when enabled, allows the removal of protected default or
    /// standard refactor sets. By default, these sets are protected from deletion.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>ParameterSetName</b>: All<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -PreferencesDatabasePath &lt;string&gt;<br/>
    /// Database path for preference data files<br/>
    /// - <b>Aliases</b>: DatabasePath<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -DefaultValue &lt;string&gt;<br/>
    /// The default value if preference is not found<br/>
    /// - <b>Aliases</b>: DefaultPreference<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SessionOnly &lt;SwitchParameter&gt;<br/>
    /// Use alternative settings stored in session for Data preferences like Language, Database paths, etc<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -ClearSession &lt;SwitchParameter&gt;<br/>
    /// Clear the session setting (Global variable) before retrieving<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -SkipSession &lt;SwitchParameter&gt;<br/>
    /// Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc<br/>
    /// - <b>Aliases</b>: FromPreferences<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Removes a specific refactor set named "CustomRefactor" and allows removal of default sets if matched</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// Remove-Refactor -Name "CustomRefactor" -RemoveDefault
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Remove, "Refactor", SupportsShouldProcess = true)]
    [OutputType(typeof(void))]
    public partial class RemoveRefactorCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// One or more name patterns used to match refactor sets for removal. Supports
        /// wildcard patterns like "*" and "?" for flexible matching. Multiple patterns can
        /// be provided to target specific sets.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            HelpMessage = "The name of the refactor, accepts wildcards",
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        [Alias("PreferenceName")]
        public string[] Name { get; set; }

        /// <summary>
        /// Switch parameter that, when enabled, allows the removal of protected default or
        /// standard refactor sets. By default, these sets are protected from deletion.
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 1,
            ParameterSetName = "All",
            HelpMessage = "Switch to also remove the standard refactor set")]
        public SwitchParameter RemoveDefault { get; set; }

        /// <summary>
        /// Database path for preference data files
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Database path for preference data files")]
        [Alias("DatabasePath")]
        public string PreferencesDatabasePath { get; set; }

        /// <summary>
        /// The default value if preference is not found
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The default value if preference is not found")]
        [AllowNull()]
        [AllowEmptyString()]
        [Alias("DefaultPreference")]
        public string DefaultValue { get; set; }

        /// <summary>
        /// Use alternative settings stored in session for Data preferences like Language, Database paths, etc
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Use alternative settings stored in session for Data preferences like Language, Database paths, etc")]
        public SwitchParameter SessionOnly { get; set; }

        /// <summary>
        /// Clear the session setting (Global variable) before retrieving
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Clear the session setting (Global variable) before retrieving")]
        public SwitchParameter ClearSession { get; set; }

        /// <summary>
        /// Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc")]
        [Alias("FromPreferences")]
        public SwitchParameter SkipSession { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // log operation start and search patterns for troubleshooting
            WriteVerbose("Starting refactor removal process");
            WriteVerbose($"Search patterns to process: {string.Join(", ", Name)}");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // copy identical parameters for GenXdev.Data\Get-GenXdevPreferenceNames
            var paramsGetNames = CopyIdenticalParamValues("GenXdev.Data\\Get-GenXdevPreferenceNames");

            // retrieve all preference names matching the refactor_set pattern
            var scriptGetNames = ScriptBlock.Create("param($params) GenXdev.Data\\Get-GenXdevPreferenceNames @params | Where-Object { $_ -like 'refactor_set_*' }");
            var preferenceNames = scriptGetNames.Invoke(paramsGetNames);

            foreach (var preferenceNameObj in preferenceNames)
            {
                // store current preference name for processing
                string preferenceName = preferenceNameObj?.ToString();
                WriteVerbose($"Processing preference: {preferenceName}");

                // extract refactor name by removing the standard prefix
                string refactorName = preferenceName.Substring("refactor_set_".Length);

                // process each provided name pattern against current refactor
                foreach (string namePattern in Name)
                {
                    // skip if pattern doesn't match current refactor name
                    var scriptMatch = ScriptBlock.Create("param($refactorName, $pattern) $refactorName -like $pattern");
                    var matchResult = scriptMatch.Invoke(refactorName, namePattern);
                    bool isMatch = (matchResult.Count > 0 && ((PSObject)matchResult[0]).BaseObject is bool b && b);
                    if (!isMatch)
                    {
                        continue;
                    }

                    // copy identical parameters for Get-GenXdevPreference
                    var getParams = CopyIdenticalParamValues("GenXdev.Data\\Get-GenXdevPreference");

                    // retrieve current preference value
                    var scriptGetPref = ScriptBlock.Create("param($params, $name) try { GenXdev.Data\\Get-GenXdevPreference @params -Name $name -ErrorAction SilentlyContinue } catch { $null }");
                    var preferenceValueResult = scriptGetPref.Invoke(getParams, preferenceName);
                    string preferenceValue = preferenceValueResult.Count > 0 ? preferenceValueResult[0]?.ToString() : null;

                    // only process if preference exists and has a value
                    if (!string.IsNullOrWhiteSpace(preferenceValue))
                    {
                        // confirm removal with user before proceeding
                        if (ShouldProcess($"Refactor set: {refactorName}", "Remove"))
                        {
                            WriteVerbose($"Removing refactor set: {refactorName}");

                            // copy identical parameters for Remove-GenXdevPreference
                            var removeParams = CopyIdenticalParamValues("GenXdev.Data\\Remove-GenXdevPreference");
                            removeParams["RemoveDefault"] = RemoveDefault.ToBool();

                            // remove preference from system
                            var scriptRemove = ScriptBlock.Create("param($params, $name) GenXdev.Data\\Remove-GenXdevPreference @params -Name $name");
                            scriptRemove.Invoke(removeParams, preferenceName);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            WriteVerbose("Refactor removal process completed");
        }
    }
}