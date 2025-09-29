<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Coding
### SYNOPSIS
    A Windows PowerShell module that helps being more productive with coding tasks.
[![GenXdev.Coding](https://img.shields.io/powershellgallery/v/GenXdev.Coding.svg?style=flat-square&label=GenXdev.Coding)](https://www.powershellgallery.com/packages/GenXdev.Coding/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Coding?style=flat-square)](./LICENSE)

## MIT License

````text
MIT License

Copyright (c) 2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
````

### FEATURES
* ✅ Advanced PowerShell Module Development
     * Create new cmdlets with proper structure and validation
        using `New-GenXdevCmdlet`
     * Run and manage unit tests with `Assert-GenXdevTest`

* ✅ AI-Powered Code Refactoring
     * Create and manage refactoring tasks with `New-Refactor`
       and `Update-Refactor`
     * Use LLM-based selection to identify files needing refactoring
     * Continue refactoring sessions with `Start-NextRefactor`
     * Prioritize refactoring tasks for optimal workflow
     * Manage all refactors with `Update-Refactor`
     * Generate detailed refactoring reports with `Get-RefactorReport`

* ✅ GenXdev Module Management
     * Improve existing cmdlets with `Assert-GenXdevCmdlet`
     * Enhance unit tests using `Assert-GenXdevCmdletTest`
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
| [Add-LineToREADME](#add-linetoreadme) | &nbsp; | Adds a line to a README.md markdown file in a specified section. |
| [Add-ReleaseNoteLineToREADME](#add-releasenotelinetoreadme) | releasenote | Adds a ReleaseNote line to the README file with a timestamp. |
| [Add-TodoLineToREADME](#add-todolinetoreadme) | todo | Adds a todo item to the README.md file. |
| [EnsureVSCodeInstallation](#ensurevscodeinstallation) | &nbsp; | Installs and configures Visual Studio Code with recommended extensions. |
| [Features](#features) | &nbsp; | Displays features from a README.md file. |
| [Ideas](#ideas) | &nbsp; | Displays ideas from a README.md file. |
| [Issues](#issues) | &nbsp; | Displays issues from a README.md file. |
| [Open-SourceFileInIde](#open-sourcefileinide) | editcode | Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio). |
| [ReleaseNotes](#releasenotes) | &nbsp; | Displays ReleaseNotes from a README.md file. |
| [Todoos](#todoos) | &nbsp; | Displays todo items from a README.md file. |
| [VSCode](#vscode) | &nbsp; | Opens one or more files in Visual Studio Code. |

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
| [Assert-ModuleDefinition](#assert-moduledefinition) | &nbsp; | Assists in refactoring PowerShell source code files using AI assistance. |
| [Assert-RefactorFile](#assert-refactorfile) | &nbsp; | &nbsp; |
| [Clear-GenXdevModules](#clear-genxdevmodules) | cleangenxdev | Cleans build artifacts from GenXdev PowerShell modules. |
| [Complete-GenXDevREADME](#complete-genxdevreadme) | &nbsp; | Completes the README file for specified GenXDev modules by adding documentation. |
| [EnsureCopilotKeyboardShortCut](#ensurecopilotkeyboardshortcut) | &nbsp; | Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code. |
| [EnsureDefaultGenXdevRefactors](#ensuredefaultgenxdevrefactors) | &nbsp; | &nbsp; |
| [Get-GenXdevCmdletUsageAnalysis](#get-genxdevcmdletusageanalysis) | &nbsp; | Analyzes GenXdev cmdlet usage patterns to identify most frequently called functions. |
| [Get-GenXDevModule](#get-genxdevmodule) | &nbsp; | Retrieves all GenXDev modules from a specified path. |
| [Get-GenXDevModuleInfo](#get-genxdevmoduleinfo) | &nbsp; | Retrieves detailed information about GenXdev PowerShell modules. |
| [Get-GenXDevNewModulesInOrderOfDependency](#get-genxdevnewmodulesinorderofdependency) | &nbsp; | Retrieves GenXDev modules in dependency order. |
| [Get-ModuleHelpMarkdown](#get-modulehelpmarkdown) | &nbsp; | Generates markdown help documentation for specified GenXDev modules. |
| [Get-Refactor](#get-refactor) | refactors | Retrieves refactor definitions from GenXdev preferences based on name patterns. |
| [Get-RefactorReport](#get-refactorreport) | refactorreport | Generates a detailed report of refactoring operations and their status. |
| [Invoke-GenXdevPSFormatter](#invoke-genxdevpsformatter) | &nbsp; | Formats PowerShell script files using PSScriptAnalyzer formatting rules. |
| [Invoke-GenXdevScriptAnalyzer](#invoke-genxdevscriptanalyzer) | &nbsp; | &nbsp; |
| [New-GenXdevCmdlet](#new-genxdevcmdlet) | newcmd | Creates a new GenXdev PowerShell cmdlet with proper structure and validation. |
| [New-GenXdevModule](#new-genxdevmodule) | &nbsp; | Creates a new GenXdev PowerShell module with proper structure and configuration. |
| [New-PullRequestForGenXdevModuleChanges](#new-pullrequestforgenxdevmodulechanges) | prgenxdevmodule | Creates a pull request for changes made to a GenXdev module. |
| [New-Refactor](#new-refactor) | newrefactor | Creates a new refactoring set for code transformation tasks. |
| [Open-GenXdevCmdletsContainingClipboardTextInIde](#open-genxdevcmdletscontainingclipboardtextinide) | vscodesearch | Opens files in IDE that contain clipboard text |
| [Remove-Refactor](#remove-refactor) | &nbsp; | Removes refactor sets from GenXdev preferences system. |
| [Search-GenXdevCmdlet](#search-genxdevcmdlet) | searchcmdlet | Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing. |
| [Show-GenXdevCmdLetInIde](#show-genxdevcmdletinide) | cmdlet, editcmdlet | Opens the specified GenXdev cmdlet in Visual Studio Code. |
| [SplitUpPsm1File](#splituppsm1file) | &nbsp; | Splits a PowerShell module (.psm1) file into individual function files. |
| [Start-NextRefactor](#start-nextrefactor) | nextrefactor | Continues or restarts a code refactoring session. |
| [Test-RefactorLLMSelection](#test-refactorllmselection) | &nbsp; | Evaluates source files for refactoring eligibility using LLM analysis. |
| [Update-Refactor](#update-refactor) | updaterefactor | Updates and manages refactoring sets including file selection and processing. |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
```` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Format the line as code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Display the README after adding the line  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in home directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
```` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
```` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
```` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
```` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Format the line as code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Display the README after adding the line  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in home directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
```` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
```` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Features  
```` 

### SYNTAX 
```PowerShell 
Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
```` 

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
```` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
```` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
```` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
```` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
```` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
```` 

### SYNOPSIS 
    Get the list of changed files in a Git repository.  

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the list of files that have been changed in the current Git repository.  
    It can be used to identify which files have been modified, added, or deleted.  
    By default, returns relative paths with .\ prefix. Use -PassThru to get FileInfo objects.  

### PARAMETERS 
    -PassThru [<SwitchParameter>]  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
```` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
```` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
```` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <string[]>]
    [-FromScripts] [<CommonParameters>] 
```` 

### PARAMETERS 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        Filter to apply to module names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
```` 

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
```` 

### PARAMETERS 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
```` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
```` 

### PARAMETERS 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
```` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
```` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
```` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
```` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
```` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
```` 

### PARAMETERS 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevModuleInfo 
```PowerShell 

   Get-GenXDevModuleInfo  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        Names of modules to analyze  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
```` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
```` 

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <string[]>] [-PreferencesDatabasePath
    <string>] [-DefaultValue <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        Pattern(s) to search for refactor definitions  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
```` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
```` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
```` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-Path] <string> [-EnableExit]
    [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
```` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
```` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
```` 

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
    [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend
    <string[]>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
```` 

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
```` 

### PARAMETERS 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
```` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
```` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
```` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
```` 

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
```` 

### PARAMETERS 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
```` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
```` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
```` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition]
    <RefactorDefinition> [-Path] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RefactorDefinition <RefactorDefinition>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
```` 

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
```` 

### PARAMETERS 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
```` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Format the line as code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Display the README after adding the line  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in home directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
```` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
```` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
```` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
```` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Format the line as code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Display the README after adding the line  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in home directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
```` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
```` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Features  
```` 

### SYNTAX 
```PowerShell 
Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
```` 

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
```` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
```` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
```` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
```` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
```` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
```` 

### SYNOPSIS 
    Get the list of changed files in a Git repository.  

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the list of files that have been changed in the current Git repository.  
    It can be used to identify which files have been modified, added, or deleted.  
    By default, returns relative paths with .\ prefix. Use -PassThru to get FileInfo objects.  

### PARAMETERS 
    -PassThru [<SwitchParameter>]  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
```` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
```` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
```` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <string[]>]
    [-FromScripts] [<CommonParameters>] 
```` 

### PARAMETERS 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        Filter to apply to module names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
```` 

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
```` 

### PARAMETERS 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
```` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
```` 

### PARAMETERS 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
```` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
```` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
```` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
```` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
```` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
```` 

### PARAMETERS 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevModuleInfo 
```PowerShell 

   Get-GenXDevModuleInfo  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        Names of modules to analyze  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
```` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
```` 

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <string[]>] [-PreferencesDatabasePath
    <string>] [-DefaultValue <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        Pattern(s) to search for refactor definitions  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
```` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
```` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
```` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-Path] <string> [-EnableExit]
    [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
```` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
```` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
```` 

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
    [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend
    <string[]>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
```` 

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
```` 

### PARAMETERS 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
```` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
```` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
```` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
```` 

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
```` 

### PARAMETERS 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
```` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
```` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
```` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition]
    <RefactorDefinition> [-Path] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RefactorDefinition <RefactorDefinition>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
```` 

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
```` 

### PARAMETERS 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 

##	Add-FeatureLineToREADME 
```PowerShell 

   Add-FeatureLineToREADME              --> feature  
```` 

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Format the line as code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The feature description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Display the README after adding the line  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in home directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
```` 

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The idea text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
```` 

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The issue text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
```` 

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <string>] [-Section] <string>
    [-Prefix] <string> [-Code] [-Show] [-Done]
    [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open in Visual Studio Code after modifying  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Done  
        Mark the item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The line to add to the README  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prefix <string>  
        The prefix to use for the line  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Section <string>  
        The section to add the line to  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> releasenote  
```` 

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <string>] [-Code]
    [-Show] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Format the line as code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The ReleaseNote description text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Display the README after adding the line  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in home directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
```` 

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show]
    [-Done] [-UseHomeREADME] [-UseOneDriveREADME]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        Open README in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Done  
        Mark todo item as completed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Line <string>  
        The todo item text to add  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Show  
        Show the modified section  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
```` 

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Features 
```PowerShell 

   Features  
```` 

### SYNTAX 
```PowerShell 
Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Ideas 
```PowerShell 

   Ideas  
```` 

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Issues 
```PowerShell 

   Issues  
```` 

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
```` 

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <string> [[-LineNo] <int>]
    [[-KeysToSend] <string[]>] [-Code] [-VisualStudio]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Array of keyboard inputs to send to the application  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LineNo <int>  
        The line number to navigate to  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        The path to the sourcefile to open  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on target window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	ReleaseNotes 
```PowerShell 

   ReleaseNotes  
```` 

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Todoos 
```PowerShell 

   Todoos  
```` 

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### PARAMETERS 
    -UseHomeREADME  
        Use README in PowerShell profile directory  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UseOneDriveREADME  
        Use README in OneDrive directory  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	VSCode 
```PowerShell 

   VSCode  
```` 

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <string[]> [-Copilot] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilePath <string[]>  
        The path to the file to open in VSCode  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> gitchanged  
```` 

### SYNOPSIS 
    Get the list of changed files in a Git repository.  

### SYNTAX 
```PowerShell 
Get-GitChangedFiles [-PassThru] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the list of files that have been changed in the current Git repository.  
    It can be used to identify which files have been modified, added, or deleted.  
    By default, returns relative paths with .\ prefix. Use -PassThru to get FileInfo objects.  

### PARAMETERS 
    -PassThru [<SwitchParameter>]  
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GitCommit 
```PowerShell 

   New-GitCommit                        --> commit  
```` 

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <string>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Title <string>  
        The commit message title to use  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	PermanentlyDeleteGitFolders 
```PowerShell 

   PermanentlyDeleteGitFolders  
```` 

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Folders <string[]>  
        Array of folder paths to permanently remove  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RepoUri <string>  
        The URI of the Git repository to clean  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 

##	Add-MissingGenXdevUnitTests 
```PowerShell 

   Add-MissingGenXdevUnitTests  
```` 

### SYNTAX 
```PowerShell 
Add-MissingGenXdevUnitTests [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevCmdlet 
```PowerShell 

   Assert-GenXdevCmdlet                 --> improvecmdlet  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <string>] [[-PromptKey]
    <string>] [[-Prompt] <string>] [-ModuleName <string[]>]
    [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code]
    [-VisualStudio] [-EditPrompt] [-Integrate]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -Code  
        Open in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           PromptKey  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Integrate  
        Integrate cmdlet into module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip local module versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Only include published versions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <string> [[-Prompt]
    <string>] [[-PromptKey] <string>] [-EditPrompt]
    [-AssertFailedTest] [-FromScripts]
    [-ContinuationHandled] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AssertFailedTest  
        Indicates to assert a failed test  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        The name of the cmdlet to improve unit-tests for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ContinuationHandled  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
```` 

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <string[]>]
    [-FromScripts] [<CommonParameters>] 
```` 

### PARAMETERS 
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        Filter to apply to module names  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> rungenxdevtests  
```` 

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
```` 

### PARAMETERS 
    -AllowLongRunningTests  
        Also selects unit-tests that have long running durations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -DefinitionMatches <string>  
        Regular expression to match cmdlet definitions  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExactMatch  
        Require exact matches for cmdlet names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeScripts  
        Includes the scripts directory in addition to regular modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Only search in published module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyReturnModuleNames  
        Only return unique module names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipModuleImports  
        Skips importing GenXdev modules before testing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           ModuleName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipPSAnalyzerTests  
        Skips invoking PSAnalyzer tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipPesterTests  
        Skips invoking Pester tests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StackTraceVerbosity <string>  
        Stack trace detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TestFailedAction <string>  
        Action to take when a test fails. Options: Ask, Continue, Stop, SolveWithAI, Write-Error, Throw  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Verbosity <string>  
        Output detail level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
```` 

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <string> [-Prompt
    <string>] [-EditPrompt] [<CommonParameters>] 
```` 

### PARAMETERS 
    -EditPrompt  
        Switch to only edit the AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        The name of the module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        The AI prompt  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
```` 

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <string> [[-RefactorSettings]
    <RefactorSettings>] [-AllowLongRunningTests]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllowLongRunningTests  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        The path to the source file to improve  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RefactorSettings <RefactorSettings>  
        The refactor definition containing settings and prompt template  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
```` 

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Complete-GenXDevREADME 
```PowerShell 

   Complete-GenXDevREADME  
```` 

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        The name(s) of the module(s) to complete the README for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureCopilotKeyboardShortCut 
```PowerShell 

   EnsureCopilotKeyboardShortCut  
```` 

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	EnsureDefaultGenXdevRefactors 
```PowerShell 

   EnsureDefaultGenXdevRefactors  
```` 

### SYNTAX 
```PowerShell 
EnsureDefaultGenXdevRefactors [-Force] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Force  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXdevCmdletUsageAnalysis 
```PowerShell 

   Get-GenXdevCmdletUsageAnalysis  
```` 

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] {Table |
    List | CSV}] [[-Top] <int>] [-IncludeCallChains]
    [-IncludeScripts] [<CommonParameters>] 
```` 

### PARAMETERS 
    -IncludeCallChains  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OutputFormat <string>  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top <int>  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <string>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        The root path to search for GenXdev modules  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      RootPath, FullPath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevModuleInfo 
```PowerShell 

   Get-GenXDevModuleInfo  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        Names of modules to analyze  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-GenXDevNewModulesInOrderOfDependency 
```PowerShell 

   Get-GenXDevNewModulesInOrderOfDependency  
```` 

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName]
    <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ModuleName <string[]>  
        One or more module names to filter by  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown  
```` 

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <string[]>]
    [[-CommandNames] <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -CommandNames <string[]>  
        Optional cmdlet names to filter which to document  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -ModuleName <string[]>  
        The name(s) of the module(s) to generate help for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, Module  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactors  
```` 

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <string[]>] [-PreferencesDatabasePath
    <string>] [-DefaultValue <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        Pattern(s) to search for refactor definitions  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
```` 

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <string[]>]
    [-PreferencesDatabasePath <string>] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-AsText]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AsText  
        Output report in text format instead of Hashtable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        If set, clear the session cache before running.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Specifies the path to the preferences database file.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        If set, only use the session cache for refactor data.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        If set, skip loading session cache.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
```` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <string> [-Settings
    <Object>] [-Range <int[]>] [-Recurse]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        Specifies the path to the script file to format.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Name, FullName, ImagePath, FileName, ScriptFileName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Range <int[]>  
        The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Recurse  
        Recursively process files in subdirectories.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
```` 

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-Path] <string> [-EnableExit]
    [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]
Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string>
    [-EnableExit] [-Fix] [-Recurse] [-ReportSummary]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -EnableExit  
        Specifies that the tool should exit on error.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Fix  
        Enables automatic fixing of violations.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string>  
        Specifies the path to the script file.  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           Path  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Recurse  
        Recursively process files.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReportSummary  
        Reports a summary after analysis.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ScriptDefinition <string>  
        Specifies the script definition as a string.  
        Required?                    true  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           Script  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
```` 

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <string> [[-Synopsis]
    <string>] [[-Description] <string>] [[-BaseModuleName]
    <string>] [[-ModuleName] <string>] [[-CmdletAliases]
    <string[]>] [[-PromptKey] <string>] [[-Prompt] <string>]
    [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        The name of the cmdlet to create (must use approved verb)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      cmd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev sub module  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-GenXdevModule 
```PowerShell 

   New-GenXdevModule  
```` 

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <string> [-Description]
    <string> [[-Tags] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        Description of the module's functionality  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Name of the module to create (must follow GenXdev.* pattern)  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Tags <string[]>  
        Tags for module discovery (no whitespace allowed)  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-PullRequestForGenXdevModuleChanges 
```PowerShell 

   New-PullRequestForGenXdevModuleChanges --> prgenxdevmodule  
```` 

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
    [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend
    <string[]>] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Bottom  
        Places window on bottom half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Centers window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CommitMessage <string>  
        Message for the commit  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GitUserEmail <string>  
        Git email for commits  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -GitUserName <string>  
        Git username for commits  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Window height in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Places window on left half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string>  
        Name of the GenXdev module  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes window borders and title bar for a cleaner appearance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns window helper object for further manipulation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PullRequestDescription <string>  
        Description for the pull request  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PullRequestTitle <string>  
        Title for the pull request  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Returns focus to PowerShell window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Places window on right half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the window to foreground after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Maximizes window to fill entire screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Places windows side by side with PowerShell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Places window on top half of screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Window width in pixels for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        Window horizontal position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        Window vertical position for positioning applications  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-Refactor 
```PowerShell 

   New-Refactor                         --> newrefactor  
```` 

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
```` 

### PARAMETERS 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoAddModifiedFiles  
        Will automatically add modified files to the queue  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        Open files in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions for LLM tools  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Array of files to process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send after opening files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name of this new refactor set  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom prompt text to override the template  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionPrompt <string>  
        LLM selection guidance prompt  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionScript <string>  
        Powershell script for selecting items to refactor  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-GenXdevCmdletsContainingClipboardTextInIde 
```PowerShell 

   Open-GenXdevCmdletsContainingClipboardTextInIde --> vscodesearch  
```` 

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde
    [[-InputObject] <string>] [-Copilot]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Copilot  
        Add sourcefile to Copilot edit-session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <string>  
        Search for clipboard text in all GenXdev scripts  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
```` 

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <string[]> [[-RemoveDefault]]
    [-PreferencesDatabasePath <string>] [-DefaultValue
    <string>] [-SessionOnly] [-ClearSession] [-SkipSession]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ClearSession  
        Clear the session setting (Global variable) before retrieving  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DefaultValue <string>  
        The default value if preference is not found  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      DefaultPreference  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      PreferenceName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RemoveDefault  
        Switch to also remove the standard refactor set  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           All  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Dont use alternative settings stored in session for Data preferences like Language, Database paths, etc  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-GenXdevCmdlet 
```PowerShell 

   Search-GenXdevCmdlet                 --> searchcmdlet  
```` 

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <string>] [[-ModuleName]
    <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts]
    [-Code] [-VisualStudio] [-EditCmdlet]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -Code  
        Open the found cmdlet in Visual Studio Code  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditCmdlet  
        Also opens the file in the editor after finding  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Search in script files instead of module files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, BaseModuleName, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NoLocal  
        Skip searching in local module paths  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Limit search to published module paths only  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open the found cmdlet in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> cmdlet, editcmdlet  
```` 

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
```` 

### PARAMETERS 
    -BaseModuleName <string>  
        Integrate the new cmdlet into an existing GenXdev module  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ChangedirectoryOnly  
        When specified, only changes the current PowerShell location\r\nthe respective Cmdlet directory  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cd  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletAliases <string[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CmdletName <string>  
        Search pattern to filter cmdlets  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Filter, CmdLet, Cmd, FunctionName, Name  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -CoPilot  
        Add to Co-Pilot edit session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        A detailed description of what the cmdlet does  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EditPrompt  
        Only edit the AI prompt without creating the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FromScripts  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        The keys to send  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModuleName <string[]>  
        GenXdev module names to search  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Module, SubModuleName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -New  
        Create a new cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoLocal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPublished  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        Custom AI prompt text to use for cmdlet generation  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The AI prompt key to use for template selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Search  
        Also global search for the cmdlet  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Synopsis <string>  
        A brief description of the cmdlet's purpose  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           New  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -UnitTests  
        Show the function's unit-tests instead of the function  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
```` 

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <string> [<CommonParameters>] 
```` 

### PARAMETERS 
    -Psm1FilePath <string>  
        Path to the .psm1 file to split into functions  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Path  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-NextRefactor 
```PowerShell 

   Start-NextRefactor                   --> nextrefactor  
```` 

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <string[]>] [[-FilesToAdd]
    <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>]
    [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections]
    [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ResetLMSelections  
        Restart all LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Test-RefactorLLMSelection 
```PowerShell 

   Test-RefactorLLMSelection  
```` 

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition]
    <RefactorDefinition> [-Path] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Path <string>  
        The path to the source file to evaluate  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RefactorDefinition <RefactorDefinition>  
        The refactor definition containing LLM settings  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Update-Refactor 
```PowerShell 

   Update-Refactor                      --> updaterefactor  
```` 

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
```` 

### PARAMETERS 
    -ApiEndpoint <string>  
        The API endpoint URL for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApiKey <string>  
        The API key for authenticated AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AskBeforeLLMSelection  
        Switch to suppress user interaction  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles  
        Clean up deleted files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Clear  
        Clear all files from the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearLog  
        Clear the log of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Code  
        The ide to open the file in  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Cpu <int>  
        The number of CPU cores to dedicate to AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell command definitions to use as tools during LLM selection  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Filenames to add  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Filenames to remove  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force stop LM Studio before initialization  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Gpu <int>  
        How much to offload to the GPU. If 'off', GPU offloading is disabled. If 'max', all layers are offloaded to GPU. If a number between 0 and 1, that fraction of layers will be offloaded to the GPU. -1 = LM Studio will decide how much to offload to the GPU. -2 = Auto  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <string>  
        The LM Studio specific model identifier  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ModelLMSGetIdentifier  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        The keys to invoke as key strokes after opening the file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      keys  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -LLMQueryType <string>  
        The type of LLM query  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MarkAllCompleted  
        Mark all files as refactored  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxToken <int>  
        The maximum number of tokens to use in AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Model <string>  
        The model identifier or pattern to use for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        The name of the refactor, accepts wildcards  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           Name  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -PerformAISelections  
        Switch to process all files in the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      PerformAllLLMSelections  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PerformAutoSelections  
        Switch to enable LLM-based file selection processing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <string>  
        Database path for preference data files  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DatabasePath  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Priority <int>  
        Priority for this refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Prompt <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PromptKey <string>  
        The prompt key indicates which prompt script to use  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RedoLast  
        Redo the last refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Refactor <RefactorDefinition[]>  
        The refactor set to update  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           Refactor  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReprocessModifiedFiles  
        Automatically reprocess files modified since last update  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      AutoAddModifiedFiles  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Reset  
        Start from the beginning of the refactor set  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ResetLMSelections  
        Restart all LLMSelections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RetryFailedLLMSelections  
        Switch to retry failed LLM selections  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByCreationDateFrom <datetime>  
        Select files by creation date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByCreationDateTo <datetime>  
        Select files by creation date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam  
        Select configuration by available GPU RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByFreeRam  
        Select configuration by available system RAM  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByModifiedDateFrom <datetime>  
        Select files by modified date from  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectByModifiedDateTo <datetime>  
        Select files by modified date to  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionPrompt <string>  
        If provided, will invoke LLM to do the selection based on the content of the script  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SelectionScript <string>  
        Powershell script for function to select items to refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Speak  
        Speak out the details of next refactor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TTLSeconds <int>  
        Time-to-live in seconds for API-loaded models  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Temperature <double>  
        Temperature for response randomness (0.0-1.0)  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        The timeout in seconds for AI operations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VisualStudio  
        Open in Visual Studio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      vs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
