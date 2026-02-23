<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Coding
### SYNOPSIS
    A Windows PowerShell module that helps being more productive with coding tasks.
[![GenXdev.Coding](https://img.shields.io/powershellgallery/v/GenXdev.Coding.svg?style=flat-square&label=GenXdev.Coding)](https://www.powershellgallery.com/packages/GenXdev.Coding/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Coding?style=flat-square)](./LICENSE)

## APACHE 2.0 License

````text
Copyright (c) 2025 René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

````

### FEATURES
* Advanced PowerShell Module Development
     * Create new cmdlets with proper structure and validation
        using `New-GenXdevCmdlet`
     * Run and manage unit tests with `Assert-GenXdevTest`

* AI-Powered Code Refactoring
     * Create and manage refactoring tasks with `New-Refactor`
       and `Update-Refactor`
     * Use LLM-based selection to identify files needing refactoring
     * Continue refactoring sessions with `Start-NextRefactor`
     * Prioritize refactoring tasks for optimal workflow
     * Manage all refactors with `Update-Refactor`
     * Generate detailed refactoring reports with `Get-RefactorReport`

* GenXdev Module Management
     * Improve existing cmdlets with `Assert-GenXdevCmdlet`
     * Enhance unit tests using `Assert-GenXdevCmdletTest`
     * Search and edit cmdlets with `Search-GenXdevCmdlet`

* Development Environment Integration
     * Configure Visual Studio Code with recommended extensions
     * Set up GitHub CLI and Copilot integration
     * Open files in preferred IDE (VS Code/Visual Studio)
     * Manage git operations with `New-GitCommit`

* Documentation Management
     * Track features, ideas, issues, and todos in README files
     * Add timestamped entries for features, release notes, and todos
     * View and manage documentation sections with dedicated cmdlets
     * Generate and maintain module documentation automatically

* Safety Features
     * Restricted cmdlet access for LLM operations
     * User approval required for file modifications
     * WinMerge integration for safe content comparison
     * Secure handling of source control operations

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/)  [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.Queries](https://img.shields.io/powershellgallery/v/GenXdev.Queries.svg?style=flat-square&label=GenXdev.Queries)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.Console](https://img.shields.io/powershellgallery/v/GenXdev.Console.svg?style=flat-square&label=GenXdev.Console)](https://www.powershellgallery.com/packages/GenXdev.Console/)  [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.FileSystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)

### INSTALLATION
```PowerShell
Install-Module "GenXdev.AI"
Import-Module "GenXdev.AI"
```
### UPDATE
```PowerShell
Update-Module
```

<br/><hr/><br/>

# Cmdlet Index
### GenXdev.Coding
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-FeatureLineToREADME](#add-featurelinetoreadme) | feature | Adds a feature line to the README file with a timestamp. |
| [Add-IdeaLineToREADME](#add-idealinetoreadme) | idea | Adds an idea item to the README.md file. |
| [Add-IssueLineToREADME](#add-issuelinetoreadme) | issue | Adds an issue item to the README.md file. |
| [Add-LineToREADME](#add-linetoreadme) | &nbsp; | &nbsp; |
| [Add-ReleaseNoteLineToREADME](#add-releasenotelinetoreadme) | releasenote | Adds a ReleaseNote line to the README file with a timestamp. |
| [Add-TodoLineToREADME](#add-todolinetoreadme) | todo | Adds a todo item to the README.md file. |
| [EnsureVSCodeInstallation](#ensurevscodeinstallation) | &nbsp; | Installs and configures Visual Studio Code with recommended extensions. |
| [Features](#features) | &nbsp; | Displays features from a README.md file. |
| [Ideas](#ideas) | &nbsp; | &nbsp; |
| [Issues](#issues) | &nbsp; | &nbsp; |
| [Open-SourceFileInIde](#open-sourcefileinide) | editcode | &nbsp; |
| [ReleaseNotes](#releasenotes) | &nbsp; | &nbsp; |
| [Todoos](#todoos) | &nbsp; | &nbsp; |
| [VSCode](#vscode) | &nbsp; | &nbsp; |

### GenXdev.Coding.Git
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Get-GitChangedFiles](#get-gitchangedfiles) | gitchanged | Get the list of changed files in a Git repository. |
| [New-GitCommit](#new-gitcommit) | commit | Creates and pushes a new git commit with all changes. |
| [PermanentlyDeleteGitFolders](#permanentlydeletegitfolders) | &nbsp; | Permanently deletes specified folders from all branches in a Git repository. |

### GenXdev.Coding.PowerShell.Modules
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-MissingGenXdevUnitTests](#add-missinggenxdevunittests) | &nbsp; | &nbsp; |
| [Assert-GenXdevCmdlet](#assert-genxdevcmdlet) | improvecmdlet | Improves GenXdev cmdlet documentation and implementation through AI assistance. |
| [Assert-GenXdevCmdletTests](#assert-genxdevcmdlettests) | improvecmdlettests | Asserts and improves unit-tests of a specified GenXdev cmdlet. |
| [Assert-GenXdevDependencyUsage](#assert-genxdevdependencyusage) | checkgenxdevdependencies | &nbsp; |
| [Assert-GenXdevTest](#assert-genxdevtest) | rungenxdevtests | &nbsp; |
| [Assert-ModuleDefinition](#assert-moduledefinition) | &nbsp; | &nbsp; |
| [Assert-RefactorFile](#assert-refactorfile) | &nbsp; | &nbsp; |
| [Clear-GenXdevModules](#clear-genxdevmodules) | cleangenxdev | Cleans build artifacts from GenXdev PowerShell modules. |
| [Complete-GenXDevREADME](#complete-genxdevreadme) | &nbsp; | &nbsp; |
| [EnsureCopilotKeyboardShortCut](#ensurecopilotkeyboardshortcut) | &nbsp; | Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code. |
| [EnsureDefaultGenXdevRefactors](#ensuredefaultgenxdevrefactors) | &nbsp; | &nbsp; |
| [Get-GenXdevCmdletUsageAnalysis](#get-genxdevcmdletusageanalysis) | &nbsp; | &nbsp; |
| [Get-GenXDevModule](#get-genxdevmodule) | &nbsp; | Retrieves all GenXDev modules from a specified path. |
| [Get-GenXDevModuleinfo](#get-genxdevmoduleinfo) | &nbsp; | &nbsp; |
| [Get-GenXDevNewModulesInOrderOfDependency](#get-genxdevnewmodulesinorderofdependency) | &nbsp; | Retrieves GenXDev modules in dependency order. |
| [Get-ModuleHelpMarkdown](#get-modulehelpmarkdown) | &nbsp; | &nbsp; |
| [Get-Refactor](#get-refactor) | refactors | &nbsp; |
| [Get-RefactorReport](#get-refactorreport) | refactorreport | Generates a detailed report of refactoring operations and their status. |
| [Invoke-GenXdevPSFormatter](#invoke-genxdevpsformatter) | &nbsp; | &nbsp; |
| [Invoke-GenXdevScriptAnalyzer](#invoke-genxdevscriptanalyzer) | &nbsp; | &nbsp; |
| [New-GenXdevCmdlet](#new-genxdevcmdlet) | newcmd | Creates a new GenXdev PowerShell cmdlet with proper structure and validation. |
| [New-GenXdevModule](#new-genxdevmodule) | &nbsp; | &nbsp; |
| [New-PullRequestForGenXdevModuleChanges](#new-pullrequestforgenxdevmodulechanges) | prgenxdevmodule | Creates a pull request for changes made to a GenXdev module. |
| [New-Refactor](#new-refactor) | newrefactor | &nbsp; |
| [Open-GenXdevCmdletsContainingClipboardTextInIde](#open-genxdevcmdletscontainingclipboardtextinide) | vscodesearch | Opens files in IDE that contain clipboard text |
| [Remove-Refactor](#remove-refactor) | &nbsp; | Removes refactor sets from GenXdev preferences system. |
| [Search-GenXdevCmdlet](#search-genxdevcmdlet) | searchcmdlet | Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing. |
| [Show-GenXdevCmdLetInIde](#show-genxdevcmdletinide) | cmdlet, editcmdlet | Opens the specified GenXdev cmdlet in Visual Studio Code. |
| [SplitUpPsm1File](#splituppsm1file) | &nbsp; | &nbsp; |
| [Start-NextRefactor](#start-nextrefactor) | nextrefactor | &nbsp; |
| [Test-RefactorLLMSelection](#test-refactorllmselection) | &nbsp; | Evaluates source files for refactoring eligibility using LLM analysis. |
| [Update-Refactor](#update-refactor) | updaterefactor | &nbsp; |

### GenXdev.Coding.Templating
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-ArrayTemplate](#add-arraytemplate) | FormatArray | &nbsp; |
| [Remove-DoubleEmptyLines](#remove-doubleemptylines) | &nbsp; | &nbsp; |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
``` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
``` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
``` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
``` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
``` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
``` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
``` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
``` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
``` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-tempPath <string>] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -tempPath <string>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
``` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
``` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>]
    [-FromScripts] [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <string>]
    [[-TestFailedAction] {Ask | Continue | Stop |
    SolveWithAI | Write-Error | Throw}]
    [[-DefinitionMatches] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch]
    [-Verbosity {None | Normal | Detailed | Diagnostic}]
    [-StackTraceVerbosity {None | FirstLine | Filtered |
    Full}] [-AllowLongRunningTests] [-SkipModuleImports]
    [-SkipPSAnalyzerTests] [-SkipPesterTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
``` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
``` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
``` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
``` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
``` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Forces recreation of existing refactor definitions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
``` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModuleinfo 
```PowerShell 

   Get-GenXDevModuleInfo  
``` 

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
``` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
``` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath
    <String>] [-DefaultValue <String>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Name <String[]>  
        One or more name patterns to match against refactor set names. Patterns are  
        matched against the portion of the preference name after 'refactor_set_' prefix.  
        Supports wildcards. If omitted, returns all refactor sets.  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-ScriptFilePath] <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptFilePath <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      Path, FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
``` 

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName]
    {GenXdev.AI | GenXdev.Coding | GenXdev.Media |
    GenXdev.Console | GenXdev.Data | GenXdev.FileSystem |
    GenXdev.Helpers | GenXdev.Queries | GenXdev.Webbrowser |
    GenXdev.Windows} [[-CommitMessage] <string>]
    [[-PullRequestTitle] <string>]
    [[-PullRequestDescription] <string>] [[-GitUserName]
    <string>] [[-GitUserEmail] <string>] [-Monitor <int>]
    [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>]
    [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
``` 

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <string> [-PromptKey] <string>
    [[-Prompt] <string>] [[-SelectionScript] <string>]
    [[-SelectionPrompt] <string>] [[-LLMQueryType]
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-MaxToken <int>]
    [-Cpu <int>] [-TTLSeconds <int>] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-Temperature <double>] [-Gpu
    <int>] [-ApiEndpoint <string>] [-ApiKey <string>]
    [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath
    <string>] [-AutoAddModifiedFiles] [-Force]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-Code]
    [-VisualStudio] [-KeysToSend <string[]>] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
``` 

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [-CmdletName] <string>
    [[-ModuleName] <string[]>] [[-BaseModuleName] <string>]
    [[-Synopsis] <string>] [[-Description] <string>]
    [[-CmdletAliases] <string[]>] [-NoLocal]
    [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio]
    [-UnitTests] [-KeysToSend <string[]>] [-CoPilot]
    [-Search] [-ChangedirectoryOnly] [-New] [-PromptKey
    <string>] [-Prompt <string>] [-EditPrompt]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
``` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
``` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
``` 

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]
Update-Refactor [[-Refactor] <RefactorDefinition[]>]
    [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove]
    <FileInfo[]>] [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Templating<hr/> 

##	Add-ArrayTemplate 
```PowerShell 

   Add-ArrayTemplate                    --> FormatArray  
``` 

### SYNTAX 
```PowerShell 
Add-ArrayTemplate [-InputObject] <IEnumerable> [-Template]
    <string> [[-Delimiter] <string>] [[-Indentation] <int>]
    [[-NewLine]] [[-EndDelimiter]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Delimiter <string>  
        The delimiter string to insert between formatted items  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EndDelimiter  
        Add delimiter at end when array not empty  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Indentation <int>  
        The number of indentation levels (4 spaces per level) to apply  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <IEnumerable>  
        The collection of objects to format  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NewLine  
        Appends a trailing delimiter after the final item  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Template <string>  
        The template string with {PropertyName} or {PropertyName:format} placeholders  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-DoubleEmptyLines 
```PowerShell 

   Remove-DoubleEmptyLines  
``` 

### SYNTAX 
```PowerShell 
Remove-DoubleEmptyLines [-code] <string> [[-Reformat]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Reformat  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -code <string>  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
``` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
``` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
``` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
``` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
``` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Get-Features  
``` 

### SYNTAX 
```PowerShell 
Get-Features [[-UseHomeREADME]] [[-UseOneDriveREADME]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
``` 

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -PassThru  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
``` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
``` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
``` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
``` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
``` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
``` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
``` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <Object>
    [-Path] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorDefinition <Object>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
``` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
``` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
``` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
``` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
``` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
``` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
``` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
``` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
``` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
``` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
``` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
``` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
``` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Get-Features  
``` 

### SYNTAX 
```PowerShell 
Get-Features [[-UseHomeREADME]] [[-UseOneDriveREADME]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
``` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-tempPath <string>] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -tempPath <string>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
``` 

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -PassThru  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
``` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
``` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
``` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>]
    [-FromScripts] [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <string>]
    [[-TestFailedAction] {Ask | Continue | Stop |
    SolveWithAI | Write-Error | Throw}]
    [[-DefinitionMatches] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch]
    [-Verbosity {None | Normal | Detailed | Diagnostic}]
    [-StackTraceVerbosity {None | FirstLine | Filtered |
    Full}] [-AllowLongRunningTests] [-SkipModuleImports]
    [-SkipPSAnalyzerTests] [-SkipPesterTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
``` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
``` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
``` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
``` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
``` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Forces recreation of existing refactor definitions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
``` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModuleinfo 
```PowerShell 

   Get-GenXDevModuleInfo  
``` 

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
``` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
``` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath
    <String>] [-DefaultValue <String>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Name <String[]>  
        One or more name patterns to match against refactor set names. Patterns are  
        matched against the portion of the preference name after 'refactor_set_' prefix.  
        Supports wildcards. If omitted, returns all refactor sets.  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-ScriptFilePath] <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptFilePath <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      Path, FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
``` 

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName]
    {GenXdev.AI | GenXdev.Coding | GenXdev.Media |
    GenXdev.Console | GenXdev.Data | GenXdev.FileSystem |
    GenXdev.Helpers | GenXdev.Queries | GenXdev.Webbrowser |
    GenXdev.Windows} [[-CommitMessage] <string>]
    [[-PullRequestTitle] <string>]
    [[-PullRequestDescription] <string>] [[-GitUserName]
    <string>] [[-GitUserEmail] <string>] [-Monitor <int>]
    [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>]
    [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
``` 

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <string> [-PromptKey] <string>
    [[-Prompt] <string>] [[-SelectionScript] <string>]
    [[-SelectionPrompt] <string>] [[-LLMQueryType]
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-MaxToken <int>]
    [-Cpu <int>] [-TTLSeconds <int>] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-Temperature <double>] [-Gpu
    <int>] [-ApiEndpoint <string>] [-ApiKey <string>]
    [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath
    <string>] [-AutoAddModifiedFiles] [-Force]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-Code]
    [-VisualStudio] [-KeysToSend <string[]>] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
``` 

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [-CmdletName] <string>
    [[-ModuleName] <string[]>] [[-BaseModuleName] <string>]
    [[-Synopsis] <string>] [[-Description] <string>]
    [[-CmdletAliases] <string[]>] [-NoLocal]
    [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio]
    [-UnitTests] [-KeysToSend <string[]>] [-CoPilot]
    [-Search] [-ChangedirectoryOnly] [-New] [-PromptKey
    <string>] [-Prompt <string>] [-EditPrompt]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
``` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
``` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
``` 

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]
Update-Refactor [[-Refactor] <RefactorDefinition[]>]
    [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove]
    <FileInfo[]>] [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
``` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
``` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
``` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
``` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
``` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
``` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <Object>
    [-Path] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorDefinition <Object>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Templating<hr/> 

##	Add-ArrayTemplate 
```PowerShell 

   Add-ArrayTemplate                    --> FormatArray  
``` 

### SYNTAX 
```PowerShell 
Add-ArrayTemplate [-InputObject] <IEnumerable> [-Template]
    <string> [[-Delimiter] <string>] [[-Indentation] <int>]
    [[-NewLine]] [[-EndDelimiter]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Delimiter <string>  
        The delimiter string to insert between formatted items  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EndDelimiter  
        Add delimiter at end when array not empty  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Indentation <int>  
        The number of indentation levels (4 spaces per level) to apply  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <IEnumerable>  
        The collection of objects to format  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NewLine  
        Appends a trailing delimiter after the final item  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Template <string>  
        The template string with {PropertyName} or {PropertyName:format} placeholders  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-DoubleEmptyLines 
```PowerShell 

   Remove-DoubleEmptyLines  
``` 

### SYNTAX 
```PowerShell 
Remove-DoubleEmptyLines [-code] <string> [[-Reformat]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Reformat  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -code <string>  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
``` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
``` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
``` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
``` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
``` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
``` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
``` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
``` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
``` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
``` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
``` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
``` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
``` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Get-Features  
``` 

### SYNTAX 
```PowerShell 
Get-Features [[-UseHomeREADME]] [[-UseOneDriveREADME]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
``` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-tempPath <string>] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -tempPath <string>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
``` 

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -PassThru  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
``` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
``` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
``` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>]
    [-FromScripts] [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <string>]
    [[-TestFailedAction] {Ask | Continue | Stop |
    SolveWithAI | Write-Error | Throw}]
    [[-DefinitionMatches] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch]
    [-Verbosity {None | Normal | Detailed | Diagnostic}]
    [-StackTraceVerbosity {None | FirstLine | Filtered |
    Full}] [-AllowLongRunningTests] [-SkipModuleImports]
    [-SkipPSAnalyzerTests] [-SkipPesterTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
``` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
``` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
``` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
``` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
``` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Forces recreation of existing refactor definitions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
``` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModuleinfo 
```PowerShell 

   Get-GenXDevModuleInfo  
``` 

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
``` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
``` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath
    <String>] [-DefaultValue <String>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Name <String[]>  
        One or more name patterns to match against refactor set names. Patterns are  
        matched against the portion of the preference name after 'refactor_set_' prefix.  
        Supports wildcards. If omitted, returns all refactor sets.  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-ScriptFilePath] <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptFilePath <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      Path, FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
``` 

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName]
    {GenXdev.AI | GenXdev.Coding | GenXdev.Media |
    GenXdev.Console | GenXdev.Data | GenXdev.FileSystem |
    GenXdev.Helpers | GenXdev.Queries | GenXdev.Webbrowser |
    GenXdev.Windows} [[-CommitMessage] <string>]
    [[-PullRequestTitle] <string>]
    [[-PullRequestDescription] <string>] [[-GitUserName]
    <string>] [[-GitUserEmail] <string>] [-Monitor <int>]
    [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>]
    [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
``` 

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <string> [-PromptKey] <string>
    [[-Prompt] <string>] [[-SelectionScript] <string>]
    [[-SelectionPrompt] <string>] [[-LLMQueryType]
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-MaxToken <int>]
    [-Cpu <int>] [-TTLSeconds <int>] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-Temperature <double>] [-Gpu
    <int>] [-ApiEndpoint <string>] [-ApiKey <string>]
    [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath
    <string>] [-AutoAddModifiedFiles] [-Force]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-Code]
    [-VisualStudio] [-KeysToSend <string[]>] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
``` 

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [-CmdletName] <string>
    [[-ModuleName] <string[]>] [[-BaseModuleName] <string>]
    [[-Synopsis] <string>] [[-Description] <string>]
    [[-CmdletAliases] <string[]>] [-NoLocal]
    [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio]
    [-UnitTests] [-KeysToSend <string[]>] [-CoPilot]
    [-Search] [-ChangedirectoryOnly] [-New] [-PromptKey
    <string>] [-Prompt <string>] [-EditPrompt]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
``` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
``` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
``` 

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]
Update-Refactor [[-Refactor] <RefactorDefinition[]>]
    [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove]
    <FileInfo[]>] [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
``` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
``` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
``` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
``` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
``` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
``` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <Object>
    [-Path] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorDefinition <Object>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Templating<hr/> 

##	Add-ArrayTemplate 
```PowerShell 

   Add-ArrayTemplate                    --> FormatArray  
``` 

### SYNTAX 
```PowerShell 
Add-ArrayTemplate [-InputObject] <IEnumerable> [-Template]
    <string> [[-Delimiter] <string>] [[-Indentation] <int>]
    [[-NewLine]] [[-EndDelimiter]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Delimiter <string>  
        The delimiter string to insert between formatted items  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EndDelimiter  
        Add delimiter at end when array not empty  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Indentation <int>  
        The number of indentation levels (4 spaces per level) to apply  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <IEnumerable>  
        The collection of objects to format  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NewLine  
        Appends a trailing delimiter after the final item  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Template <string>  
        The template string with {PropertyName} or {PropertyName:format} placeholders  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-DoubleEmptyLines 
```PowerShell 

   Remove-DoubleEmptyLines  
``` 

### SYNTAX 
```PowerShell 
Remove-DoubleEmptyLines [-code] <string> [[-Reformat]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Reformat  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -code <string>  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
``` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
``` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
``` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
``` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
``` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
``` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
``` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
``` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
``` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
``` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
``` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
``` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
``` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Get-Features  
``` 

### SYNTAX 
```PowerShell 
Get-Features [[-UseHomeREADME]] [[-UseOneDriveREADME]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
``` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-tempPath <string>] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -tempPath <string>  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
``` 

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -PassThru  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
``` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
``` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
``` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>]
    [-FromScripts] [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <string>]
    [[-TestFailedAction] {Ask | Continue | Stop |
    SolveWithAI | Write-Error | Throw}]
    [[-DefinitionMatches] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch]
    [-Verbosity {None | Normal | Detailed | Diagnostic}]
    [-StackTraceVerbosity {None | FirstLine | Filtered |
    Full}] [-AllowLongRunningTests] [-SkipModuleImports]
    [-SkipPSAnalyzerTests] [-SkipPesterTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
``` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
``` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
``` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
``` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
``` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Force  
        Forces recreation of existing refactor definitions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
``` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModuleinfo 
```PowerShell 

   Get-GenXDevModuleInfo  
``` 

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>]
    [<CommonParameters>] 
``` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
``` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
``` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath
    <String>] [-DefaultValue <String>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
``` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Name <String[]>  
        One or more name patterns to match against refactor set names. Patterns are  
        matched against the portion of the preference name after 'refactor_set_' prefix.  
        Supports wildcards. If omitted, returns all refactor sets.  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
``` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-ScriptFilePath] <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ScriptFilePath <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      Path, FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
``` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
``` 

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName]
    {GenXdev.AI | GenXdev.Coding | GenXdev.Media |
    GenXdev.Console | GenXdev.Data | GenXdev.FileSystem |
    GenXdev.Helpers | GenXdev.Queries | GenXdev.Webbrowser |
    GenXdev.Windows} [[-CommitMessage] <string>]
    [[-PullRequestTitle] <string>]
    [[-PullRequestDescription] <string>] [[-GitUserName]
    <string>] [[-GitUserEmail] <string>] [-Monitor <int>]
    [-NoBorders] [-Width <int>] [-Height <int>] [-X <int>]
    [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
    [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-SetRestored] [-KeysToSend <string[]>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
``` 

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <string> [-PromptKey] <string>
    [[-Prompt] <string>] [[-SelectionScript] <string>]
    [[-SelectionPrompt] <string>] [[-LLMQueryType]
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-MaxToken <int>]
    [-Cpu <int>] [-TTLSeconds <int>] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-Temperature <double>] [-Gpu
    <int>] [-ApiEndpoint <string>] [-ApiKey <string>]
    [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath
    <string>] [-AutoAddModifiedFiles] [-Force]
    [-SessionOnly] [-ClearSession] [-SkipSession] [-Code]
    [-VisualStudio] [-KeysToSend <string[]>] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
``` 

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [-CmdletName] <string>
    [[-ModuleName] <string[]>] [[-BaseModuleName] <string>]
    [[-Synopsis] <string>] [[-Description] <string>]
    [[-CmdletAliases] <string[]>] [-NoLocal]
    [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio]
    [-UnitTests] [-KeysToSend <string[]>] [-CoPilot]
    [-Search] [-ChangedirectoryOnly] [-New] [-PromptKey
    <string>] [-Prompt <string>] [-EditPrompt]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
``` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
``` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
``` 

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]
Update-Refactor [[-Refactor] <RefactorDefinition[]>]
    [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove]
    <FileInfo[]>] [-SelectByModifiedDateFrom <datetime>]
    [-SelectByModifiedDateTo <datetime>]
    [-SelectByCreationDateFrom <datetime>]
    [-SelectByCreationDateTo <datetime>] [-PromptKey
    <string>] [-Prompt <string>] [-SelectionScript <string>]
    [-SelectionPrompt <string>] [-LLMQueryType
    {SimpleIntelligence | Knowledge | Pictures |
    TextTranslation | Coding | ToolUse}] [-Model <string>]
    [-HuggingFaceIdentifier <string>] [-Temperature
    <double>] [-MaxToken <int>] [-TTLSeconds <int>] [-Cpu
    <int>] [-Gpu <int>] [-ApiEndpoint <string>] [-ApiKey
    <string>] [-TimeoutSeconds <int>] [-Priority <int>]
    [-ExposedCmdLets <ExposedCmdletDefinition[]>]
    [-KeysToSend <string[]>] [-PreferencesDatabasePath
    <string>] [-CleanUpDeletedFiles]
    [-AskBeforeLLMSelection] [-PerformAutoSelections]
    [-PerformAISelections] [-RetryFailedLLMSelections]
    [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast]
    [-ReprocessModifiedFiles] [-Force] [-Code]
    [-VisualStudio] [-Speak] [-SelectByFreeRam]
    [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
``` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
``` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
``` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
``` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
``` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
``` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
``` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
``` 
```yaml 
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
``` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <Object>
    [-Path] <string> [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -RefactorDefinition <Object>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Templating<hr/> 

##	Add-ArrayTemplate 
```PowerShell 

   Add-ArrayTemplate                    --> FormatArray  
``` 

### SYNTAX 
```PowerShell 
Add-ArrayTemplate [-InputObject] <IEnumerable> [-Template]
    <string> [[-Delimiter] <string>] [[-Indentation] <int>]
    [[-NewLine]] [[-EndDelimiter]] [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Delimiter <string>  
        The delimiter string to insert between formatted items  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -EndDelimiter  
        Add delimiter at end when array not empty  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Indentation <int>  
        The number of indentation levels (4 spaces per level) to apply  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -InputObject <IEnumerable>  
        The collection of objects to format  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -NewLine  
        Appends a trailing delimiter after the final item  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -Template <string>  
        The template string with {PropertyName} or {PropertyName:format} placeholders  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
 

##	Remove-DoubleEmptyLines 
```PowerShell 

   Remove-DoubleEmptyLines  
``` 

### SYNTAX 
```PowerShell 
Remove-DoubleEmptyLines [-code] <string> [[-Reformat]]
    [<CommonParameters>] 
``` 

### PARAMETERS 
```yaml 
 
``` 
```yaml 
    -Reformat  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    -code <string>  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
``` 
```yaml 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   
``` 

<br/><hr/><br/>
