#
# Module manifest for module 'GenXdev.Coding'
#
# Generated by: genXdev
#
# Generated on: 26/03/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'GenXdev.Coding.psm1'

# Version number of this module.
ModuleVersion = '1.156.2025'

# Supported PSEditions
CompatiblePSEditions = 'Core'

# ID used to uniquely identify this module
GUID = '2f62080f-0483-7721-8497-000000c0d149'

# Author of this module
Author = 'genXdev'

# Company or vendor of this module
CompanyName = 'GenXdev'

# Copyright statement for this module
Copyright = 'Copyright 2021-2025 GenXdev'

# Description of the functionality provided by this module
Description = 'A Windows PowerShell module that helps being more productive with coding tasks.'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.5.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
ClrVersion = '9.0.1'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'PSScriptAnalyzer'; ModuleVersion = '1.23.0'; }, 
               @{ModuleName = 'GenXdev.AI'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.Data'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.Helpers'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.Windows'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.Webbrowser'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.Queries'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.Console'; ModuleVersion = '1.156.2025'; }, 
               @{ModuleName = 'GenXdev.FileSystem'; ModuleVersion = '1.156.2025'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('GenXdev.Coding.Git.psm1', 
               'GenXdev.Coding.PowerShell.Modules.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-FeatureLineToREADME', 'Add-IdeaLineToREADME', 
               'Add-IssueLineToREADME', 'Add-LineToREADME', 
               'Add-MissingGenXdevUnitTests', 'Add-ReleaseNoteLineToREADME', 
               'Add-TodoLineToREADME', 'Assert-GenXdevCmdlet', 
               'Assert-GenXdevCmdletTests', 'Assert-GenXdevDependencyUsage', 
               'Assert-GenXdevUnitTest', 'Assert-ModuleDefinition', 
               'Assert-NextGenXdevCmdlet', 'Assert-NextGenXdevCmdletTest', 
               'Assert-RefactorFile', 'AssureCopilotKeyboardShortCut', 
               'AssureGithubCLIInstalled', 'AssureVSCodeInstallation', 
               'Clear-GenXdevModules', 'Complete-GenXDevREADME', 'Features', 
               'Get-GenXDevModule', 'Get-GenXDevModuleInfo', 
               'Get-GenXDevNewModulesInOrderOfDependency', 'Get-GenXDevNextCmdLet', 
               'Get-ModuleHelpMarkdown', 'Get-Refactor', 'Get-RefactorReport', 'Ideas', 
               'Invoke-GenXdevScriptAnalyzer', 'Issues', 'New-GenXdevCmdlet', 
               'New-GenXdevModule', 'New-GitCommit', 
               'New-PullRequestForGenXdevModuleChanges', 'New-Refactor', 
               'Open-GenXdevCmdletsContainingClipboardTextInIde', 
               'Open-SourceFileInIde', 'PermanentlyDeleteGitFolders', 'ReleaseNotes', 
               'Remove-Refactor', 'Search-GenXdevCmdlet', 'Search-NextGenXdevCmdlet', 
               'Show-GenXdevCmdLetInIde', 'Show-RefactorReport', 'SplitUpPsm1File', 
               'Start-NextRefactor', 'Test-RefactorLLMSelection', 'Todoos', 
               'Update-Refactor', 'VSCode'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'checkgenxdevdependencies', 'cleangenxdev', 'commit', 'editcmdlet', 
               'editcode', 'feature', 'gcmd', 'Get-GenXDevModuleHelp', 'idea', 
               'improvecmdlet', 'improvecmdlettests', 'issue', 'newrefactor', 
               'nextcmdlet', 'nextcmdlettest', 'nextrefactor', 'prgenxdevmodule', 
               'refactor', 'refactorreport', 'refactors', 'ReleaseNote', 
               'rungenxdevtests', 'searchcmdlet', 'todo', 'updaterefactor', 
               'vscodeclipboard'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @('GenXdev.Coding')

# List of all files packaged with this module
FileList = 'GenXdev.Coding.Git.psm1', 'GenXdev.Coding.PowerShell.Modules.psm1', 
               'GenXdev.Coding.psd1', 'GenXdev.Coding.psm1', 'LICENSE', 'license.txt', 
               'powershell.jpg', 'README.md', 
               'Tests\GenXdev.Coding.PowerShell.Modules\_AssertGenXdevUnitTests.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Add-MissingGenXdevUnitTests.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdlet.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdletTests.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevDependencyUsage.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevUnitTest.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-ModuleDefinition.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-NextGenXdevCmdlet.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-NextGenXdevCmdletTest.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Assert-RefactorFile.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\AssureCopilotKeyboardShortCut.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Clear-GenXdevModules.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Complete-GenXDevREADME.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-GenXDevModule.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-GenXDevModuleInfo.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-GenXDevNewModulesInOrderOfDependency.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-GenXDevNextCmdLet.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-ModuleHelpMarkdown.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-Refactor.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Get-RefactorReport.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Invoke-GenXdevScriptAnalyzer.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Invoke-ScriptAnalyzerFix.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\New-GenXdevCmdlet.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\New-GenXdevModule.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\New-PullRequestForGenXdevModuleChanges.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\New-Refactor.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Open-GenXdevCmdletsContainingClipboardTextInIde.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Remove-Refactor.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Search-GenXdevCmdlet.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Search-NextGenXdevCmdlet.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Show-GenXdevCmdLetInIde.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Show-RefactorReport.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\SplitUpPsm1File.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Start-NextRefactor.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Test-RefactorLLMSelection.Tests.ps1', 
               'Tests\GenXdev.Coding.PowerShell.Modules\Update-Refactor.Tests.ps1', 
               'Tests\GenXdev.Coding.Git\New-GitCommit.Tests.ps1', 
               'Tests\GenXdev.Coding.Git\PermanentlyDeleteGitFolders.Tests.ps1', 
               'Tests\GenXdev.Coding\Add-FeatureLineToREADME.Tests.ps1', 
               'Tests\GenXdev.Coding\Add-IdeaLineToREADME.Tests.ps1', 
               'Tests\GenXdev.Coding\Add-IssueLineToREADME.Tests.ps1', 
               'Tests\GenXdev.Coding\Add-LineToREADME.Tests.ps1', 
               'Tests\GenXdev.Coding\Add-ReleaseNoteLineToREADME.Tests.ps1', 
               'Tests\GenXdev.Coding\Add-TodoLineToREADME.Tests.ps1', 
               'Tests\GenXdev.Coding\AssureGithubCLIInstalled.Tests.ps1', 
               'Tests\GenXdev.Coding\AssureVSCodeInstallation.Tests.ps1', 
               'Tests\GenXdev.Coding\Features.Tests.ps1', 
               'Tests\GenXdev.Coding\Ideas.Tests.ps1', 
               'Tests\GenXdev.Coding\Issues.Tests.ps1', 
               'Tests\GenXdev.Coding\Open-SourceFileInIde.Tests.ps1', 
               'Tests\GenXdev.Coding\ReleaseNotes.Tests.ps1', 
               'Tests\GenXdev.Coding\Todoos.Tests.ps1', 
               'Tests\GenXdev.Coding\VSCode.Tests.ps1', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-AddProgressSupport-script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-AddProgressSupport.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-CheckAllRequirements-script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-CheckAllRequirements.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-CreateUnitTests.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-FixIntrusiveOutput-Script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-FixIntrusiveOutput.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-ImproveUnitTest.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-ModuleDefinition.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-New-GenXdevCmdlet.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-NewGenXdevCmdLet-script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-NewGenXdevCmdLet.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-OnlyDocumentation-script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-OnlyDocumentation.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-PSExceptionHandling-script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-PSExceptionHandling.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-PSFindIntrusiveOutput-script.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-PSFindIntrusiveOutput.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-ResolveFailedTest.txt', 
               'Prompts\GenXdev.Coding.PowerShell.Modules\Assert-StandardRequirements.txt', 
               'Functions\GenXdev.Coding.PowerShell.Modules\_AssertGenXdevUnitTests.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Add-MissingGenXdevUnitTests.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdlet.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdletTests.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevDependencyUsage.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevUnitTest.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-ModuleDefinition.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-NextGenXdevCmdlet.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-NextGenXdevCmdletTest.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Assert-RefactorFile.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\AssureCopilotKeyboardShortCut.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Clear-GenXdevModules.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Complete-GenXDevREADME.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevModule.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevModuleInfo.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevNewModulesInOrderOfDependency.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevNextCmdLet.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-ModuleHelpMarkdown.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-Refactor.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Get-RefactorReport.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Invoke-GenXdevScriptAnalyzer.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Measure-LineContinuation.psm1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Measure-UseFullyQualifiedCmdletNames.psm1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\New-GenXdevCmdlet.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\New-GenXdevModule.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\New-PullRequestForGenXdevModuleChanges.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\New-Refactor.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Open-GenXdevCmdletsContainingClipboardTextInIde.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\PSScriptAnalyzerSettings.psd1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Remove-Refactor.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Search-GenXdevCmdlet.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Search-NextGenXdevCmdlet.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Show-GenXdevCmdLetInIde.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Show-RefactorReport.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\SplitUpPsm1File.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Start-NextRefactor.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Test-RefactorLLMSelection.ps1', 
               'Functions\GenXdev.Coding.PowerShell.Modules\Update-Refactor.ps1', 
               'Functions\GenXdev.Coding.Git\New-GitCommit.ps1', 
               'Functions\GenXdev.Coding.Git\PermanentlyDeleteGitFolders.ps1', 
               'Functions\GenXdev.Coding\Add-FeatureLineToREADME.ps1', 
               'Functions\GenXdev.Coding\Add-IdeaLineToREADME.ps1', 
               'Functions\GenXdev.Coding\Add-IssueLineToREADME.ps1', 
               'Functions\GenXdev.Coding\Add-LineToREADME.ps1', 
               'Functions\GenXdev.Coding\Add-ReleaseNoteLineToREADME.ps1', 
               'Functions\GenXdev.Coding\Add-TodoLineToREADME.ps1', 
               'Functions\GenXdev.Coding\AssureGithubCLIInstalled.ps1', 
               'Functions\GenXdev.Coding\AssureVSCodeInstallation.ps1', 
               'Functions\GenXdev.Coding\Features.ps1', 
               'Functions\GenXdev.Coding\Ideas.ps1', 
               'Functions\GenXdev.Coding\Issues.ps1', 
               'Functions\GenXdev.Coding\Open-SourceFileInIde.ps1', 
               'Functions\GenXdev.Coding\ReleaseNotes.ps1', 
               'Functions\GenXdev.Coding\Todoos.ps1', 
               'Functions\GenXdev.Coding\VSCode.ps1'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Git','Shell','GenXdev','Coding','VSCode','VisualStudioCode','VisualStudio','Refactoring','Code','CodeQuality','CodeReview','CodeAnalysis','CodeMetrics','GithubCoPilot','Github'

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/genXdev/GenXdev.Coding/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://powershell.genxdev.net/#GenXdev.Coding'

        # A URL to an icon representing this module.
        IconUri = 'https://genxdev.net/favicon.ico'

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

