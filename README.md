<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Coding
### SYNOPSIS
    A Windows PowerShell module that helps being more productive with coding tasks.
[![GenXdev.Coding](https://img.shields.io/powershellgallery/v/GenXdev.Coding.svg?style=flat-square&label=GenXdev.Coding)](https://www.powershellgallery.com/packages/GenXdev.Coding/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Coding?style=flat-square)](./LICENSE)

### FEATURES
* ✅ Advanced PowerShell Module Development
     * Create new cmdlets with proper structure and validation using `New-GenXdevCmdlet`
     * Run and manage unit tests with `Assert-GenXdevUnitTest`

* ✅ AI-Powered Code Refactoring
     * Create and manage refactoring tasks with `New-Refactor` and `Update-Refactor`
     * Use LLM-based selection to identify files needing refactoring
     * Continue refactoring sessions with `Start-NextRefactor`
     * Prioritize refactoring tasks for optimal workflow
     * Manage all refactors with `Update-Refactor`
     * Generate detailed refactoring reports with `Get-RefactorReport`

* ✅ GenXdev Module Management
     * Improve existing cmdlets with `Assert-GenXdevCmdlet`
     * Enhance unit tests using `Assert-GenXdevCmdletTest`
     * Process cmdlets sequentially with `Assert-NextGenXdevCmdlet`
     * Search and edit cmdlets with `Search-GenXdevCmdlet`

* ✅ Development Environment Integration
     * Configure Visual Studio Code with recommended extensions
     * Set up GitHub CLI and Copilot integration
     * Open files in preferred IDE (VS Code/Visual Studio)
     * Manage git operations with `New-GitCommit`

* ✅ Documentation Management
     * Track features, ideas, issues, and todos in README files
     * Add timestamped entries for features, release notes, and todos
     * View and manage documentation sections with dedicated cmdlets
     * Generate and maintain module documentation automatically

* ✅ Safety Features
     * Restricted cmdlet access for LLM operations
     * User approval required for file modifications
     * WinMerge integration for safe content comparison
     * Secure handling of source control operations

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/)  [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.Queries](https://img.shields.io/powershellgallery/v/GenXdev.Queries.svg?style=flat-square&label=GenXdev.Queries)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.Console](https://img.shields.io/powershellgallery/v/GenXdev.Console.svg?style=flat-square&label=GenXdev.Console)](https://www.powershellgallery.com/packages/GenXdev.Console/)  [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.FileSystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)
### INSTALLATION
````PowerShell
Install-Module "GenXdev.AI"
Import-Module "GenXdev.AI"
````
### UPDATE
````PowerShell
Update-Module
````
<br/><hr/><hr/><br/>

# Cmdlet Index
### GenXdev.Coding<hr/>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Add-FeatureLineToREADME](#Add-FeatureLineToREADME) | feature | Adds a feature line to the README file with a timestamp. |
| [Add-IdeaLineToREADME](#Add-IdeaLineToREADME) | idea | Adds an idea item to the README.md file. |
| [Add-IssueLineToREADME](#Add-IssueLineToREADME) | issue | Adds an issue item to the README.md file. |
| [Add-LineToREADME](#Add-LineToREADME) |  | Adds a line to a README.md markdown file in a specified section. |
| [Add-ReleaseNoteLineToREADME](#Add-ReleaseNoteLineToREADME) | releasenote | Adds a ReleaseNote line to the README file with a timestamp. |
| [Add-TodoLineToREADME](#Add-TodoLineToREADME) | todo | Adds a todo item to the README.md file. |
| [AssureGithubCLIInstalled](#AssureGithubCLIInstalled) |  | Ensures GitHub CLI is properly installed and configured on the system. |
| [AssureVSCodeInstallation](#AssureVSCodeInstallation) |  | Installs and configures Visual Studio Code with recommended extensions. |
| [Features](#Features) |  | Displays features from a README.md file. |
| [Ideas](#Ideas) |  | Displays ideas from a README.md file. |
| [Issues](#Issues) |  | Displays issues from a README.md file. |
| [Open-SourceFileInIde](#Open-SourceFileInIde) | editcode | Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio). |
| [ReleaseNotes](#ReleaseNotes) |  | Displays ReleaseNotes from a README.md file. |
| [Todoos](#Todoos) |  | Displays todo items from a README.md file. |
| [VSCode](#VSCode) |  | Opens one or more files in Visual Studio Code. |

<hr/>
&nbsp;

### GenXdev.Coding.Git</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [New-GitCommit](#New-GitCommit) | commit | Creates and pushes a new git commit with all changes. |
| [PermanentlyDeleteGitFolders](#PermanentlyDeleteGitFolders) |  | Permanently deletes specified folders from all branches in a Git repository. |

<hr/>
&nbsp;

### GenXdev.Coding.PowerShell.Modules</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Add-MissingGenXdevUnitTests](#Add-MissingGenXdevUnitTests) |  |  |
| [Assert-GenXdevCmdlet](#Assert-GenXdevCmdlet) | improvecmdlet | Improves GenXdev cmdlet documentation and implementation through AI assistance. |
| [Assert-GenXdevCmdletTests](#Assert-GenXdevCmdletTests) | improvecmdlettests | Asserts and improves unit-tests of a specified GenXdev cmdlet. |
| [Assert-GenXdevDependencyUsage](#Assert-GenXdevDependencyUsage) | checkgenxdevdependencies |  |
| [Assert-GenXdevUnitTest](#Assert-GenXdevUnitTest) | rungenxdevtests |  |
| [Assert-ModuleDefinition](#Assert-ModuleDefinition) |  | Assists in refactoring PowerShell source code files using AI assistance. |
| [Assert-NextGenXdevCmdlet](#Assert-NextGenXdevCmdlet) | nextcmdlet | Asserts and improves the next GenXdev cmdlet in sequence. |
| [Assert-NextGenXdevCmdletTest](#Assert-NextGenXdevCmdletTest) | nextcmdlettest | Automates testing improvements for GenXdev cmdlets by managing test creation. |
| [Assert-RefactorFile](#Assert-RefactorFile) |  |  |
| [AssureCopilotKeyboardShortCut](#AssureCopilotKeyboardShortCut) |  | Configures the GitHub Copilot keyboard shortcut in Visual Studio Code. |
| [Clear-GenXdevModules](#Clear-GenXdevModules) | cleangenxdev | Cleans build artifacts from GenXdev PowerShell modules. |
| [Complete-GenXDevREADME](#Complete-GenXDevREADME) |  | Completes the README file for specified GenXDev modules by adding documentation. |
| [Get-GenXDevModule](#Get-GenXDevModule) |  | Retrieves all GenXDev modules from a specified path. |
| [Get-GenXDevModuleInfo](#Get-GenXDevModuleInfo) |  | Retrieves detailed information about GenXdev PowerShell modules. |
| [Get-GenXDevNewModulesInOrderOfDependency](#Get-GenXDevNewModulesInOrderOfDependency) |  | Retrieves GenXDev modules in dependency order. |
| [Get-GenXDevNextCmdLet](#Get-GenXDevNextCmdLet) |  | Retrieves the next GenXdev cmdlet to be improved. |
| [Get-ModuleHelpMarkdown](#Get-ModuleHelpMarkdown) | get-genxdevmodulehelp | Generates markdown help documentation for specified GenXDev modules. |
| [Get-Refactor](#Get-Refactor) | refactor | Retrieves refactor definitions from GenXdev preferences based on name patterns. |
| [Get-RefactorReport](#Get-RefactorReport) | refactorreport | Generates a detailed report of refactoring operations and their status. |
| [Invoke-GenXdevScriptAnalyzer](#Invoke-GenXdevScriptAnalyzer) |  |  |
| [New-GenXdevCmdlet](#New-GenXdevCmdlet) | gcmd | Creates a new GenXdev PowerShell cmdlet with proper structure and validation. |
| [New-PullRequestForGenXdevModuleChanges](#New-PullRequestForGenXdevModuleChanges) | prgenxdevmodule | Creates a pull request for changes made to a GenXdev module. |
| [New-Refactor](#New-Refactor) | newrefactor | Creates a new refactoring set for code transformation tasks. |
| [Open-GenXdevCmdletsContainingClipboardTextInIde](#Open-GenXdevCmdletsContainingClipboardTextInIde) |  | Opens files in IDE that contain clipboard text |
| [Remove-Refactor](#Remove-Refactor) |  | Removes refactor sets from GenXdev preferences system. |
| [Search-GenXdevCmdlet](#Search-GenXdevCmdlet) | searchcmdlet |  |
| [Search-NextGenXdevCmdlet](#Search-NextGenXdevCmdlet) | nextcmdlet |  |
| [Show-GenXdevCmdLetInIde](#Show-GenXdevCmdLetInIde) | editcmdlet | Opens the specified GenXdev cmdlet in Visual Studio Code. |
| [Show-RefactorReport](#Show-RefactorReport) | refactors | Displays a formatted report of refactoring information for specified modules. |
| [SplitUpPsm1File](#SplitUpPsm1File) | split | Splits a PowerShell module (.psm1) file into individual function files. |
| [Start-NextRefactor](#Start-NextRefactor) | nextrefactor | Continues or restarts a code refactoring session. |
| [Test-RefactorLLMSelection](#Test-RefactorLLMSelection) |  | Evaluates source files for refactoring eligibility using LLM analysis. |
| [Update-Refactor](#Update-Refactor) | updaterefactor | Updates and manages refactoring sets including file selection and processing. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
