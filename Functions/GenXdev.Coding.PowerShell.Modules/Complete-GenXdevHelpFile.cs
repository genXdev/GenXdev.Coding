// ################################################################################
// Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
// Original cmdlet filename  : Complete-GenXdevHelpFile.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.302.2025
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
using System.Management.Automation.Runspaces;
using System.Text;
using System.Linq;

[Cmdlet("Complete", "GenXdevHelpFile")]
public class CompleteGenXdevHelpFileCommand : PSGenXdevCmdlet
{
    [Parameter(
        Mandatory = false,
        Position = 0,
        HelpMessage = "Names of modules to analyze"
    )]
    [Alias("Name", "Module")]
    public string[] ModuleName = new string[0];

    private string EscapeXml(string text)
    {
        if (string.IsNullOrEmpty(text)) return "";
        return text.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;").Replace("\"", "&quot;").Replace("'", "&apos;");
    }

    private PSObject[] GetAsArray(PSPropertyInfo prop)
    {
        if (prop?.Value is PSObject[] arr) return arr;
        if (prop?.Value is PSObject obj) return new[] { obj };
        return new PSObject[0];
    }

    protected override void BeginProcessing()
    {
        this.WriteVerbose("Starting Complete-GenXdevHelpFile cmdlet processing.");
        if (ModuleName.Length > 0)
        {
            this.WriteVerbose($"Filtering modules to: {string.Join(", ", ModuleName)}");
        }
        else
        {
            this.WriteVerbose("Processing all available GenXdev modules.");
        }
    }

    protected override void ProcessRecord()
    {
    }
    /*
     *
        * # return module information hashtable
        @{

            ModulePath     = $currentModule.FullName
            ModuleName     = $currentModuleName
            ConfigPath     = $configPath
            ConfigText     = $configText
            Config         = $config
            CurrentVersion = $currentVersion
            NewVersion     = $newVersion
            HasREADME      = [IO.File]::Exists(
                "$($currentModule.FullName)\README.md"
            )
            HasLICENSE     = [IO.File]::Exists(
                "$($currentModule.FullName)\LICENSE"
            )
        }

        GenXdev.Helpers\Get-GenXDevCmdlet -CmdletName 'GenXdev.Helpers\Get-GenXDevCmdlet' -->
        {
        "Name": "Get-GenXDevCmdlet",
        "ModuleName": "GenXdev.Helpers",
        "BaseModule": "GenXdev.Helpers",
        "LineNo": 0,
        "Description": "Retrieves and lists all GenXdev cmdlets and their details.",
        "Aliases": "gcmds",
        "ScriptFilePath": "C:\\Users\\renev\\Documents\\PowerShell\\Modules\\GenXdev.Helpers\\1.302.2025\\Functions\\GenXdev.Helpers\\Get-GenXDevCmdlet.ps1",
        "ScriptTestFilePath": "C:\\Users\\renev\\Documents\\PowerShell\\Modules\\GenXdev.Helpers\\1.302.2025\\Tests\\GenXdev.Helpers\\Get-GenXDevCmdlet.Tests.ps1"
        }



PS> $a = get-help "GenXdev.FileSystem\Find-Item" -Parameter Name
[C:\Users\genXdev\Documents\PowerShell]
PS> $a | select *

description    : {@{Text=File name or pattern to search for. Default is '*'}}
name           : Name
parameterValue : String[]
type           : @{name=String[]; uri=}
defaultValue   : None
required       : false
variableLength : true
globbing       : true
pipelineInput  : False
position       : 0
aliases        : like, Path, LiteralPath, Query, SearchMask, Include


     */
    protected override void EndProcessing()
    {
        this.WriteVerbose("Retrieving GenXdev module information.");
        var moduleInfos = InvokeCmdletList<Hashtable>("GenXdev.Coding\\Get-GenXdevModuleinfo");
        this.WriteVerbose($"Found {moduleInfos.Count} modules total.");

        // Filter modules if ModuleName is specified
        if (ModuleName.Length > 0)
        {
            moduleInfos = moduleInfos.Where(m => ModuleName.Contains(m["ModuleName"] as string)).ToList();
            this.WriteVerbose($"After filtering, processing {moduleInfos.Count} modules.");
        }

        this.WriteVerbose("Retrieving all GenXdev cmdlets.");
        InvokeScript<object>("Import-Module GenXdev.Helpers -Force -ErrorAction SilentlyContinue");
        var allCmdlets = InvokeCmdletList<GenXdev.Helpers.GenXdevCmdletInfo>("GenXdev.Helpers\\Get-GenXDevCmdlet");
        this.WriteVerbose($"Retrieved {allCmdlets.Count} total cmdlets from all modules.");
        this.WriteVerbose($"Unique BaseModules: {string.Join(", ", allCmdlets.Select(c => c.BaseModule).Distinct())}");

        foreach (var moduleInfo in moduleInfos)
        {
            string moduleName = moduleInfo["ModuleName"] as string;
            this.WriteVerbose($"Processing module: {moduleName}");
            string xmlHelpPath = Path.Combine(
                GetGenXdevModuleBase(moduleName),
                $"{moduleName}-Help.xml"
            );
            this.WriteVerbose($"Help file path: {xmlHelpPath}");

            // Get all cmdlets and filter by module
            var moduleCmdlets = allCmdlets.Where(c => (string)c.BaseModule == moduleName).ToList();
            this.WriteVerbose($"Filtering cmdlets where BaseModule == '{moduleName}'");
            this.WriteVerbose($"Found {moduleCmdlets.Count} cmdlets in module {moduleName}.");

            StringBuilder xml = new StringBuilder();
            xml.AppendLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
            xml.AppendLine("<helpItems schema=\"maml\" xmlns=\"http://msh\">");
            this.WriteVerbose($"Starting XML generation for {moduleCmdlets.Count} cmdlets.");

            foreach (var cmdlet in moduleCmdlets)
            {
                string cmdletName = $"{cmdlet.BaseModule}\\{cmdlet.Name}";
                this.WriteVerbose($"Processing cmdlet: {cmdletName}");

                // Get command info for all metadata
                var command = GetCachedCommandInfo(cmdletName);
                if (command == null)
                {
                    this.WriteVerbose($"No command info found for cmdlet: {cmdletName}, skipping.");
                    continue;
                }
                this.WriteVerbose($"Retrieved command info for cmdlet: {cmdletName}.");

                xml.AppendLine("  <command:command xmlns:maml=\"http://schemas.microsoft.com/maml/2004/10\" xmlns:command=\"http://schemas.microsoft.com/maml/dev/command/2004/10\" xmlns:dev=\"http://schemas.microsoft.com/maml/dev/2004/10\" xmlns:MSHelp=\"http://msdn.microsoft.com/mshelp\">");

                // Parse verb and noun from command name
                string verb = "";
                string noun = "";
                string fullCmdletName = command.Name;
                string cmdletPart = fullCmdletName.Split('\\').Last();
                var parts = cmdletPart.Split('-');
                if (parts.Length >= 2)
                {
                    verb = parts[0];
                    noun = string.Join("-", parts.Skip(1));
                }
                else
                {
                    verb = cmdletPart;
                    noun = "";
                }

                xml.AppendLine("    <command:details>");
                xml.AppendLine($"      <maml:name>{verb}-{noun}</maml:name>");
                xml.AppendLine($"      <command:verb>{verb}</command:verb>");
                xml.AppendLine($"      <command:noun>{noun}</command:noun>");
                xml.AppendLine("    </command:details>");

                // Description from cmdlet
                if (!string.IsNullOrEmpty(cmdlet.Description))
                {
                    xml.AppendLine("    <maml:description>");
                    xml.AppendLine($"      <maml:para>{EscapeXml(cmdlet.Description)}</maml:para>");
                    xml.AppendLine("    </maml:description>");
                }

                // Parameters - use command parameters with descriptions from parameter attributes
                if (command.Parameters != null && command.Parameters.Count > 0)
                {
                    xml.AppendLine("    <command:parameters>");
                    foreach (var param in command.Parameters.Values)
                    {
                        string pname = param.Name ?? "";
                        if (string.IsNullOrEmpty(pname)) continue; // Skip parameters with empty names
                        string ptype = param.ParameterType?.Name ?? "";
                                                
                        bool required = param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.Mandatory ?? false;
                        
                        bool globbing = param.Attributes.OfType<System.Management.Automation.SupportsWildcardsAttribute>().Any();
                        bool pipelineInput = param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.ValueFromPipeline ?? param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.ValueFromPipelineByPropertyName ?? false;
                        string position = param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.Position.ToString() ?? "";
                        string aliasStr = param.Aliases != null ? string.Join(", ", param.Aliases) : "";

                        // Get description from parameter attributes
                        string paramDescription = param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.HelpMessage ?? "";

                        xml.AppendLine("      <command:parameter>");
                        xml.AppendLine($"        <maml:name>{pname}</maml:name>");
                        // Description from parameter attribute
                        if (!string.IsNullOrEmpty(paramDescription))
                        {
                            xml.AppendLine("        <maml:description>");
                            xml.AppendLine($"          <maml:para>{EscapeXml(paramDescription)}</maml:para>");
                            xml.AppendLine("        </maml:description>");
                        }
                        xml.AppendLine($"        <command:parameterValue required=\"{required.ToString().ToLower()}\">{ptype}</command:parameterValue>");
                        xml.AppendLine($"        <dev:globbing>{globbing.ToString().ToLower()}</dev:globbing>");
                        xml.AppendLine($"        <dev:pipelineInput>{pipelineInput}</dev:pipelineInput>");
                        xml.AppendLine($"        <dev:position>{position}</dev:position>");
                        xml.AppendLine($"        <dev:aliases>{EscapeXml(aliasStr)}</dev:aliases>");
                        xml.AppendLine("      </command:parameter>");
                    }
                    xml.AppendLine("    </command:parameters>");
                }
                this.WriteVerbose($"Processed parameters for cmdlet: {cmdletName}.");

                // Input Types - from command parameters that accept pipeline input
                if (command.Parameters != null && command.Parameters.Count > 0)
                {
                    var inputParams = command.Parameters.Values.Where(param => param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.ValueFromPipeline ?? param.Attributes?.OfType<System.Management.Automation.ParameterAttribute>().FirstOrDefault()?.ValueFromPipelineByPropertyName ?? false).ToList();

                    if (inputParams.Count > 0)
                    {
                        xml.AppendLine("    <command:inputTypes>");
                        foreach (var param in inputParams)
                        {
                            string tname = param.ParameterType?.Name ?? "";
                            xml.AppendLine("      <command:inputType>");
                            xml.AppendLine("        <dev:type>");
                            xml.AppendLine($"          <maml:name>{tname}</maml:name>");
                            xml.AppendLine("        </dev:type>");
                            xml.AppendLine("      </command:inputType>");
                        }
                        xml.AppendLine("    </command:inputTypes>");
                    }
                }

                // Return Values - from command output types
                if (command.OutputType != null && command.OutputType.Count > 0)
                {
                    xml.AppendLine("    <command:returnValues>");
                    foreach (var outputType in command.OutputType)
                    {
                        string tname = outputType.Name ?? "";
                        xml.AppendLine("      <command:returnValue>");
                        xml.AppendLine("        <dev:type>");
                        xml.AppendLine($"          <maml:name>{tname}</maml:name>");
                        xml.AppendLine("        </dev:type>");
                        xml.AppendLine("      </command:returnValue>");
                    }
                    xml.AppendLine("    </command:returnValues>");
                }

                // Related Links
                xml.AppendLine("    <command:relatedLinks />");

                xml.AppendLine("  </command:command>");
                this.WriteVerbose($"Completed XML generation for cmdlet: {cmdletName}.");
            }

            xml.AppendLine("</helpItems>");
            this.WriteVerbose($"XML generation completed for module {moduleName}, total length: {xml.Length} characters.");

            // Save the XML file
            System.IO.File.WriteAllText(xmlHelpPath, xml.ToString(), new UTF8Encoding());
            this.WriteVerbose($"Help file saved to: {xmlHelpPath}");
        }
        this.WriteVerbose("Complete-GenXdevHelpFile cmdlet processing completed.");
    }
}