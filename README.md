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
     * Create new cmdlets with proper structure and validation using `New-GenXdevCmdlet`
     * Run and manage unit tests with `Assert-GenXdevTest`

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
| [Add-ReleaseNoteLineToREADME](#add-releasenotelinetoreadme) | ReleaseNote | Adds a ReleaseNote line to the README file with a timestamp. |
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
| [Get-GitChangedFiles](#get-gitchangedfiles) | Get-GitChangedFile, gitchanged | Get the list of changed files in a Git repository. |
| [New-GitCommit](#new-gitcommit) | commit | Creates and pushes a new git commit with all changes. |
| [PermanentlyDeleteGitFolders](#permanentlydeletegitfolders) | &nbsp; | Permanently deletes specified folders from all branches in a Git repository. |

### GenXdev.Coding.PowerShell.Modules
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-MissingGenXdevUnitTests](#add-missinggenxdevunittests) | &nbsp; | &nbsp; |
| [Assert-GenXdevCmdlet](#assert-genxdevcmdlet) | improvecmdlet | Improves GenXdev cmdlet documentation and implementation through AI assistance. |
| [Assert-GenXdevCmdletTests](#assert-genxdevcmdlettests) | improvecmdlettests | Asserts and improves unit-tests of a specified GenXdev cmdlet. |
| [Assert-GenXdevDependencyUsage](#assert-genxdevdependencyusage) | checkgenxdevdependencies | &nbsp; |
| [Assert-GenXdevTest](#assert-genxdevtest) | Assert-GenXdevUnitTest, rungenxdevtests, testcmdlet | &nbsp; |
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
| [Get-ModuleHelpMarkdown](#get-modulehelpmarkdown) | Get-GenXDevModuleHelp | Generates markdown help documentation for specified GenXDev modules. |
| [Get-Refactor](#get-refactor) | refactor, refactors, Show-RefactorReport | Retrieves refactor definitions from GenXdev preferences based on name patterns. |
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
| [Show-GenXdevCmdLetInIde](#show-genxdevcmdletinide) | editcmdlet | Opens the specified GenXdev cmdlet in Visual Studio Code. |
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

### SYNOPSIS 
    Adds a feature line to the README file with a timestamp.  

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a feature line to the specified README file, prefixed with the current date  
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.  

### PARAMETERS 
    -Line <String>  
        The feature description text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to format the line as code in the README file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the README file after adding the line.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use the README file in the home directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use the README file in the OneDrive directory.  
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
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
```` 

### SYNOPSIS 
    Adds an idea item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped idea to the "## Ideas" section of a README.md file.  
    Can display the modified section and open in Visual Studio Code.  

### PARAMETERS 
    -Line <String>  
        The idea text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
```` 

### SYNOPSIS 
    Adds an issue item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped issue to the "## Issues" section of a README.md file.  
    Can display the modified section and open in Visual Studio Code.  

### PARAMETERS 
    -Line <String>  
        The issue text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
```` 

### SYNOPSIS 
    Adds a line to a README.md markdown file in a specified section.  

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <String>] [-Section] <String> [-Prefix] <String> [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Finds and modifies a README.md file by adding a new line to a specified section.  
    Can create the section if it doesn't exist. Supports formatting lines as code  
    blocks and showing the modified section.  
    Will look in current directory first, then walk up directories to find the README  
    location. If not found, will use the README in the PowerShell profile directory.  

### PARAMETERS 
    -Line <String>  
        The line of text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Section <String>  
        The section header where the line should be added.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prefix <String>  
        The prefix to add before the line (default: "* ").  
        Required?                    true  
        Position?                    3  
        Default value                *  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to open the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Done [<SwitchParameter>]  
        Switch to mark a todo item as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use README in PowerShell profile directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use README in OneDrive directory.  
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
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> ReleaseNote  
```` 

### SYNOPSIS 
    Adds a ReleaseNote line to the README file with a timestamp.  

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a ReleaseNote line to the specified README file, prefixed with the current date  
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.  

### PARAMETERS 
    -Line <String>  
        The ReleaseNote description text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to format the line as code in the README file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the README file after adding the line.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use the README file in the home directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use the README file in the OneDrive directory.  
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
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
```` 

### SYNOPSIS 
    Adds a todo item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <String>] [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped todo item to the "## Todoos" section of a README.md file.  
    The todo items can be marked as done and the modified section can be displayed.  
    Each new todo item is automatically timestamped unless marking as done.  

### PARAMETERS 
    -Line <String>  
        The todo item text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Done [<SwitchParameter>]  
        Marks the specified todo item as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
```` 

### SYNOPSIS 
    Installs and configures Visual Studio Code with recommended extensions.  

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Checks if Visual Studio Code is installed and if not, installs it using WinGet.  
    Configures user settings, keybindings, and installs recommended extensions from  
    the workspace configuration. Also sets up PSGallery as a trusted repository and  
    configures specific extension settings.  

### PARAMETERS 
    -Force [<SwitchParameter>]  
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
 

##	Features 
```PowerShell 

   Features  
```` 

### SYNOPSIS 
    Displays features from a README.md file.  

### SYNTAX 
```PowerShell 
Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all features from the "## Features" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Ideas 
```PowerShell 

   Ideas  
```` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Issues 
```PowerShell 

   Issues  
```` 

### SYNOPSIS 
    Displays issues from a README.md file.  

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all issues from the "## Issues" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
```` 

### SYNOPSIS 
    Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio).  

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <String> [[-LineNo] <Int32>] [[-KeysToSend] <String[]>] [-Code] [-VisualStudio] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function opens a specified source file in either Visual Studio Code or  
    Visual Studio. It can navigate directly to a specific line number and optionally  
    send keyboard inputs to the IDE after opening the file. The function will  
    attempt to determine which IDE to use based on the current host process, running  
    applications, or user selection.  

### PARAMETERS 
    -Path <String>  
        The path to the source file that should be opened in the IDE. Accepts both  
        relative and absolute paths, as well as paths with environment variables.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -LineNo <Int32>  
        The line number to navigate to when opening the file. Default is 0, which opens  
        the file without positioning to a specific line.  
        Required?                    false  
        Position?                    2  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Array of keyboard inputs to send to the application after opening. The function  
        will wait 2 seconds before sending the keys to ensure the IDE has loaded.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch parameter to force opening the file in Visual Studio Code regardless  
        of the current host process or other running IDEs.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Switch parameter to force opening the file in Visual Studio regardless of the  
        current host process or other running IDEs.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        When specified, escapes special characters so they are sent as literal text  
        instead of being interpreted as control sequences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Prevents returning keyboard focus to PowerShell after sending keys.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Sends Shift+Enter instead of regular Enter for line breaks.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Adds delay between sending different key sequences. Useful for slower apps.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Displays ReleaseNotes from a README.md file.  

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all ReleaseNotes from the "## ReleaseNotes" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Todoos 
```PowerShell 

   Todoos  
```` 

### SYNOPSIS 
    Displays todo items from a README.md file.  

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all todo items from the "## Todoos" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	VSCode 
```PowerShell 

   VSCode  
```` 

### SYNOPSIS 
    Opens one or more files in Visual Studio Code.  

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <String[]> [-Copilot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function takes file paths and opens them in Visual Studio Code. It expands  
    paths and validates file existence before attempting to open them. The function  
    supports both direct file paths and pipeline input, making it ideal for quickly  
    opening multiple files from terminal searches.  

### PARAMETERS 
    -FilePath <String[]>  
        One or more file paths to open in Visual Studio Code. Accepts pipeline input  
        and wildcard patterns.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Copilot [<SwitchParameter>]  
        When specified, opens the file and triggers the Copilot keyboard shortcut to  
        start an edit session.  
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
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> Get-GitChangedFile, gitchanged  
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

### SYNOPSIS 
    Creates and pushes a new git commit with all changes.  

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <String>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Stages all changes in the current git repository, creates a commit with the  
    specified title, and pushes the changes to the remote origin. Automatically sets  
    up upstream tracking if needed.  

### PARAMETERS 
    -Title <String>  
        The message to use for the git commit. If not specified, defaults to  
        "Improved scripts".  
        Required?                    false  
        Position?                    1  
        Default value                Improved scripts  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Permanently deletes specified folders from all branches in a Git repository.  

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <String> [-Folders] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Cleans a Git repository by removing specified folders from the entire commit  
    history across all branches. This is done by cloning the repository, using  
    git filter-branch to remove the folders, and force pushing the changes back.  
    This operation is destructive and permanently rewrites Git history.  

### PARAMETERS 
    -RepoUri <String>  
        The Git repository URI to clean (HTTPS or SSH format).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Folders <String[]>  
        Array of folder paths to remove from the repository history. Paths can be  
        specified with forward or back slashes.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
```PowerShell 

       This operation is destructive and cannot be undone. It rewrites Git history and  
       requires force pushing, which affects all repository users.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> PermanentlyDeleteGitFolders `  
       -RepoUri "https://github.com/user/repo.git" `  
       -Folders "bin", "obj"  
```` 

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

### SYNOPSIS 
    Improves GenXdev cmdlet documentation and implementation through AI assistance.  

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <String>] [-ModuleName <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditPrompt] [-Integrate] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function enhances GenXdev cmdlets by analyzing and improving their code  
    through AI prompts. It can integrate cmdlets into modules, update documentation,  
    and verify proper implementation. The function supports custom prompt templates  
    and can open files in Visual Studio Code or Visual Studio.  

### PARAMETERS 
    -CmdletName <String>  
        The name or search pattern of the cmdlet to improve. Supports wildcards.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -PromptKey <String>  
        The key identifying which AI prompt template to use for improvements.  
        Required?                    false  
        Position?                    2  
        Default value                CheckAllRequirements  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom prompt text to override the template prompt.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoLocal [<SwitchParameter>]  
        Skip searching local module versions.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Only search published module versions.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files rather than module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the cmdlet in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Opens the cmdlet in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        Only edit the AI prompt template without processing the cmdlet.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Integrate [<SwitchParameter>]  
        Integrate the cmdlet into a module if it's currently a standalone script.  
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
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
```` 

### SYNOPSIS 
    Asserts and improves unit-tests of a specified GenXdev cmdlet.  

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <String> [[-Prompt] <String>] [[-PromptKey] <String>] [-EditPrompt] [-AssertFailedTest] [-FromScripts] [-ContinuationHandled] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function helps maintain and improve unit tests for GenXdev cmdlets by:  
    1. Creating test files if they do not exist  
    2. Opening the cmdlet in VS Code  
    3. Preparing and applying AI prompts for test generation/improvement  
    4. Managing test execution workflow  

### PARAMETERS 
    -CmdletName <String>  
        The name of the cmdlet to improve unit-tests for. Required.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to use for test generation. Optional.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        Switch to only edit the AI prompt without modifying the cmdlet. Optional.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AssertFailedTest [<SwitchParameter>]  
        Switch to indicate assertion of a failed test. Optional.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContinuationHandled [<SwitchParameter>]  
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
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
```` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>] [-FromScripts] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
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
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> Assert-GenXdevUnitTest, rungenxdevtests, testcmdlet  
```` 

### SYNOPSIS 
    Executesunit tests for GenXdev modules, sub-modules, or cmdlets  
    with intelligent debugging and AI-powered error resolution.  

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <String>] [[-TestFailedAction] <String>] [[-DefinitionMatches] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch] [-Verbosity <String>] [-StackTraceVerbosity <String>] [-AllowLongRunningTests] [-SkipModuleImports] [-SkipPSAnalyzerTests] [-SkipPesterTests] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a testing framework for GenXdev modules,  
    offering multi-level test execution from entire modules down to individual  
    cmdlets. It integrates PSScriptAnalyzer for static code analysis, Pester for  
    unit testing, and Get-Help validation for documentation compliance. The  
    function includes intelligent error handling with AI-powered resolution  
    capabilities and detailed progress reporting for development workflows.  

### PARAMETERS 
    -CmdletName <String>  
        Search pattern to filter cmdlets for testing. Supports wildcards and allows  
        targeting specific cmdlets or groups of cmdlets matching the pattern.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -TestFailedAction <String>  
        Action to take when a test fails. Options include interactive prompting,  
        automatic continuation, stopping execution, AI-powered resolution, error  
        logging, or exception throwing for integration scenarios.  
        Required?                    false  
        Position?                    2  
        Default value                Continue  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefinitionMatches <String>  
        Regular expression to match cmdlet definitions during the search process.  
        This allows for advanced filtering based on cmdlet implementation patterns.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -ModuleName <String[]>  
        GenXdev module names to search and test. Must follow the pattern starting  
        with 'GenXdev' followed by optional sub-module components. Supports wildcards  
        for broad module selection.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Skip searching in local module paths during cmdlet discovery. When specified,  
        only published module paths will be considered for testing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Limit search to published module paths only. This excludes local development  
        modules and focuses on officially published GenXdev modules.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files. This allows testing of  
        standalone PowerShell scripts within the GenXdev ecosystem.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeScripts [<SwitchParameter>]  
        Include the scripts directory in addition to regular modules. This expands  
        the test scope to cover both modular and script-based functionality.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyReturnModuleNames [<SwitchParameter>]  
        Return only unique module names instead of full cmdlet details. Useful for  
        discovery and inventory operations rather than detailed testing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExactMatch [<SwitchParameter>]  
        Require exact matches for cmdlet names rather than wildcard matching. This  
        provides precise targeting for specific cmdlet testing scenarios.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Verbosity <String>  
        Output detail level for test execution. Controls the amount of information  
        displayed during test runs, from minimal to diagnostic output.  
        Required?                    false  
        Position?                    named  
        Default value                Normal  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -StackTraceVerbosity <String>  
        Stack trace detail level for error reporting. Determines how much call stack  
        information is included when errors occur during testing.  
        Required?                    false  
        Position?                    named  
        Default value                FirstLine  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AllowLongRunningTests [<SwitchParameter>]  
        Include unit tests that have long running durations in the test execution.  
        This enables testing including performance and integration tests.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipModuleImports [<SwitchParameter>]  
        Skip importing GenXdev modules before testing. This is useful when modules  
        are already loaded or when testing specific module loading scenarios.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipPSAnalyzerTests [<SwitchParameter>]  
        Skip invoking PSScriptAnalyzer tests during the test execution. This allows  
        focusing solely on functional testing when static analysis is not required.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipPesterTests [<SwitchParameter>]  
        Skip invoking Pester tests during the test execution. This allows focusing  
        solely on static analysis when functional testing is not required.  
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
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
```` 

### SYNOPSIS 
    Assists in refactoring PowerShell source code files using AI assistance.  

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <String> [-Prompt <String>] [-EditPrompt] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the process of refactoring PowerShell code using AI.  
    It manages prompt templates, detects the active IDE (VS Code or Visual Studio),  
    and orchestrates the refactoring workflow through keyboard automation.  
    The function can handle both module manifest (.psd1) and module script (.psm1)  
    files.  

### PARAMETERS 
    -ModuleName <String>  
        The name of the PowerShell module to refactor. This module must be available  
        in the PowerShell module path.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to use for the refactoring process. If not specified,  
        defaults to an error message if module loading fails.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        When enabled, only opens the prompt template for editing without executing the  
        actual refactoring process.  
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
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
```` 

### SYNOPSIS 
    Executes a refactoring operation on a source file using the specified IDE and  
    AI prompt template.  

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <String> [[-RefactorSettings] <RefactorSettings>] [-AllowLongRunningTests] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the refactoring process by preparing an AI prompt based  
    on the refactor definition, detecting or selecting the appropriate IDE (VS Code  
    or Visual Studio), and opening the target file with the prepared prompt. The  
    function handles prompt template processing, IDE detection, and automation of  
    the refactoring workflow.  

### PARAMETERS 
    -Path <String>  
        The absolute or relative path to the source file that needs to be refactored.  
        The path will be expanded to an absolute path during processing.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RefactorSettings <RefactorSettings>  
        Required?                    false  
        Position?                    2  
        Default value                [GenXdev.Helpers.RefactorSettings]::new()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AllowLongRunningTests [<SwitchParameter>]  
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
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
```` 

### SYNOPSIS 
    Cleans build artifacts from GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
```` 

### DESCRIPTION 
    Removes build directories and artifacts from all GenXdev PowerShell modules in  
    the user's PowerShell Modules directory. Cleans both module root directories and  
    version-specific subdirectories, removing bin, obj, trash and other build  
    artifacts.  

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

### SYNOPSIS 
    Completes the README file for specified GenXDev modules by adding documentation.  

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function enhances README.md files for GenXDev modules by automatically  
    generating and inserting a cmdlet index and detailed cmdlet documentation. For  
    individual modules, it processes and updates existing README.md files with a  
    standardized format including a command index and detailed help for each cmdlet.  
    For the main GenXdev module, it creates a concise overview with links to GitHub  
    repositories instead of concatenating full module content, preventing the README  
    from becoming too large for parsers. Cmdlet indexes link to the corresponding  
    sections in the GitHub repository's README files.  

### PARAMETERS 
    -ModuleName <String[]>  
        Specifies which module(s) to process. If omitted, all modules will be processed.  
        Can accept multiple module names and supports pipeline input. Accepts string  
        array input.  
        Required?                    false  
        Position?                    1  
        Default value                @("GenXdev*")  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code.  

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function ensures that GitHub Copilot Chat's file attachment feature has a proper  
    keyboard shortcut (Ctrl+Shift+Alt+F12) configured in Visual Studio Code.  
    It will remove any existing Copilot attachment shortcuts and replace them with the  
    current correct command (github.copilot.chat.attachFile).  
    Also adds Alt+` (backtick) shortcut for toggling the maximized panel.  

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

### SYNOPSIS 
    Analyzes GenXdev cmdlet usage patterns to identify most frequently called functions.  

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] <String>] [[-Top] <Int32>] [-IncludeCallChains] [-IncludeScripts] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This script uses Get-GenXDevCmdlet to scan all GenXdev PowerShell modules and their  
    functions to analyze which cmdlets are called most frequently by other cmdlets.  
    This helps prioritize which functions to refactor to C# first, starting with the  
    most commonly used ones.  

### PARAMETERS 
    -OutputFormat <String>  
        Format for output: Table, List, or CSV. Default is Table.  
        Required?                    false  
        Position?                    1  
        Default value                Table  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top <Int32>  
        Number of top results to show. Default is 50.  
        Required?                    false  
        Position?                    2  
        Default value                50  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeCallChains [<SwitchParameter>]  
        Include detailed call chain information showing which functions call which.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeScripts [<SwitchParameter>]  
        Include script files in addition to module cmdlets.  
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
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
```` 

### SYNOPSIS 
    Retrieves all GenXDev modules from a specified path.  

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <String>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function searches through a directory structure for GenXdev modules,  
    excluding any with '.local' in the name. For each valid module found, it returns  
    the most recent version folder (1.x) that contains a valid module manifest  
    (.psd1) file.  

### PARAMETERS 
    -Path <String>  
        The root directory to search for GenXdev modules. If not specified, defaults to  
        the parent directory of the script's location.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Retrieves GenXDev modules in dependency order.  

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function returns a list of GenXDev modules arranged in the correct dependency  
    order to ensure proper module loading. It first retrieves all module information  
    and then orders them based on their dependencies, starting with core modules and  
    ending with dependent modules. This ensures modules are loaded in the correct  
    sequence.  

### PARAMETERS 
    -ModuleName <String[]>  
        One or more module names to filter the results. If not provided, all modules are  
        returned in their dependency order. The function will maintain the correct  
        dependency chain even when filtering specific modules.  
        Required?                    false  
        Position?                    1  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown               --> Get-GenXDevModuleHelp  
```` 

### SYNOPSIS 
    Generates markdown help documentation for specified GenXDev modules.  

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <String[]>] [[-CommandNames] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function generates markdown help documentation for specified GenXDev modules  
    and their cmdlets. It processes each module and cmdlet, formatting the help  
    content into markdown with proper sections and code blocks. The output includes  
    syntax highlighting for PowerShell code blocks and proper formatting for  
    different help sections.  

### PARAMETERS 
    -ModuleName <String[]>  
        Specifies the name(s) of the module(s) to generate help for. Accepts wildcards.  
        If not specified, defaults to "GenXdev.*". Can be provided via pipeline.  
        Required?                    false  
        Position?                    1  
        Default value                GenXdev.*  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -CommandNames <String[]>  
        Optional array of cmdlet names to filter which commands to generate help for.  
        If not specified, documentation will be generated for all cmdlets in the module.  
        Supports wildcard patterns like "Get-*".  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactor, refactors, Show-RefactorReport  
```` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath <String>] [-DefaultValue <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
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
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
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
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
```` 

### SYNOPSIS 
    Generates a detailed report of refactoring operations and their status.  

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <String[]>] [-PreferencesDatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-AsText] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Analyzes and reports on the progress of refactoring operations by examining  
    their current state, completion status, and affected functions. Provides output  
    in either structured hashtable format or human-readable aligned text columns.  
    The report includes refactor name, prompt key, priority, status, function count  
    and completion percentage.  

### PARAMETERS 
    -Name <String[]>  
        The name pattern to filter refactors. Supports wildcards. Multiple names can be  
        specified. Default value is "*" to display all refactors.  
        Required?                    false  
        Position?                    1  
        Default value                *  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AsText [<SwitchParameter>]  
        Outputs the report in human-readable text format with aligned columns instead of  
        structured hashtable objects. The text format includes headers and separators.  
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
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
```` 

### SYNOPSIS 
    Formats PowerShell script files using PSScriptAnalyzer formatting rules.  

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <String> [-Settings <Object>] [-Range <Int32[]>] [-Recurse] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function applies PowerShell formatting rules to script files using  
    PSScriptAnalyzer's Invoke-Formatter cmdlet. It can process individual files or  
    recursively format multiple files in directories. The function uses customizable  
    formatting settings and provides detailed logging of the formatting process.  

### PARAMETERS 
    -Path <String>  
        Specifies the path to the script file or directory to format. Accepts pipeline  
        input and supports various path aliases for compatibility.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains  
        the formatting settings. If not specified, the function will attempt to load  
        settings from a predefined location or use built-in defaults.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Range <Int32[]>  
        The range within which formatting should take place as an array of four integers:  
        starting line number, starting column number, ending line number, ending column  
        number. If not specified, the entire file will be formatted.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Recurse [<SwitchParameter>]  
        Recursively process files in subdirectories when the Path parameter points to  
        a directory.  
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
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
```` 

### SYNOPSIS 
    Invokes PowerShell Script Analyzer to analyze PowerShell scripts for compliance  
    and best practices.  

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-Path] <String> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]  
   Invoke-GenXdevScriptAnalyzer -ScriptDefinition <String> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a wrapper around PSScriptAnalyzer to analyze PowerShell  
    scripts for compliance issues, best practices violations, and potential bugs.  
    It supports both file-based analysis and string-based script analysis with  
    customizable rules and settings.  

### PARAMETERS 
    -Path <String>  
        Specifies the path to the script file to analyze. This parameter is mandatory  
        when using the Path parameter set.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ScriptDefinition <String>  
        Specifies the script definition as a string to analyze. This parameter is  
        mandatory when using the Script parameter set.  
        Required?                    true  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableExit [<SwitchParameter>]  
        Specifies that the tool should exit on error during analysis.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fix [<SwitchParameter>]  
        Enables automatic fixing of violations where possible.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Recurse [<SwitchParameter>]  
        Recursively processes files in subdirectories when analyzing a directory path.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReportSummary [<SwitchParameter>]  
        Reports a summary after analysis showing the total number of issues found.  
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
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
```` 

### SYNOPSIS 
    Creates a new GenXdev PowerShell cmdlet with proper structure and validation.  

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <String> [[-Synopsis] <String>] [[-Description] <String>] [[-BaseModuleName] <String>] [[-ModuleName] <String>] [[-CmdletAliases] <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new PowerShell cmdlet following GenXdev standards, including parameter  
    validation, help documentation, and proper verb-noun naming convention. Validates  
    the verb against approved PowerShell verbs and ensures proper casing of both verb  
    and noun components. Can integrate new cmdlets into existing module structures.  

### PARAMETERS 
    -CmdletName <String>  
        The name of the cmdlet to create. Must follow the Verb-Noun format using an  
        approved PowerShell verb.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Synopsis <String>  
        A brief description of the cmdlet's purpose for help documentation.  
        Required?                    false  
        Position?                    2  
        Default value                todo: A brief description of the cmdlet's purpose  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        A detailed description of what the cmdlet does for help documentation.  
        Required?                    false  
        Position?                    3  
        Default value                todo: [A detailed description of what the cmdlet does]  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -BaseModuleName <String>  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ModuleName <String>  
        The name of the base GenXdev module to integrate the cmdlet into.  
        Must match pattern GenXdev or GenXdev.SubModule.  
        Required?                    false  
        Position?                    5  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CmdletAliases <String[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    6  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        The AI prompt key used to select a template for generating the cmdlet content.  
        Defaults to "NewGenXdevCmdLet".  
        Required?                    false  
        Position?                    7  
        Default value                NewGenXdevCmdLet  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to guide the generation of the cmdlet content.  
        Required?                    false  
        Position?                    8  
        Default value                Create a boilerplate GenXdev cmdlet that does what it's name suggests  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        When specified, only opens the AI prompt for editing without creating the cmdlet.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a new GenXdev PowerShell module with proper structure and configuration.  

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <String> [-Description] <String> [[-Tags] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new PowerShell module following GenXdev standards by:  
    - Generating module manifest (psd1) with proper metadata  
    - Creating module script file (psm1)  
    - Setting up directory structure for functions and tests  
    - Adding required files like LICENSE and README  
    - Configuring version info and dependencies  

### PARAMETERS 
    -ModuleName <String>  
        The name of the module to create. Must follow GenXdev naming convention starting  
        with 'GenXdev.' followed by module identifier (e.g. GenXdev.Tools).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        A brief description of the module's purpose and functionality. This will be used  
        in the module manifest and documentation.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Tags <String[]>  
        Optional array of tags for module discovery in PowerShell Gallery. Tags cannot  
        contain whitespace. Defaults to 'GenXdev'.  
        Required?                    false  
        Position?                    3  
        Default value                @('GenXdev')  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a pull request for changes made to a GenXdev module.  

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName] <String> [[-CommitMessage] <String>] [[-PullRequestTitle] <String>] [[-PullRequestDescription] <String>] [[-GitUserName] <String>] [[-GitUserEmail] <String>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the process of creating a pull request for changes made to  
    a GenXdev module. It handles GitHub authentication, repository forking, pull  
    request creation, and window positioning using the Set-WindowPosition function.  
    The function validates module dependencies, runs unit tests, and either creates  
    a GitHub pull request or uploads to genXdev.net depending on repository  
    availability.  

### PARAMETERS 
    -ModuleName <String>  
        The name of the GenXdev module to create a pull request for.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CommitMessage <String>  
        The commit message to use when committing changes.  
        Required?                    false  
        Position?                    2  
        Default value                Improvements to GenXdev module  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PullRequestTitle <String>  
        The title for the pull request.  
        Required?                    false  
        Position?                    3  
        Default value                Module improvements  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PullRequestDescription <String>  
        The description for the pull request.  
        Required?                    false  
        Position?                    4  
        Default value                These changes improve functionality and fix issues I encountered.  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -GitUserName <String>  
        Git username for commits.  
        Required?                    false  
        Position?                    5  
        Default value                Your Name  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -GitUserEmail <String>  
        Git email for commits.  
        Required?                    false  
        Position?                    6  
        Default value                you@example.com  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes window borders and title bar for a cleaner appearance.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Window width in pixels for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Window height in pixels for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Window horizontal position for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Window vertical position for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers window on screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Returns focus to PowerShell window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns window helper object for further manipulation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Places windows side by side with PowerShell on the same monitor.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Focus the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Set the window to foreground after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Maximize [<SwitchParameter>]  
        Maximize the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a new refactoring set for code transformation tasks.  

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <String> [-PromptKey] <String> [[-Prompt] <String>] [[-SelectionScript] <String>] [[-SelectionPrompt] <String>] [[-LLMQueryType] <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-MaxToken <Int32>] [-Cpu <Int32>] [-TTLSeconds <Int32>] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-Temperature <Double>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath <String>] [-AutoAddModifiedFiles] [-Force] [-SessionOnly] [-ClearSession] [-SkipSession] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates and configures a new refactoring definition with specified settings for  
    LLM-based code transformations. The function handles:  
    - Setting up refactoring configuration  
    - Configuring selection criteria and prompts  
    - Managing LLM model settings  
    - Integrating with development environments  
    - Persisting refactor definitions  

### PARAMETERS 
    -Name <String>  
        Unique identifier for the refactoring set. Must be non-empty and unique.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Key identifying which prompt template to use for refactoring operations.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Optional custom prompt text to override the template specified by PromptKey.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionScript <String>  
        PowerShell script defining selection criteria for items to refactor.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionPrompt <String>  
        Custom prompt text used by the LLM to guide selection of items for refactoring.  
        Required?                    false  
        Position?                    5  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -LLMQueryType <String>  
        The type of LLM query to perform (SimpleIntelligence, Knowledge, Pictures, etc.).  
        Required?                    false  
        Position?                    6  
        Default value                Coding  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Model <String>  
        Name or identifier of the specific LLM model to use for processing.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <String>  
        Identifier used to retrieve a specific model from LM Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MaxToken <Int32>  
        Maximum tokens allowed in LLM responses. Use -1 for model default.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Cpu <Int32>  
        The number of CPU cores to dedicate to AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TTLSeconds <Int32>  
        Time-to-live in seconds for API-loaded models. Use -1 for no expiration.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeRam [<SwitchParameter>]  
        Select configuration by available system RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam [<SwitchParameter>]  
        Select configuration by available GPU RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Temperature <Double>  
        Controls randomness in LLM responses (0.0-1.0). Lower is more deterministic.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Gpu <Int32>  
        GPU usage control: -2=Auto, -1=LM Studio default.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiEndpoint <String>  
        Custom API endpoint URL for accessing the LLM service.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiKey <String>  
        Authentication key required for API access.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeoutSeconds <Int32>  
        The timeout in seconds for AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <Int32>  
        Processing priority for this refactor set (higher numbers = higher priority).  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell cmdlet definitions to expose as tools to the LLM.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Array of files to initially include in the refactoring set.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AutoAddModifiedFiles [<SwitchParameter>]  
        When enabled, automatically adds any modified files to the refactoring queue.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Forces LM Studio to restart before initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens files in Visual Studio Code when enabled.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Opens files in Visual Studio when enabled.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Array of keystrokes to send after opening files.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Opens files in IDE that contain clipboard text  

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde [[-InputObject] <String>] [-Copilot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio  
    ##############################################################################  

### PARAMETERS 
    -InputObject <String>  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Copilot [<SwitchParameter>]  
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
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
```` 

### SYNOPSIS 
    Removes refactor sets from GenXdev preferences system.  

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <String[]> [[-RemoveDefault]] [-PreferencesDatabasePath <String>] [-DefaultValue <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Manages refactor sets in the GenXdev preferences system by removing specified  
    entries. Works with both custom and default refactor sets. Default sets are  
    protected unless explicitly allowed for removal. All refactor sets are  
    identified by the prefix "refactor_set_" in the preferences system.  

### PARAMETERS 
    -Name <String[]>  
        One or more name patterns used to match refactor sets for removal. Supports  
        wildcard patterns like "*" and "?" for flexible matching. Multiple patterns can  
        be provided to target specific sets.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -RemoveDefault [<SwitchParameter>]  
        Switch parameter that, when enabled, allows the removal of protected default or  
        standard refactor sets. By default, these sets are protected from deletion.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing.  

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditCmdlet] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function searches for GenXdev cmdlets using a pattern and optionally opens  
    the found cmdlet's source file in Visual Studio Code or Visual Studio for  
    editing. It retrieves cmdlet information and provides keyboard shortcuts to  
    quickly navigate to the function definition.  

### PARAMETERS 
    -CmdletName <String>  
        Search pattern to filter cmdlets. Supports wildcards. Default is '*' to show  
        all cmdlets.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        GenXdev module names to search. Must match pattern starting with 'GenXdev'.  
        Default searches all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Skip searching in local module paths when finding cmdlets.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Limit search to published module paths only.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Open the found cmdlet in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Open the found cmdlet in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditCmdlet [<SwitchParameter>]  
        Also opens the file in the editor after finding the cmdlet.  
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
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> editcmdlet  
```` 

### SYNOPSIS 
    Opens the specified GenXdev cmdlet in Visual Studio Code.  

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [[-CmdletName] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-UnitTests] [-KeysToSend <String[]>] [-CoPilot] [-Search] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the script file and line number for the specified GenXdev  
    cmdlet and opens it in Visual Studio Code. It can open either the main function  
    implementation or its associated unit tests, based on the UnitTests switch  
    parameter.  

### PARAMETERS 
    -CmdletName <String>  
        The name of the GenXdev cmdlet to locate and open in Visual Studio Code.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UnitTests [<SwitchParameter>]  
        When specified, opens the unit test file for the cmdlet instead of the main  
        implementation file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CoPilot [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Search [<SwitchParameter>]  
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
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
```` 

### SYNOPSIS 
    Splits a PowerShell module (.psm1) file into individual function files.  

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Takes a PowerShell module file and splits each function into separate .ps1 files  
    in a Functions subdirectory. Each function is extracted with its documentation  
    and saved in a file matching the function name. The original module file is  
    updated to dot-source all the split function files.  

### PARAMETERS 
    -Psm1FilePath <String>  
        The full path to the PowerShell module (.psm1) file that needs to be split into  
        individual function files. This path will be expanded to a full path if relative.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Continues or restarts a code refactoring session.  

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Manages code refactoring operations by processing refactor definitions in  
    priority order. Handles file selection, progress tracking, error handling, and  
    provides interactive user control over the refactoring process.  

### PARAMETERS 
    -Name <String[]>  
        Name pattern(s) of refactors to process. Accepts wildcards. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -FilesToAdd <FileInfo[]>  
        Files to include in the refactoring process.  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Files to exclude from the refactoring process.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles [<SwitchParameter>]  
        Remove files that no longer exist from the refactor set.  
        Required?                    false  
        Position?                    4  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Reset [<SwitchParameter>]  
        Restart processing from the beginning of the refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ResetLMSelections [<SwitchParameter>]  
        Restart all LLM selections in the refactoring process.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MarkAllCompleted [<SwitchParameter>]  
        Marks all files in the refactor set as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RedoLast [<SwitchParameter>]  
        Repeat the last refactoring operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Speak [<SwitchParameter>]  
        Enables text-to-speech for refactoring progress and notifications.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Evaluates source files for refactoring eligibility using LLM analysis.  

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <RefactorDefinition> [-Path] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses Language Learning Model (LLM) analysis to determine if a source code file  
    should be selected for refactoring based on specified criteria. The function  
    processes the file content through an LLM query and returns a boolean response.  

### PARAMETERS 
    -RefactorDefinition <RefactorDefinition>  
        A RefactorDefinition object containing the LLM configuration and selection  
        criteria settings used to evaluate the source file.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Path <String>  
        The full filesystem path to the source code file that needs to be evaluated  
        for potential refactoring.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Updates and manages refactoring sets including file selection and processing.  

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-SelectionPrompt <String>] [-LLMQueryType <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Cpu <Int32>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-KeysToSend <String[]>] [-PreferencesDatabasePath <String>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformAutoSelections] [-PerformAISelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-ReprocessModifiedFiles] [-Force] [-Code] [-VisualStudio] [-Speak] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Update-Refactor [[-Refactor] <RefactorDefinition[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-SelectionPrompt <String>] [-LLMQueryType <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Cpu <Int32>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-KeysToSend <String[]>] [-PreferencesDatabasePath <String>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformAutoSelections] [-PerformAISelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-ReprocessModifiedFiles] [-Force] [-Code] [-VisualStudio] [-Speak] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Provides comprehensive management of refactoring sets by:  
    - Adding or removing files from processing queues  
    - Cleaning up deleted files from the set  
    - Managing state information and progress tracking  
    - Handling LLM-based file selection and processing  
    - Supporting both automatic and manual file management  
    - Maintaining detailed logs of all operations  
    - Gracefully handling deleted files (skipped unless CleanUpDeletedFiles is used)  

### PARAMETERS 
    -Name <String[]>  
        Names of refactor sets to update, accepts wildcards. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -Refactor <RefactorDefinition[]>  
        Direct input of refactor set objects instead of loading by name.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Files to add to the processing queue.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Files to remove from the processing queue.  
        Required?                    false  
        Position?                    4  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByModifiedDateFrom <DateTime>  
        Select files modified on or after this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByModifiedDateTo <DateTime>  
        Select files modified on or before this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByCreationDateFrom <DateTime>  
        Select files created on or after this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByCreationDateTo <DateTime>  
        Select files created on or before this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Key identifying which prompt script to use.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Direct prompt text to use for processing.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionScript <String>  
        PowerShell script for file selection logic.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionPrompt <String>  
        Content for LLM-based selection prompts.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -LLMQueryType <String>  
        Type of LLM query to perform.  
        Required?                    false  
        Position?                    named  
        Default value                Coding  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Model <String>  
        LLM model identifier for LM-Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <String>  
        Model retrieval identifier for LM-Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Temperature <Double>  
        Temperature setting for response randomness (0.0-1.0).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MaxToken <Int32>  
        Maximum tokens allowed in responses (-1 for default).  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TTLSeconds <Int32>  
        Time-to-live in seconds for API model requests.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Cpu <Int32>  
        Number of CPU cores to dedicate to AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Gpu <Int32>  
        GPU processing control (-2=Auto, -1=LM-Studio default).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiEndpoint <String>  
        API endpoint URL for LLM service.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiKey <String>  
        Authentication key for API access.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeoutSeconds <Int32>  
        The timeout in seconds for AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <Int32>  
        Processing priority level for this refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        PowerShell commands available during LLM selection.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send after opening file.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles [<SwitchParameter>]  
        Remove entries for files that no longer exist on disk. Without this parameter,  
        deleted files are preserved in collections but gracefully skipped during  
        processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AskBeforeLLMSelection [<SwitchParameter>]  
        Prompt before launching LLM invocations for file selections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PerformAutoSelections [<SwitchParameter>]  
        Enable LLM-based file selection processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PerformAISelections [<SwitchParameter>]  
        Process all files in the refactor set with LLM. Can also be used as  
        -PerformAISelections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RetryFailedLLMSelections [<SwitchParameter>]  
        Retry previously failed LLM selections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Clear [<SwitchParameter>]  
        Remove all files from the refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearLog [<SwitchParameter>]  
        Clear the refactor set's operation log.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Reset [<SwitchParameter>]  
        Start processing from beginning of refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ResetLMSelections [<SwitchParameter>]  
        Restart all LLM selections from beginning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MarkAllCompleted [<SwitchParameter>]  
        Mark all files as successfully refactored.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RedoLast [<SwitchParameter>]  
        Reprocess the last refactoring operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReprocessModifiedFiles [<SwitchParameter>]  
        Automatically reprocess files that have been modified since the last refactor  
        update.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Force stop LM-Studio before initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Open file in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Open file in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Speak [<SwitchParameter>]  
        Enable text-to-speech for operation details.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeRam [<SwitchParameter>]  
        Select configuration by available system RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam [<SwitchParameter>]  
        Select configuration by available GPU RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Adds a feature line to the README file with a timestamp.  

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a feature line to the specified README file, prefixed with the current date  
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.  

### PARAMETERS 
    -Line <String>  
        The feature description text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to format the line as code in the README file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the README file after adding the line.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use the README file in the home directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use the README file in the OneDrive directory.  
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
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
```` 

### SYNOPSIS 
    Adds an idea item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped idea to the "## Ideas" section of a README.md file.  
    Can display the modified section and open in Visual Studio Code.  

### PARAMETERS 
    -Line <String>  
        The idea text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
```` 

### SYNOPSIS 
    Adds an issue item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped issue to the "## Issues" section of a README.md file.  
    Can display the modified section and open in Visual Studio Code.  

### PARAMETERS 
    -Line <String>  
        The issue text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
```` 

### SYNOPSIS 
    Adds a line to a README.md markdown file in a specified section.  

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <String>] [-Section] <String> [-Prefix] <String> [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Finds and modifies a README.md file by adding a new line to a specified section.  
    Can create the section if it doesn't exist. Supports formatting lines as code  
    blocks and showing the modified section.  
    Will look in current directory first, then walk up directories to find the README  
    location. If not found, will use the README in the PowerShell profile directory.  

### PARAMETERS 
    -Line <String>  
        The line of text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Section <String>  
        The section header where the line should be added.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prefix <String>  
        The prefix to add before the line (default: "* ").  
        Required?                    true  
        Position?                    3  
        Default value                *  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to open the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Done [<SwitchParameter>]  
        Switch to mark a todo item as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use README in PowerShell profile directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use README in OneDrive directory.  
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
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> ReleaseNote  
```` 

### SYNOPSIS 
    Adds a ReleaseNote line to the README file with a timestamp.  

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a ReleaseNote line to the specified README file, prefixed with the current date  
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.  

### PARAMETERS 
    -Line <String>  
        The ReleaseNote description text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to format the line as code in the README file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the README file after adding the line.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use the README file in the home directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use the README file in the OneDrive directory.  
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
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
```` 

### SYNOPSIS 
    Adds a todo item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <String>] [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped todo item to the "## Todoos" section of a README.md file.  
    The todo items can be marked as done and the modified section can be displayed.  
    Each new todo item is automatically timestamped unless marking as done.  

### PARAMETERS 
    -Line <String>  
        The todo item text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Done [<SwitchParameter>]  
        Marks the specified todo item as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
```` 

### SYNOPSIS 
    Installs and configures Visual Studio Code with recommended extensions.  

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Checks if Visual Studio Code is installed and if not, installs it using WinGet.  
    Configures user settings, keybindings, and installs recommended extensions from  
    the workspace configuration. Also sets up PSGallery as a trusted repository and  
    configures specific extension settings.  

### PARAMETERS 
    -Force [<SwitchParameter>]  
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
 

##	Features 
```PowerShell 

   Features  
```` 

### SYNOPSIS 
    Displays features from a README.md file.  

### SYNTAX 
```PowerShell 
Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all features from the "## Features" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Ideas 
```PowerShell 

   Ideas  
```` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Issues 
```PowerShell 

   Issues  
```` 

### SYNOPSIS 
    Displays issues from a README.md file.  

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all issues from the "## Issues" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
```` 

### SYNOPSIS 
    Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio).  

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <String> [[-LineNo] <Int32>] [[-KeysToSend] <String[]>] [-Code] [-VisualStudio] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function opens a specified source file in either Visual Studio Code or  
    Visual Studio. It can navigate directly to a specific line number and optionally  
    send keyboard inputs to the IDE after opening the file. The function will  
    attempt to determine which IDE to use based on the current host process, running  
    applications, or user selection.  

### PARAMETERS 
    -Path <String>  
        The path to the source file that should be opened in the IDE. Accepts both  
        relative and absolute paths, as well as paths with environment variables.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -LineNo <Int32>  
        The line number to navigate to when opening the file. Default is 0, which opens  
        the file without positioning to a specific line.  
        Required?                    false  
        Position?                    2  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Array of keyboard inputs to send to the application after opening. The function  
        will wait 2 seconds before sending the keys to ensure the IDE has loaded.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch parameter to force opening the file in Visual Studio Code regardless  
        of the current host process or other running IDEs.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Switch parameter to force opening the file in Visual Studio regardless of the  
        current host process or other running IDEs.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        When specified, escapes special characters so they are sent as literal text  
        instead of being interpreted as control sequences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Prevents returning keyboard focus to PowerShell after sending keys.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Sends Shift+Enter instead of regular Enter for line breaks.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Adds delay between sending different key sequences. Useful for slower apps.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Displays ReleaseNotes from a README.md file.  

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all ReleaseNotes from the "## ReleaseNotes" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Todoos 
```PowerShell 

   Todoos  
```` 

### SYNOPSIS 
    Displays todo items from a README.md file.  

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all todo items from the "## Todoos" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	VSCode 
```PowerShell 

   VSCode  
```` 

### SYNOPSIS 
    Opens one or more files in Visual Studio Code.  

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <String[]> [-Copilot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function takes file paths and opens them in Visual Studio Code. It expands  
    paths and validates file existence before attempting to open them. The function  
    supports both direct file paths and pipeline input, making it ideal for quickly  
    opening multiple files from terminal searches.  

### PARAMETERS 
    -FilePath <String[]>  
        One or more file paths to open in Visual Studio Code. Accepts pipeline input  
        and wildcard patterns.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Copilot [<SwitchParameter>]  
        When specified, opens the file and triggers the Copilot keyboard shortcut to  
        start an edit session.  
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
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> Get-GitChangedFile, gitchanged  
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

### SYNOPSIS 
    Creates and pushes a new git commit with all changes.  

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <String>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Stages all changes in the current git repository, creates a commit with the  
    specified title, and pushes the changes to the remote origin. Automatically sets  
    up upstream tracking if needed.  

### PARAMETERS 
    -Title <String>  
        The message to use for the git commit. If not specified, defaults to  
        "Improved scripts".  
        Required?                    false  
        Position?                    1  
        Default value                Improved scripts  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Permanently deletes specified folders from all branches in a Git repository.  

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <String> [-Folders] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Cleans a Git repository by removing specified folders from the entire commit  
    history across all branches. This is done by cloning the repository, using  
    git filter-branch to remove the folders, and force pushing the changes back.  
    This operation is destructive and permanently rewrites Git history.  

### PARAMETERS 
    -RepoUri <String>  
        The Git repository URI to clean (HTTPS or SSH format).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Folders <String[]>  
        Array of folder paths to remove from the repository history. Paths can be  
        specified with forward or back slashes.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
```PowerShell 

       This operation is destructive and cannot be undone. It rewrites Git history and  
       requires force pushing, which affects all repository users.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> PermanentlyDeleteGitFolders `  
       -RepoUri "https://github.com/user/repo.git" `  
       -Folders "bin", "obj"  
```` 

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

### SYNOPSIS 
    Improves GenXdev cmdlet documentation and implementation through AI assistance.  

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <String>] [-ModuleName <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditPrompt] [-Integrate] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function enhances GenXdev cmdlets by analyzing and improving their code  
    through AI prompts. It can integrate cmdlets into modules, update documentation,  
    and verify proper implementation. The function supports custom prompt templates  
    and can open files in Visual Studio Code or Visual Studio.  

### PARAMETERS 
    -CmdletName <String>  
        The name or search pattern of the cmdlet to improve. Supports wildcards.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -PromptKey <String>  
        The key identifying which AI prompt template to use for improvements.  
        Required?                    false  
        Position?                    2  
        Default value                CheckAllRequirements  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom prompt text to override the template prompt.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoLocal [<SwitchParameter>]  
        Skip searching local module versions.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Only search published module versions.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files rather than module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the cmdlet in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Opens the cmdlet in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        Only edit the AI prompt template without processing the cmdlet.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Integrate [<SwitchParameter>]  
        Integrate the cmdlet into a module if it's currently a standalone script.  
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
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
```` 

### SYNOPSIS 
    Asserts and improves unit-tests of a specified GenXdev cmdlet.  

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <String> [[-Prompt] <String>] [[-PromptKey] <String>] [-EditPrompt] [-AssertFailedTest] [-FromScripts] [-ContinuationHandled] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function helps maintain and improve unit tests for GenXdev cmdlets by:  
    1. Creating test files if they do not exist  
    2. Opening the cmdlet in VS Code  
    3. Preparing and applying AI prompts for test generation/improvement  
    4. Managing test execution workflow  

### PARAMETERS 
    -CmdletName <String>  
        The name of the cmdlet to improve unit-tests for. Required.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to use for test generation. Optional.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        Switch to only edit the AI prompt without modifying the cmdlet. Optional.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AssertFailedTest [<SwitchParameter>]  
        Switch to indicate assertion of a failed test. Optional.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContinuationHandled [<SwitchParameter>]  
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
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
```` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>] [-FromScripts] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
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
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> Assert-GenXdevUnitTest, rungenxdevtests, testcmdlet  
```` 

### SYNOPSIS 
    Executesunit tests for GenXdev modules, sub-modules, or cmdlets  
    with intelligent debugging and AI-powered error resolution.  

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <String>] [[-TestFailedAction] <String>] [[-DefinitionMatches] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch] [-Verbosity <String>] [-StackTraceVerbosity <String>] [-AllowLongRunningTests] [-SkipModuleImports] [-SkipPSAnalyzerTests] [-SkipPesterTests] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a testing framework for GenXdev modules,  
    offering multi-level test execution from entire modules down to individual  
    cmdlets. It integrates PSScriptAnalyzer for static code analysis, Pester for  
    unit testing, and Get-Help validation for documentation compliance. The  
    function includes intelligent error handling with AI-powered resolution  
    capabilities and detailed progress reporting for development workflows.  

### PARAMETERS 
    -CmdletName <String>  
        Search pattern to filter cmdlets for testing. Supports wildcards and allows  
        targeting specific cmdlets or groups of cmdlets matching the pattern.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -TestFailedAction <String>  
        Action to take when a test fails. Options include interactive prompting,  
        automatic continuation, stopping execution, AI-powered resolution, error  
        logging, or exception throwing for integration scenarios.  
        Required?                    false  
        Position?                    2  
        Default value                Continue  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefinitionMatches <String>  
        Regular expression to match cmdlet definitions during the search process.  
        This allows for advanced filtering based on cmdlet implementation patterns.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -ModuleName <String[]>  
        GenXdev module names to search and test. Must follow the pattern starting  
        with 'GenXdev' followed by optional sub-module components. Supports wildcards  
        for broad module selection.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Skip searching in local module paths during cmdlet discovery. When specified,  
        only published module paths will be considered for testing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Limit search to published module paths only. This excludes local development  
        modules and focuses on officially published GenXdev modules.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files. This allows testing of  
        standalone PowerShell scripts within the GenXdev ecosystem.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeScripts [<SwitchParameter>]  
        Include the scripts directory in addition to regular modules. This expands  
        the test scope to cover both modular and script-based functionality.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyReturnModuleNames [<SwitchParameter>]  
        Return only unique module names instead of full cmdlet details. Useful for  
        discovery and inventory operations rather than detailed testing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExactMatch [<SwitchParameter>]  
        Require exact matches for cmdlet names rather than wildcard matching. This  
        provides precise targeting for specific cmdlet testing scenarios.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Verbosity <String>  
        Output detail level for test execution. Controls the amount of information  
        displayed during test runs, from minimal to diagnostic output.  
        Required?                    false  
        Position?                    named  
        Default value                Normal  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -StackTraceVerbosity <String>  
        Stack trace detail level for error reporting. Determines how much call stack  
        information is included when errors occur during testing.  
        Required?                    false  
        Position?                    named  
        Default value                FirstLine  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AllowLongRunningTests [<SwitchParameter>]  
        Include unit tests that have long running durations in the test execution.  
        This enables testing including performance and integration tests.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipModuleImports [<SwitchParameter>]  
        Skip importing GenXdev modules before testing. This is useful when modules  
        are already loaded or when testing specific module loading scenarios.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipPSAnalyzerTests [<SwitchParameter>]  
        Skip invoking PSScriptAnalyzer tests during the test execution. This allows  
        focusing solely on functional testing when static analysis is not required.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipPesterTests [<SwitchParameter>]  
        Skip invoking Pester tests during the test execution. This allows focusing  
        solely on static analysis when functional testing is not required.  
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
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
```` 

### SYNOPSIS 
    Assists in refactoring PowerShell source code files using AI assistance.  

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <String> [-Prompt <String>] [-EditPrompt] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the process of refactoring PowerShell code using AI.  
    It manages prompt templates, detects the active IDE (VS Code or Visual Studio),  
    and orchestrates the refactoring workflow through keyboard automation.  
    The function can handle both module manifest (.psd1) and module script (.psm1)  
    files.  

### PARAMETERS 
    -ModuleName <String>  
        The name of the PowerShell module to refactor. This module must be available  
        in the PowerShell module path.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to use for the refactoring process. If not specified,  
        defaults to an error message if module loading fails.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        When enabled, only opens the prompt template for editing without executing the  
        actual refactoring process.  
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
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
```` 

### SYNOPSIS 
    Executes a refactoring operation on a source file using the specified IDE and  
    AI prompt template.  

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <String> [[-RefactorSettings] <RefactorSettings>] [-AllowLongRunningTests] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the refactoring process by preparing an AI prompt based  
    on the refactor definition, detecting or selecting the appropriate IDE (VS Code  
    or Visual Studio), and opening the target file with the prepared prompt. The  
    function handles prompt template processing, IDE detection, and automation of  
    the refactoring workflow.  

### PARAMETERS 
    -Path <String>  
        The absolute or relative path to the source file that needs to be refactored.  
        The path will be expanded to an absolute path during processing.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RefactorSettings <RefactorSettings>  
        Required?                    false  
        Position?                    2  
        Default value                [GenXdev.Helpers.RefactorSettings]::new()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AllowLongRunningTests [<SwitchParameter>]  
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
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
```` 

### SYNOPSIS 
    Cleans build artifacts from GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
```` 

### DESCRIPTION 
    Removes build directories and artifacts from all GenXdev PowerShell modules in  
    the user's PowerShell Modules directory. Cleans both module root directories and  
    version-specific subdirectories, removing bin, obj, trash and other build  
    artifacts.  

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

### SYNOPSIS 
    Completes the README file for specified GenXDev modules by adding documentation.  

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function enhances README.md files for GenXDev modules by automatically  
    generating and inserting a cmdlet index and detailed cmdlet documentation. For  
    individual modules, it processes and updates existing README.md files with a  
    standardized format including a command index and detailed help for each cmdlet.  
    For the main GenXdev module, it creates a concise overview with links to GitHub  
    repositories instead of concatenating full module content, preventing the README  
    from becoming too large for parsers. Cmdlet indexes link to the corresponding  
    sections in the GitHub repository's README files.  

### PARAMETERS 
    -ModuleName <String[]>  
        Specifies which module(s) to process. If omitted, all modules will be processed.  
        Can accept multiple module names and supports pipeline input. Accepts string  
        array input.  
        Required?                    false  
        Position?                    1  
        Default value                @("GenXdev*")  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code.  

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function ensures that GitHub Copilot Chat's file attachment feature has a proper  
    keyboard shortcut (Ctrl+Shift+Alt+F12) configured in Visual Studio Code.  
    It will remove any existing Copilot attachment shortcuts and replace them with the  
    current correct command (github.copilot.chat.attachFile).  
    Also adds Alt+` (backtick) shortcut for toggling the maximized panel.  

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

### SYNOPSIS 
    Analyzes GenXdev cmdlet usage patterns to identify most frequently called functions.  

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] <String>] [[-Top] <Int32>] [-IncludeCallChains] [-IncludeScripts] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This script uses Get-GenXDevCmdlet to scan all GenXdev PowerShell modules and their  
    functions to analyze which cmdlets are called most frequently by other cmdlets.  
    This helps prioritize which functions to refactor to C# first, starting with the  
    most commonly used ones.  

### PARAMETERS 
    -OutputFormat <String>  
        Format for output: Table, List, or CSV. Default is Table.  
        Required?                    false  
        Position?                    1  
        Default value                Table  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top <Int32>  
        Number of top results to show. Default is 50.  
        Required?                    false  
        Position?                    2  
        Default value                50  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeCallChains [<SwitchParameter>]  
        Include detailed call chain information showing which functions call which.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeScripts [<SwitchParameter>]  
        Include script files in addition to module cmdlets.  
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
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
```` 

### SYNOPSIS 
    Retrieves all GenXDev modules from a specified path.  

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <String>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function searches through a directory structure for GenXdev modules,  
    excluding any with '.local' in the name. For each valid module found, it returns  
    the most recent version folder (1.x) that contains a valid module manifest  
    (.psd1) file.  

### PARAMETERS 
    -Path <String>  
        The root directory to search for GenXdev modules. If not specified, defaults to  
        the parent directory of the script's location.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Retrieves GenXDev modules in dependency order.  

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function returns a list of GenXDev modules arranged in the correct dependency  
    order to ensure proper module loading. It first retrieves all module information  
    and then orders them based on their dependencies, starting with core modules and  
    ending with dependent modules. This ensures modules are loaded in the correct  
    sequence.  

### PARAMETERS 
    -ModuleName <String[]>  
        One or more module names to filter the results. If not provided, all modules are  
        returned in their dependency order. The function will maintain the correct  
        dependency chain even when filtering specific modules.  
        Required?                    false  
        Position?                    1  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown               --> Get-GenXDevModuleHelp  
```` 

### SYNOPSIS 
    Generates markdown help documentation for specified GenXDev modules.  

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <String[]>] [[-CommandNames] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function generates markdown help documentation for specified GenXDev modules  
    and their cmdlets. It processes each module and cmdlet, formatting the help  
    content into markdown with proper sections and code blocks. The output includes  
    syntax highlighting for PowerShell code blocks and proper formatting for  
    different help sections.  

### PARAMETERS 
    -ModuleName <String[]>  
        Specifies the name(s) of the module(s) to generate help for. Accepts wildcards.  
        If not specified, defaults to "GenXdev.*". Can be provided via pipeline.  
        Required?                    false  
        Position?                    1  
        Default value                GenXdev.*  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -CommandNames <String[]>  
        Optional array of cmdlet names to filter which commands to generate help for.  
        If not specified, documentation will be generated for all cmdlets in the module.  
        Supports wildcard patterns like "Get-*".  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactor, refactors, Show-RefactorReport  
```` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath <String>] [-DefaultValue <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
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
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
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
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
```` 

### SYNOPSIS 
    Generates a detailed report of refactoring operations and their status.  

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <String[]>] [-PreferencesDatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-AsText] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Analyzes and reports on the progress of refactoring operations by examining  
    their current state, completion status, and affected functions. Provides output  
    in either structured hashtable format or human-readable aligned text columns.  
    The report includes refactor name, prompt key, priority, status, function count  
    and completion percentage.  

### PARAMETERS 
    -Name <String[]>  
        The name pattern to filter refactors. Supports wildcards. Multiple names can be  
        specified. Default value is "*" to display all refactors.  
        Required?                    false  
        Position?                    1  
        Default value                *  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AsText [<SwitchParameter>]  
        Outputs the report in human-readable text format with aligned columns instead of  
        structured hashtable objects. The text format includes headers and separators.  
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
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
```` 

### SYNOPSIS 
    Formats PowerShell script files using PSScriptAnalyzer formatting rules.  

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <String> [-Settings <Object>] [-Range <Int32[]>] [-Recurse] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function applies PowerShell formatting rules to script files using  
    PSScriptAnalyzer's Invoke-Formatter cmdlet. It can process individual files or  
    recursively format multiple files in directories. The function uses customizable  
    formatting settings and provides detailed logging of the formatting process.  

### PARAMETERS 
    -Path <String>  
        Specifies the path to the script file or directory to format. Accepts pipeline  
        input and supports various path aliases for compatibility.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains  
        the formatting settings. If not specified, the function will attempt to load  
        settings from a predefined location or use built-in defaults.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Range <Int32[]>  
        The range within which formatting should take place as an array of four integers:  
        starting line number, starting column number, ending line number, ending column  
        number. If not specified, the entire file will be formatted.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Recurse [<SwitchParameter>]  
        Recursively process files in subdirectories when the Path parameter points to  
        a directory.  
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
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
```` 

### SYNOPSIS 
    Invokes PowerShell Script Analyzer to analyze PowerShell scripts for compliance  
    and best practices.  

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-Path] <String> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]  
   Invoke-GenXdevScriptAnalyzer -ScriptDefinition <String> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a wrapper around PSScriptAnalyzer to analyze PowerShell  
    scripts for compliance issues, best practices violations, and potential bugs.  
    It supports both file-based analysis and string-based script analysis with  
    customizable rules and settings.  

### PARAMETERS 
    -Path <String>  
        Specifies the path to the script file to analyze. This parameter is mandatory  
        when using the Path parameter set.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ScriptDefinition <String>  
        Specifies the script definition as a string to analyze. This parameter is  
        mandatory when using the Script parameter set.  
        Required?                    true  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableExit [<SwitchParameter>]  
        Specifies that the tool should exit on error during analysis.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fix [<SwitchParameter>]  
        Enables automatic fixing of violations where possible.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Recurse [<SwitchParameter>]  
        Recursively processes files in subdirectories when analyzing a directory path.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReportSummary [<SwitchParameter>]  
        Reports a summary after analysis showing the total number of issues found.  
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
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
```` 

### SYNOPSIS 
    Creates a new GenXdev PowerShell cmdlet with proper structure and validation.  

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <String> [[-Synopsis] <String>] [[-Description] <String>] [[-BaseModuleName] <String>] [[-ModuleName] <String>] [[-CmdletAliases] <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new PowerShell cmdlet following GenXdev standards, including parameter  
    validation, help documentation, and proper verb-noun naming convention. Validates  
    the verb against approved PowerShell verbs and ensures proper casing of both verb  
    and noun components. Can integrate new cmdlets into existing module structures.  

### PARAMETERS 
    -CmdletName <String>  
        The name of the cmdlet to create. Must follow the Verb-Noun format using an  
        approved PowerShell verb.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Synopsis <String>  
        A brief description of the cmdlet's purpose for help documentation.  
        Required?                    false  
        Position?                    2  
        Default value                todo: A brief description of the cmdlet's purpose  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        A detailed description of what the cmdlet does for help documentation.  
        Required?                    false  
        Position?                    3  
        Default value                todo: [A detailed description of what the cmdlet does]  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -BaseModuleName <String>  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ModuleName <String>  
        The name of the base GenXdev module to integrate the cmdlet into.  
        Must match pattern GenXdev or GenXdev.SubModule.  
        Required?                    false  
        Position?                    5  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CmdletAliases <String[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    6  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        The AI prompt key used to select a template for generating the cmdlet content.  
        Defaults to "NewGenXdevCmdLet".  
        Required?                    false  
        Position?                    7  
        Default value                NewGenXdevCmdLet  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to guide the generation of the cmdlet content.  
        Required?                    false  
        Position?                    8  
        Default value                Create a boilerplate GenXdev cmdlet that does what it's name suggests  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        When specified, only opens the AI prompt for editing without creating the cmdlet.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a new GenXdev PowerShell module with proper structure and configuration.  

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <String> [-Description] <String> [[-Tags] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new PowerShell module following GenXdev standards by:  
    - Generating module manifest (psd1) with proper metadata  
    - Creating module script file (psm1)  
    - Setting up directory structure for functions and tests  
    - Adding required files like LICENSE and README  
    - Configuring version info and dependencies  

### PARAMETERS 
    -ModuleName <String>  
        The name of the module to create. Must follow GenXdev naming convention starting  
        with 'GenXdev.' followed by module identifier (e.g. GenXdev.Tools).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        A brief description of the module's purpose and functionality. This will be used  
        in the module manifest and documentation.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Tags <String[]>  
        Optional array of tags for module discovery in PowerShell Gallery. Tags cannot  
        contain whitespace. Defaults to 'GenXdev'.  
        Required?                    false  
        Position?                    3  
        Default value                @('GenXdev')  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a pull request for changes made to a GenXdev module.  

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName] <String> [[-CommitMessage] <String>] [[-PullRequestTitle] <String>] [[-PullRequestDescription] <String>] [[-GitUserName] <String>] [[-GitUserEmail] <String>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the process of creating a pull request for changes made to  
    a GenXdev module. It handles GitHub authentication, repository forking, pull  
    request creation, and window positioning using the Set-WindowPosition function.  
    The function validates module dependencies, runs unit tests, and either creates  
    a GitHub pull request or uploads to genXdev.net depending on repository  
    availability.  

### PARAMETERS 
    -ModuleName <String>  
        The name of the GenXdev module to create a pull request for.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CommitMessage <String>  
        The commit message to use when committing changes.  
        Required?                    false  
        Position?                    2  
        Default value                Improvements to GenXdev module  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PullRequestTitle <String>  
        The title for the pull request.  
        Required?                    false  
        Position?                    3  
        Default value                Module improvements  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PullRequestDescription <String>  
        The description for the pull request.  
        Required?                    false  
        Position?                    4  
        Default value                These changes improve functionality and fix issues I encountered.  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -GitUserName <String>  
        Git username for commits.  
        Required?                    false  
        Position?                    5  
        Default value                Your Name  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -GitUserEmail <String>  
        Git email for commits.  
        Required?                    false  
        Position?                    6  
        Default value                you@example.com  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes window borders and title bar for a cleaner appearance.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Window width in pixels for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Window height in pixels for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Window horizontal position for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Window vertical position for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers window on screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Returns focus to PowerShell window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns window helper object for further manipulation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Places windows side by side with PowerShell on the same monitor.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Focus the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Set the window to foreground after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Maximize [<SwitchParameter>]  
        Maximize the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a new refactoring set for code transformation tasks.  

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <String> [-PromptKey] <String> [[-Prompt] <String>] [[-SelectionScript] <String>] [[-SelectionPrompt] <String>] [[-LLMQueryType] <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-MaxToken <Int32>] [-Cpu <Int32>] [-TTLSeconds <Int32>] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-Temperature <Double>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath <String>] [-AutoAddModifiedFiles] [-Force] [-SessionOnly] [-ClearSession] [-SkipSession] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates and configures a new refactoring definition with specified settings for  
    LLM-based code transformations. The function handles:  
    - Setting up refactoring configuration  
    - Configuring selection criteria and prompts  
    - Managing LLM model settings  
    - Integrating with development environments  
    - Persisting refactor definitions  

### PARAMETERS 
    -Name <String>  
        Unique identifier for the refactoring set. Must be non-empty and unique.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Key identifying which prompt template to use for refactoring operations.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Optional custom prompt text to override the template specified by PromptKey.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionScript <String>  
        PowerShell script defining selection criteria for items to refactor.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionPrompt <String>  
        Custom prompt text used by the LLM to guide selection of items for refactoring.  
        Required?                    false  
        Position?                    5  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -LLMQueryType <String>  
        The type of LLM query to perform (SimpleIntelligence, Knowledge, Pictures, etc.).  
        Required?                    false  
        Position?                    6  
        Default value                Coding  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Model <String>  
        Name or identifier of the specific LLM model to use for processing.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <String>  
        Identifier used to retrieve a specific model from LM Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MaxToken <Int32>  
        Maximum tokens allowed in LLM responses. Use -1 for model default.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Cpu <Int32>  
        The number of CPU cores to dedicate to AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TTLSeconds <Int32>  
        Time-to-live in seconds for API-loaded models. Use -1 for no expiration.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeRam [<SwitchParameter>]  
        Select configuration by available system RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam [<SwitchParameter>]  
        Select configuration by available GPU RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Temperature <Double>  
        Controls randomness in LLM responses (0.0-1.0). Lower is more deterministic.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Gpu <Int32>  
        GPU usage control: -2=Auto, -1=LM Studio default.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiEndpoint <String>  
        Custom API endpoint URL for accessing the LLM service.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiKey <String>  
        Authentication key required for API access.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeoutSeconds <Int32>  
        The timeout in seconds for AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <Int32>  
        Processing priority for this refactor set (higher numbers = higher priority).  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell cmdlet definitions to expose as tools to the LLM.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Array of files to initially include in the refactoring set.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AutoAddModifiedFiles [<SwitchParameter>]  
        When enabled, automatically adds any modified files to the refactoring queue.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Forces LM Studio to restart before initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens files in Visual Studio Code when enabled.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Opens files in Visual Studio when enabled.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Array of keystrokes to send after opening files.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Opens files in IDE that contain clipboard text  

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde [[-InputObject] <String>] [-Copilot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio  
    ##############################################################################  

### PARAMETERS 
    -InputObject <String>  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Copilot [<SwitchParameter>]  
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
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
```` 

### SYNOPSIS 
    Removes refactor sets from GenXdev preferences system.  

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <String[]> [[-RemoveDefault]] [-PreferencesDatabasePath <String>] [-DefaultValue <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Manages refactor sets in the GenXdev preferences system by removing specified  
    entries. Works with both custom and default refactor sets. Default sets are  
    protected unless explicitly allowed for removal. All refactor sets are  
    identified by the prefix "refactor_set_" in the preferences system.  

### PARAMETERS 
    -Name <String[]>  
        One or more name patterns used to match refactor sets for removal. Supports  
        wildcard patterns like "*" and "?" for flexible matching. Multiple patterns can  
        be provided to target specific sets.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -RemoveDefault [<SwitchParameter>]  
        Switch parameter that, when enabled, allows the removal of protected default or  
        standard refactor sets. By default, these sets are protected from deletion.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing.  

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditCmdlet] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function searches for GenXdev cmdlets using a pattern and optionally opens  
    the found cmdlet's source file in Visual Studio Code or Visual Studio for  
    editing. It retrieves cmdlet information and provides keyboard shortcuts to  
    quickly navigate to the function definition.  

### PARAMETERS 
    -CmdletName <String>  
        Search pattern to filter cmdlets. Supports wildcards. Default is '*' to show  
        all cmdlets.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        GenXdev module names to search. Must match pattern starting with 'GenXdev'.  
        Default searches all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Skip searching in local module paths when finding cmdlets.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Limit search to published module paths only.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Open the found cmdlet in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Open the found cmdlet in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditCmdlet [<SwitchParameter>]  
        Also opens the file in the editor after finding the cmdlet.  
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
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> editcmdlet  
```` 

### SYNOPSIS 
    Opens the specified GenXdev cmdlet in Visual Studio Code.  

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [[-CmdletName] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-UnitTests] [-KeysToSend <String[]>] [-CoPilot] [-Search] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the script file and line number for the specified GenXdev  
    cmdlet and opens it in Visual Studio Code. It can open either the main function  
    implementation or its associated unit tests, based on the UnitTests switch  
    parameter.  

### PARAMETERS 
    -CmdletName <String>  
        The name of the GenXdev cmdlet to locate and open in Visual Studio Code.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UnitTests [<SwitchParameter>]  
        When specified, opens the unit test file for the cmdlet instead of the main  
        implementation file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CoPilot [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Search [<SwitchParameter>]  
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
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
```` 

### SYNOPSIS 
    Splits a PowerShell module (.psm1) file into individual function files.  

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Takes a PowerShell module file and splits each function into separate .ps1 files  
    in a Functions subdirectory. Each function is extracted with its documentation  
    and saved in a file matching the function name. The original module file is  
    updated to dot-source all the split function files.  

### PARAMETERS 
    -Psm1FilePath <String>  
        The full path to the PowerShell module (.psm1) file that needs to be split into  
        individual function files. This path will be expanded to a full path if relative.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Continues or restarts a code refactoring session.  

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Manages code refactoring operations by processing refactor definitions in  
    priority order. Handles file selection, progress tracking, error handling, and  
    provides interactive user control over the refactoring process.  

### PARAMETERS 
    -Name <String[]>  
        Name pattern(s) of refactors to process. Accepts wildcards. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -FilesToAdd <FileInfo[]>  
        Files to include in the refactoring process.  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Files to exclude from the refactoring process.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles [<SwitchParameter>]  
        Remove files that no longer exist from the refactor set.  
        Required?                    false  
        Position?                    4  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Reset [<SwitchParameter>]  
        Restart processing from the beginning of the refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ResetLMSelections [<SwitchParameter>]  
        Restart all LLM selections in the refactoring process.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MarkAllCompleted [<SwitchParameter>]  
        Marks all files in the refactor set as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RedoLast [<SwitchParameter>]  
        Repeat the last refactoring operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Speak [<SwitchParameter>]  
        Enables text-to-speech for refactoring progress and notifications.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Evaluates source files for refactoring eligibility using LLM analysis.  

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <RefactorDefinition> [-Path] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses Language Learning Model (LLM) analysis to determine if a source code file  
    should be selected for refactoring based on specified criteria. The function  
    processes the file content through an LLM query and returns a boolean response.  

### PARAMETERS 
    -RefactorDefinition <RefactorDefinition>  
        A RefactorDefinition object containing the LLM configuration and selection  
        criteria settings used to evaluate the source file.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Path <String>  
        The full filesystem path to the source code file that needs to be evaluated  
        for potential refactoring.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Updates and manages refactoring sets including file selection and processing.  

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-SelectionPrompt <String>] [-LLMQueryType <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Cpu <Int32>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-KeysToSend <String[]>] [-PreferencesDatabasePath <String>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformAutoSelections] [-PerformAISelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-ReprocessModifiedFiles] [-Force] [-Code] [-VisualStudio] [-Speak] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Update-Refactor [[-Refactor] <RefactorDefinition[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-SelectionPrompt <String>] [-LLMQueryType <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Cpu <Int32>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-KeysToSend <String[]>] [-PreferencesDatabasePath <String>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformAutoSelections] [-PerformAISelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-ReprocessModifiedFiles] [-Force] [-Code] [-VisualStudio] [-Speak] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Provides comprehensive management of refactoring sets by:  
    - Adding or removing files from processing queues  
    - Cleaning up deleted files from the set  
    - Managing state information and progress tracking  
    - Handling LLM-based file selection and processing  
    - Supporting both automatic and manual file management  
    - Maintaining detailed logs of all operations  
    - Gracefully handling deleted files (skipped unless CleanUpDeletedFiles is used)  

### PARAMETERS 
    -Name <String[]>  
        Names of refactor sets to update, accepts wildcards. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -Refactor <RefactorDefinition[]>  
        Direct input of refactor set objects instead of loading by name.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Files to add to the processing queue.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Files to remove from the processing queue.  
        Required?                    false  
        Position?                    4  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByModifiedDateFrom <DateTime>  
        Select files modified on or after this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByModifiedDateTo <DateTime>  
        Select files modified on or before this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByCreationDateFrom <DateTime>  
        Select files created on or after this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByCreationDateTo <DateTime>  
        Select files created on or before this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Key identifying which prompt script to use.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Direct prompt text to use for processing.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionScript <String>  
        PowerShell script for file selection logic.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionPrompt <String>  
        Content for LLM-based selection prompts.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -LLMQueryType <String>  
        Type of LLM query to perform.  
        Required?                    false  
        Position?                    named  
        Default value                Coding  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Model <String>  
        LLM model identifier for LM-Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <String>  
        Model retrieval identifier for LM-Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Temperature <Double>  
        Temperature setting for response randomness (0.0-1.0).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MaxToken <Int32>  
        Maximum tokens allowed in responses (-1 for default).  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TTLSeconds <Int32>  
        Time-to-live in seconds for API model requests.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Cpu <Int32>  
        Number of CPU cores to dedicate to AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Gpu <Int32>  
        GPU processing control (-2=Auto, -1=LM-Studio default).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiEndpoint <String>  
        API endpoint URL for LLM service.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiKey <String>  
        Authentication key for API access.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeoutSeconds <Int32>  
        The timeout in seconds for AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <Int32>  
        Processing priority level for this refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        PowerShell commands available during LLM selection.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send after opening file.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles [<SwitchParameter>]  
        Remove entries for files that no longer exist on disk. Without this parameter,  
        deleted files are preserved in collections but gracefully skipped during  
        processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AskBeforeLLMSelection [<SwitchParameter>]  
        Prompt before launching LLM invocations for file selections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PerformAutoSelections [<SwitchParameter>]  
        Enable LLM-based file selection processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PerformAISelections [<SwitchParameter>]  
        Process all files in the refactor set with LLM. Can also be used as  
        -PerformAISelections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RetryFailedLLMSelections [<SwitchParameter>]  
        Retry previously failed LLM selections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Clear [<SwitchParameter>]  
        Remove all files from the refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearLog [<SwitchParameter>]  
        Clear the refactor set's operation log.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Reset [<SwitchParameter>]  
        Start processing from beginning of refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ResetLMSelections [<SwitchParameter>]  
        Restart all LLM selections from beginning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MarkAllCompleted [<SwitchParameter>]  
        Mark all files as successfully refactored.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RedoLast [<SwitchParameter>]  
        Reprocess the last refactoring operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReprocessModifiedFiles [<SwitchParameter>]  
        Automatically reprocess files that have been modified since the last refactor  
        update.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Force stop LM-Studio before initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Open file in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Open file in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Speak [<SwitchParameter>]  
        Enable text-to-speech for operation details.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeRam [<SwitchParameter>]  
        Select configuration by available system RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam [<SwitchParameter>]  
        Select configuration by available GPU RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Adds a feature line to the README file with a timestamp.  

### SYNTAX 
```PowerShell 
Add-FeatureLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a feature line to the specified README file, prefixed with the current date  
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.  

### PARAMETERS 
    -Line <String>  
        The feature description text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to format the line as code in the README file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the README file after adding the line.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use the README file in the home directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use the README file in the OneDrive directory.  
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
 

##	Add-IdeaLineToREADME 
```PowerShell 

   Add-IdeaLineToREADME                 --> idea  
```` 

### SYNOPSIS 
    Adds an idea item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-IdeaLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped idea to the "## Ideas" section of a README.md file.  
    Can display the modified section and open in Visual Studio Code.  

### PARAMETERS 
    -Line <String>  
        The idea text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	Add-IssueLineToREADME 
```PowerShell 

   Add-IssueLineToREADME                --> issue  
```` 

### SYNOPSIS 
    Adds an issue item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-IssueLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped issue to the "## Issues" section of a README.md file.  
    Can display the modified section and open in Visual Studio Code.  

### PARAMETERS 
    -Line <String>  
        The issue text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	Add-LineToREADME 
```PowerShell 

   Add-LineToREADME  
```` 

### SYNOPSIS 
    Adds a line to a README.md markdown file in a specified section.  

### SYNTAX 
```PowerShell 
Add-LineToREADME [[-Line] <String>] [-Section] <String> [-Prefix] <String> [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Finds and modifies a README.md file by adding a new line to a specified section.  
    Can create the section if it doesn't exist. Supports formatting lines as code  
    blocks and showing the modified section.  
    Will look in current directory first, then walk up directories to find the README  
    location. If not found, will use the README in the PowerShell profile directory.  

### PARAMETERS 
    -Line <String>  
        The line of text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Section <String>  
        The section header where the line should be added.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prefix <String>  
        The prefix to add before the line (default: "* ").  
        Required?                    true  
        Position?                    3  
        Default value                *  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to open the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Done [<SwitchParameter>]  
        Switch to mark a todo item as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use README in PowerShell profile directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use README in OneDrive directory.  
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
 

##	Add-ReleaseNoteLineToREADME 
```PowerShell 

   Add-ReleaseNoteLineToREADME          --> ReleaseNote  
```` 

### SYNOPSIS 
    Adds a ReleaseNote line to the README file with a timestamp.  

### SYNTAX 
```PowerShell 
Add-ReleaseNoteLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a ReleaseNote line to the specified README file, prefixed with the current date  
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.  

### PARAMETERS 
    -Line <String>  
        The ReleaseNote description text to add to the README file.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch to format the line as code in the README file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Switch to display the README file after adding the line.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Switch to use the README file in the home directory.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Switch to use the README file in the OneDrive directory.  
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
 

##	Add-TodoLineToREADME 
```PowerShell 

   Add-TodoLineToREADME                 --> todo  
```` 

### SYNOPSIS 
    Adds a todo item to the README.md file.  

### SYNTAX 
```PowerShell 
Add-TodoLineToREADME [[-Line] <String>] [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Adds a timestamped todo item to the "## Todoos" section of a README.md file.  
    The todo items can be marked as done and the modified section can be displayed.  
    Each new todo item is automatically timestamped unless marking as done.  

### PARAMETERS 
    -Line <String>  
        The todo item text to add. Will be prefixed with current date if not empty.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the README in Visual Studio Code after modification.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Show [<SwitchParameter>]  
        Displays the modified section after changes.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Done [<SwitchParameter>]  
        Marks the specified todo item as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseHomeREADME [<SwitchParameter>]  
        Uses README in PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Uses README in OneDrive directory instead of current location.  
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
 

##	EnsureVSCodeInstallation 
```PowerShell 

   EnsureVSCodeInstallation  
```` 

### SYNOPSIS 
    Installs and configures Visual Studio Code with recommended extensions.  

### SYNTAX 
```PowerShell 
EnsureVSCodeInstallation [-Force] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Checks if Visual Studio Code is installed and if not, installs it using WinGet.  
    Configures user settings, keybindings, and installs recommended extensions from  
    the workspace configuration. Also sets up PSGallery as a trusted repository and  
    configures specific extension settings.  

### PARAMETERS 
    -Force [<SwitchParameter>]  
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
 

##	Features 
```PowerShell 

   Features  
```` 

### SYNOPSIS 
    Displays features from a README.md file.  

### SYNTAX 
```PowerShell 
Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all features from the "## Features" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Ideas 
```PowerShell 

   Ideas  
```` 

### SYNOPSIS 
    Displays ideas from a README.md file.  

### SYNTAX 
```PowerShell 
Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either  
    the README in the current location, PowerShell profile directory, or OneDrive  
    directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Issues 
```PowerShell 

   Issues  
```` 

### SYNOPSIS 
    Displays issues from a README.md file.  

### SYNTAX 
```PowerShell 
Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all issues from the "## Issues" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Open-SourceFileInIde 
```PowerShell 

   Open-SourceFileInIde                 --> editcode  
```` 

### SYNOPSIS 
    Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio).  

### SYNTAX 
```PowerShell 
Open-SourceFileInIde [-Path] <String> [[-LineNo] <Int32>] [[-KeysToSend] <String[]>] [-Code] [-VisualStudio] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function opens a specified source file in either Visual Studio Code or  
    Visual Studio. It can navigate directly to a specific line number and optionally  
    send keyboard inputs to the IDE after opening the file. The function will  
    attempt to determine which IDE to use based on the current host process, running  
    applications, or user selection.  

### PARAMETERS 
    -Path <String>  
        The path to the source file that should be opened in the IDE. Accepts both  
        relative and absolute paths, as well as paths with environment variables.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -LineNo <Int32>  
        The line number to navigate to when opening the file. Default is 0, which opens  
        the file without positioning to a specific line.  
        Required?                    false  
        Position?                    2  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Array of keyboard inputs to send to the application after opening. The function  
        will wait 2 seconds before sending the keys to ensure the IDE has loaded.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Switch parameter to force opening the file in Visual Studio Code regardless  
        of the current host process or other running IDEs.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Switch parameter to force opening the file in Visual Studio regardless of the  
        current host process or other running IDEs.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyEscape [<SwitchParameter>]  
        When specified, escapes special characters so they are sent as literal text  
        instead of being interpreted as control sequences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]  
        Prevents returning keyboard focus to PowerShell after sending keys.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter [<SwitchParameter>]  
        Sends Shift+Enter instead of regular Enter for line breaks.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <Int32>  
        Adds delay between sending different key sequences. Useful for slower apps.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Displays ReleaseNotes from a README.md file.  

### SYNTAX 
```PowerShell 
ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all ReleaseNotes from the "## ReleaseNotes" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	Todoos 
```PowerShell 

   Todoos  
```` 

### SYNOPSIS 
    Displays todo items from a README.md file.  

### SYNTAX 
```PowerShell 
Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Shows all todo items from the "## Todoos" section of a README.md file. Can use  
    either the README in the current location, PowerShell profile directory, or  
    OneDrive directory.  

### PARAMETERS 
    -UseHomeREADME [<SwitchParameter>]  
        Use README.md from PowerShell profile directory instead of current location.  
        Required?                    false  
        Position?                    1  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UseOneDriveREADME [<SwitchParameter>]  
        Use README.md from OneDrive directory instead of current location.  
        Required?                    false  
        Position?                    2  
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
 

##	VSCode 
```PowerShell 

   VSCode  
```` 

### SYNOPSIS 
    Opens one or more files in Visual Studio Code.  

### SYNTAX 
```PowerShell 
VSCode [-FilePath] <String[]> [-Copilot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function takes file paths and opens them in Visual Studio Code. It expands  
    paths and validates file existence before attempting to open them. The function  
    supports both direct file paths and pipeline input, making it ideal for quickly  
    opening multiple files from terminal searches.  

### PARAMETERS 
    -FilePath <String[]>  
        One or more file paths to open in Visual Studio Code. Accepts pipeline input  
        and wildcard patterns.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Copilot [<SwitchParameter>]  
        When specified, opens the file and triggers the Copilot keyboard shortcut to  
        start an edit session.  
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
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 

##	Get-GitChangedFiles 
```PowerShell 

   Get-GitChangedFiles                  --> Get-GitChangedFile, gitchanged  
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

### SYNOPSIS 
    Creates and pushes a new git commit with all changes.  

### SYNTAX 
```PowerShell 
New-GitCommit [[-Title] <String>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Stages all changes in the current git repository, creates a commit with the  
    specified title, and pushes the changes to the remote origin. Automatically sets  
    up upstream tracking if needed.  

### PARAMETERS 
    -Title <String>  
        The message to use for the git commit. If not specified, defaults to  
        "Improved scripts".  
        Required?                    false  
        Position?                    1  
        Default value                Improved scripts  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Permanently deletes specified folders from all branches in a Git repository.  

### SYNTAX 
```PowerShell 
PermanentlyDeleteGitFolders [-RepoUri] <String> [-Folders] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Cleans a Git repository by removing specified folders from the entire commit  
    history across all branches. This is done by cloning the repository, using  
    git filter-branch to remove the folders, and force pushing the changes back.  
    This operation is destructive and permanently rewrites Git history.  

### PARAMETERS 
    -RepoUri <String>  
        The Git repository URI to clean (HTTPS or SSH format).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Folders <String[]>  
        Array of folder paths to remove from the repository history. Paths can be  
        specified with forward or back slashes.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
```PowerShell 

       This operation is destructive and cannot be undone. It rewrites Git history and  
       requires force pushing, which affects all repository users.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> PermanentlyDeleteGitFolders `  
       -RepoUri "https://github.com/user/repo.git" `  
       -Folders "bin", "obj"  
```` 

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

### SYNOPSIS 
    Improves GenXdev cmdlet documentation and implementation through AI assistance.  

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdlet [[-CmdletName] <String>] [-ModuleName <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditPrompt] [-Integrate] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function enhances GenXdev cmdlets by analyzing and improving their code  
    through AI prompts. It can integrate cmdlets into modules, update documentation,  
    and verify proper implementation. The function supports custom prompt templates  
    and can open files in Visual Studio Code or Visual Studio.  

### PARAMETERS 
    -CmdletName <String>  
        The name or search pattern of the cmdlet to improve. Supports wildcards.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -PromptKey <String>  
        The key identifying which AI prompt template to use for improvements.  
        Required?                    false  
        Position?                    2  
        Default value                CheckAllRequirements  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom prompt text to override the template prompt.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoLocal [<SwitchParameter>]  
        Skip searching local module versions.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Only search published module versions.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files rather than module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens the cmdlet in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Opens the cmdlet in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        Only edit the AI prompt template without processing the cmdlet.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Integrate [<SwitchParameter>]  
        Integrate the cmdlet into a module if it's currently a standalone script.  
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
 

##	Assert-GenXdevCmdletTests 
```PowerShell 

   Assert-GenXdevCmdletTests            --> improvecmdlettests  
```` 

### SYNOPSIS 
    Asserts and improves unit-tests of a specified GenXdev cmdlet.  

### SYNTAX 
```PowerShell 
Assert-GenXdevCmdletTests [-CmdletName] <String> [[-Prompt] <String>] [[-PromptKey] <String>] [-EditPrompt] [-AssertFailedTest] [-FromScripts] [-ContinuationHandled] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function helps maintain and improve unit tests for GenXdev cmdlets by:  
    1. Creating test files if they do not exist  
    2. Opening the cmdlet in VS Code  
    3. Preparing and applying AI prompts for test generation/improvement  
    4. Managing test execution workflow  

### PARAMETERS 
    -CmdletName <String>  
        The name of the cmdlet to improve unit-tests for. Required.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to use for test generation. Optional.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        Switch to only edit the AI prompt without modifying the cmdlet. Optional.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AssertFailedTest [<SwitchParameter>]  
        Switch to indicate assertion of a failed test. Optional.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ContinuationHandled [<SwitchParameter>]  
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
 

##	Assert-GenXdevDependencyUsage 
```PowerShell 

   Assert-GenXdevDependencyUsage        --> checkgenxdevdependencies  
```` 

### SYNOPSIS 
    Validates dependency usage across GenXdev modules to ensure proper module  
    hierarchy is maintained.  

### SYNTAX 
```PowerShell 
Assert-GenXdevDependencyUsage [[-ModuleName] <String[]>] [-FromScripts] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function analyzes GenXdev modules to ensure they follow the correct  
    dependency hierarchy. It checks that modules only reference dependencies  
    that are listed in their RequiredModules manifest, and prevents circular  
    dependencies by validating that modules do not reference modules that come  
    later in the dependency chain.  

### PARAMETERS 
    -ModuleName <String[]>  
        Filter to apply to module names. Must match GenXdev naming pattern. Defaults  
        to checking all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
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
 

##	Assert-GenXdevTest 
```PowerShell 

   Assert-GenXdevTest                   --> Assert-GenXdevUnitTest, rungenxdevtests, testcmdlet  
```` 

### SYNOPSIS 
    Executesunit tests for GenXdev modules, sub-modules, or cmdlets  
    with intelligent debugging and AI-powered error resolution.  

### SYNTAX 
```PowerShell 
Assert-GenXdevTest [[-CmdletName] <String>] [[-TestFailedAction] <String>] [[-DefinitionMatches] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-IncludeScripts] [-OnlyReturnModuleNames] [-ExactMatch] [-Verbosity <String>] [-StackTraceVerbosity <String>] [-AllowLongRunningTests] [-SkipModuleImports] [-SkipPSAnalyzerTests] [-SkipPesterTests] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a testing framework for GenXdev modules,  
    offering multi-level test execution from entire modules down to individual  
    cmdlets. It integrates PSScriptAnalyzer for static code analysis, Pester for  
    unit testing, and Get-Help validation for documentation compliance. The  
    function includes intelligent error handling with AI-powered resolution  
    capabilities and detailed progress reporting for development workflows.  

### PARAMETERS 
    -CmdletName <String>  
        Search pattern to filter cmdlets for testing. Supports wildcards and allows  
        targeting specific cmdlets or groups of cmdlets matching the pattern.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -TestFailedAction <String>  
        Action to take when a test fails. Options include interactive prompting,  
        automatic continuation, stopping execution, AI-powered resolution, error  
        logging, or exception throwing for integration scenarios.  
        Required?                    false  
        Position?                    2  
        Default value                Continue  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefinitionMatches <String>  
        Regular expression to match cmdlet definitions during the search process.  
        This allows for advanced filtering based on cmdlet implementation patterns.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -ModuleName <String[]>  
        GenXdev module names to search and test. Must follow the pattern starting  
        with 'GenXdev' followed by optional sub-module components. Supports wildcards  
        for broad module selection.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Skip searching in local module paths during cmdlet discovery. When specified,  
        only published module paths will be considered for testing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Limit search to published module paths only. This excludes local development  
        modules and focuses on officially published GenXdev modules.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files. This allows testing of  
        standalone PowerShell scripts within the GenXdev ecosystem.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeScripts [<SwitchParameter>]  
        Include the scripts directory in addition to regular modules. This expands  
        the test scope to cover both modular and script-based functionality.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyReturnModuleNames [<SwitchParameter>]  
        Return only unique module names instead of full cmdlet details. Useful for  
        discovery and inventory operations rather than detailed testing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExactMatch [<SwitchParameter>]  
        Require exact matches for cmdlet names rather than wildcard matching. This  
        provides precise targeting for specific cmdlet testing scenarios.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Verbosity <String>  
        Output detail level for test execution. Controls the amount of information  
        displayed during test runs, from minimal to diagnostic output.  
        Required?                    false  
        Position?                    named  
        Default value                Normal  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -StackTraceVerbosity <String>  
        Stack trace detail level for error reporting. Determines how much call stack  
        information is included when errors occur during testing.  
        Required?                    false  
        Position?                    named  
        Default value                FirstLine  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AllowLongRunningTests [<SwitchParameter>]  
        Include unit tests that have long running durations in the test execution.  
        This enables testing including performance and integration tests.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipModuleImports [<SwitchParameter>]  
        Skip importing GenXdev modules before testing. This is useful when modules  
        are already loaded or when testing specific module loading scenarios.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipPSAnalyzerTests [<SwitchParameter>]  
        Skip invoking PSScriptAnalyzer tests during the test execution. This allows  
        focusing solely on functional testing when static analysis is not required.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipPesterTests [<SwitchParameter>]  
        Skip invoking Pester tests during the test execution. This allows focusing  
        solely on static analysis when functional testing is not required.  
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
 

##	Assert-ModuleDefinition 
```PowerShell 

   Assert-ModuleDefinition  
```` 

### SYNOPSIS 
    Assists in refactoring PowerShell source code files using AI assistance.  

### SYNTAX 
```PowerShell 
Assert-ModuleDefinition [-ModuleName] <String> [-Prompt <String>] [-EditPrompt] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the process of refactoring PowerShell code using AI.  
    It manages prompt templates, detects the active IDE (VS Code or Visual Studio),  
    and orchestrates the refactoring workflow through keyboard automation.  
    The function can handle both module manifest (.psd1) and module script (.psm1)  
    files.  

### PARAMETERS 
    -ModuleName <String>  
        The name of the PowerShell module to refactor. This module must be available  
        in the PowerShell module path.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to use for the refactoring process. If not specified,  
        defaults to an error message if module loading fails.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        When enabled, only opens the prompt template for editing without executing the  
        actual refactoring process.  
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
 

##	Assert-RefactorFile 
```PowerShell 

   Assert-RefactorFile  
```` 

### SYNOPSIS 
    Executes a refactoring operation on a source file using the specified IDE and  
    AI prompt template.  

### SYNTAX 
```PowerShell 
Assert-RefactorFile [-Path] <String> [[-RefactorSettings] <RefactorSettings>] [-AllowLongRunningTests] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the refactoring process by preparing an AI prompt based  
    on the refactor definition, detecting or selecting the appropriate IDE (VS Code  
    or Visual Studio), and opening the target file with the prepared prompt. The  
    function handles prompt template processing, IDE detection, and automation of  
    the refactoring workflow.  

### PARAMETERS 
    -Path <String>  
        The absolute or relative path to the source file that needs to be refactored.  
        The path will be expanded to an absolute path during processing.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RefactorSettings <RefactorSettings>  
        Required?                    false  
        Position?                    2  
        Default value                [GenXdev.Helpers.RefactorSettings]::new()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AllowLongRunningTests [<SwitchParameter>]  
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
 

##	Clear-GenXdevModules 
```PowerShell 

   Clear-GenXdevModules                 --> cleangenxdev  
```` 

### SYNOPSIS 
    Cleans build artifacts from GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Clear-GenXdevModules [<CommonParameters>] 
```` 

### DESCRIPTION 
    Removes build directories and artifacts from all GenXdev PowerShell modules in  
    the user's PowerShell Modules directory. Cleans both module root directories and  
    version-specific subdirectories, removing bin, obj, trash and other build  
    artifacts.  

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

### SYNOPSIS 
    Completes the README file for specified GenXDev modules by adding documentation.  

### SYNTAX 
```PowerShell 
Complete-GenXDevREADME [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function enhances README.md files for GenXDev modules by automatically  
    generating and inserting a cmdlet index and detailed cmdlet documentation. For  
    individual modules, it processes and updates existing README.md files with a  
    standardized format including a command index and detailed help for each cmdlet.  
    For the main GenXdev module, it creates a concise overview with links to GitHub  
    repositories instead of concatenating full module content, preventing the README  
    from becoming too large for parsers. Cmdlet indexes link to the corresponding  
    sections in the GitHub repository's README files.  

### PARAMETERS 
    -ModuleName <String[]>  
        Specifies which module(s) to process. If omitted, all modules will be processed.  
        Can accept multiple module names and supports pipeline input. Accepts string  
        array input.  
        Required?                    false  
        Position?                    1  
        Default value                @("GenXdev*")  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code.  

### SYNTAX 
```PowerShell 
EnsureCopilotKeyboardShortCut [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function ensures that GitHub Copilot Chat's file attachment feature has a proper  
    keyboard shortcut (Ctrl+Shift+Alt+F12) configured in Visual Studio Code.  
    It will remove any existing Copilot attachment shortcuts and replace them with the  
    current correct command (github.copilot.chat.attachFile).  
    Also adds Alt+` (backtick) shortcut for toggling the maximized panel.  

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

### SYNOPSIS 
    Analyzes GenXdev cmdlet usage patterns to identify most frequently called functions.  

### SYNTAX 
```PowerShell 
Get-GenXdevCmdletUsageAnalysis [[-OutputFormat] <String>] [[-Top] <Int32>] [-IncludeCallChains] [-IncludeScripts] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This script uses Get-GenXDevCmdlet to scan all GenXdev PowerShell modules and their  
    functions to analyze which cmdlets are called most frequently by other cmdlets.  
    This helps prioritize which functions to refactor to C# first, starting with the  
    most commonly used ones.  

### PARAMETERS 
    -OutputFormat <String>  
        Format for output: Table, List, or CSV. Default is Table.  
        Required?                    false  
        Position?                    1  
        Default value                Table  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top <Int32>  
        Number of top results to show. Default is 50.  
        Required?                    false  
        Position?                    2  
        Default value                50  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeCallChains [<SwitchParameter>]  
        Include detailed call chain information showing which functions call which.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeScripts [<SwitchParameter>]  
        Include script files in addition to module cmdlets.  
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
 

##	Get-GenXDevModule 
```PowerShell 

   Get-GenXDevModule  
```` 

### SYNOPSIS 
    Retrieves all GenXDev modules from a specified path.  

### SYNTAX 
```PowerShell 
Get-GenXDevModule [[-Path] <String>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function searches through a directory structure for GenXdev modules,  
    excluding any with '.local' in the name. For each valid module found, it returns  
    the most recent version folder (1.x) that contains a valid module manifest  
    (.psd1) file.  

### PARAMETERS 
    -Path <String>  
        The root directory to search for GenXdev modules. If not specified, defaults to  
        the parent directory of the script's location.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Retrieves detailed information about GenXdev PowerShell modules.  

### SYNTAX 
```PowerShell 
Get-GenXDevModuleInfo [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function examines GenXdev PowerShell modules and returns information about  
    their configuration, versions, and presence of key files. It can process either  
    specified modules or all available modules.  

### PARAMETERS 
    -ModuleName <String[]>  
        Array of module names to analyze. If empty, processes all available modules.  
        GenXdev.Local module is explicitly blocked from processing.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Retrieves GenXDev modules in dependency order.  

### SYNTAX 
```PowerShell 
Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function returns a list of GenXDev modules arranged in the correct dependency  
    order to ensure proper module loading. It first retrieves all module information  
    and then orders them based on their dependencies, starting with core modules and  
    ending with dependent modules. This ensures modules are loaded in the correct  
    sequence.  

### PARAMETERS 
    -ModuleName <String[]>  
        One or more module names to filter the results. If not provided, all modules are  
        returned in their dependency order. The function will maintain the correct  
        dependency chain even when filtering specific modules.  
        Required?                    false  
        Position?                    1  
        Default value                @('GenXdev*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-ModuleHelpMarkdown 
```PowerShell 

   Get-ModuleHelpMarkdown               --> Get-GenXDevModuleHelp  
```` 

### SYNOPSIS 
    Generates markdown help documentation for specified GenXDev modules.  

### SYNTAX 
```PowerShell 
Get-ModuleHelpMarkdown [[-ModuleName] <String[]>] [[-CommandNames] <String[]>] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function generates markdown help documentation for specified GenXDev modules  
    and their cmdlets. It processes each module and cmdlet, formatting the help  
    content into markdown with proper sections and code blocks. The output includes  
    syntax highlighting for PowerShell code blocks and proper formatting for  
    different help sections.  

### PARAMETERS 
    -ModuleName <String[]>  
        Specifies the name(s) of the module(s) to generate help for. Accepts wildcards.  
        If not specified, defaults to "GenXdev.*". Can be provided via pipeline.  
        Required?                    false  
        Position?                    1  
        Default value                GenXdev.*  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -CommandNames <String[]>  
        Optional array of cmdlet names to filter which commands to generate help for.  
        If not specified, documentation will be generated for all cmdlets in the module.  
        Supports wildcard patterns like "Get-*".  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-Refactor 
```PowerShell 

   Get-Refactor                         --> refactor, refactors, Show-RefactorReport  
```` 

### SYNOPSIS 
    Retrieves refactor definitions from GenXdev preferences based on name patterns.  

### SYNTAX 
```PowerShell 
Get-Refactor [[-Name] <String[]>] [-PreferencesDatabasePath <String>] [-DefaultValue <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Searches for and loads refactor definition sets stored in GenXdev preferences.  
    Each refactor set is stored as a JSON string in a preference with name starting  
    with 'refactor_set_'. The function deserializes matching sets into objects.  

### PARAMETERS 
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
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
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
 

##	Get-RefactorReport 
```PowerShell 

   Get-RefactorReport                   --> refactorreport  
```` 

### SYNOPSIS 
    Generates a detailed report of refactoring operations and their status.  

### SYNTAX 
```PowerShell 
Get-RefactorReport [[-Name] <String[]>] [-PreferencesDatabasePath <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-AsText] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Analyzes and reports on the progress of refactoring operations by examining  
    their current state, completion status, and affected functions. Provides output  
    in either structured hashtable format or human-readable aligned text columns.  
    The report includes refactor name, prompt key, priority, status, function count  
    and completion percentage.  

### PARAMETERS 
    -Name <String[]>  
        The name pattern to filter refactors. Supports wildcards. Multiple names can be  
        specified. Default value is "*" to display all refactors.  
        Required?                    false  
        Position?                    1  
        Default value                *  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AsText [<SwitchParameter>]  
        Outputs the report in human-readable text format with aligned columns instead of  
        structured hashtable objects. The text format includes headers and separators.  
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
 

##	Invoke-GenXdevPSFormatter 
```PowerShell 

   Invoke-GenXdevPSFormatter  
```` 

### SYNOPSIS 
    Formats PowerShell script files using PSScriptAnalyzer formatting rules.  

### SYNTAX 
```PowerShell 
Invoke-GenXdevPSFormatter [-Path] <String> [-Settings <Object>] [-Range <Int32[]>] [-Recurse] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function applies PowerShell formatting rules to script files using  
    PSScriptAnalyzer's Invoke-Formatter cmdlet. It can process individual files or  
    recursively format multiple files in directories. The function uses customizable  
    formatting settings and provides detailed logging of the formatting process.  

### PARAMETERS 
    -Path <String>  
        Specifies the path to the script file or directory to format. Accepts pipeline  
        input and supports various path aliases for compatibility.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Settings <Object>  
        A settings hashtable or a path to a PowerShell data file (.psd1) that contains  
        the formatting settings. If not specified, the function will attempt to load  
        settings from a predefined location or use built-in defaults.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Range <Int32[]>  
        The range within which formatting should take place as an array of four integers:  
        starting line number, starting column number, ending line number, ending column  
        number. If not specified, the entire file will be formatted.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Recurse [<SwitchParameter>]  
        Recursively process files in subdirectories when the Path parameter points to  
        a directory.  
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
 

##	Invoke-GenXdevScriptAnalyzer 
```PowerShell 

   Invoke-GenXdevScriptAnalyzer  
```` 

### SYNOPSIS 
    Invokes PowerShell Script Analyzer to analyze PowerShell scripts for compliance  
    and best practices.  

### SYNTAX 
```PowerShell 
Invoke-GenXdevScriptAnalyzer [-Path] <String> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]  
   Invoke-GenXdevScriptAnalyzer -ScriptDefinition <String> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function provides a wrapper around PSScriptAnalyzer to analyze PowerShell  
    scripts for compliance issues, best practices violations, and potential bugs.  
    It supports both file-based analysis and string-based script analysis with  
    customizable rules and settings.  

### PARAMETERS 
    -Path <String>  
        Specifies the path to the script file to analyze. This parameter is mandatory  
        when using the Path parameter set.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ScriptDefinition <String>  
        Specifies the script definition as a string to analyze. This parameter is  
        mandatory when using the Script parameter set.  
        Required?                    true  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableExit [<SwitchParameter>]  
        Specifies that the tool should exit on error during analysis.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fix [<SwitchParameter>]  
        Enables automatic fixing of violations where possible.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Recurse [<SwitchParameter>]  
        Recursively processes files in subdirectories when analyzing a directory path.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReportSummary [<SwitchParameter>]  
        Reports a summary after analysis showing the total number of issues found.  
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
 

##	New-GenXdevCmdlet 
```PowerShell 

   New-GenXdevCmdlet                    --> newcmd  
```` 

### SYNOPSIS 
    Creates a new GenXdev PowerShell cmdlet with proper structure and validation.  

### SYNTAX 
```PowerShell 
New-GenXdevCmdlet [-CmdletName] <String> [[-Synopsis] <String>] [[-Description] <String>] [[-BaseModuleName] <String>] [[-ModuleName] <String>] [[-CmdletAliases] <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new PowerShell cmdlet following GenXdev standards, including parameter  
    validation, help documentation, and proper verb-noun naming convention. Validates  
    the verb against approved PowerShell verbs and ensures proper casing of both verb  
    and noun components. Can integrate new cmdlets into existing module structures.  

### PARAMETERS 
    -CmdletName <String>  
        The name of the cmdlet to create. Must follow the Verb-Noun format using an  
        approved PowerShell verb.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Synopsis <String>  
        A brief description of the cmdlet's purpose for help documentation.  
        Required?                    false  
        Position?                    2  
        Default value                todo: A brief description of the cmdlet's purpose  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        A detailed description of what the cmdlet does for help documentation.  
        Required?                    false  
        Position?                    3  
        Default value                todo: [A detailed description of what the cmdlet does]  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -BaseModuleName <String>  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ModuleName <String>  
        The name of the base GenXdev module to integrate the cmdlet into.  
        Must match pattern GenXdev or GenXdev.SubModule.  
        Required?                    false  
        Position?                    5  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CmdletAliases <String[]>  
        One or more aliases for the cmdlet. Accepts an array of strings.  
        Required?                    false  
        Position?                    6  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        The AI prompt key used to select a template for generating the cmdlet content.  
        Defaults to "NewGenXdevCmdLet".  
        Required?                    false  
        Position?                    7  
        Default value                NewGenXdevCmdLet  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Custom AI prompt text to guide the generation of the cmdlet content.  
        Required?                    false  
        Position?                    8  
        Default value                Create a boilerplate GenXdev cmdlet that does what it's name suggests  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditPrompt [<SwitchParameter>]  
        When specified, only opens the AI prompt for editing without creating the cmdlet.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a new GenXdev PowerShell module with proper structure and configuration.  

### SYNTAX 
```PowerShell 
New-GenXdevModule [-ModuleName] <String> [-Description] <String> [[-Tags] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new PowerShell module following GenXdev standards by:  
    - Generating module manifest (psd1) with proper metadata  
    - Creating module script file (psm1)  
    - Setting up directory structure for functions and tests  
    - Adding required files like LICENSE and README  
    - Configuring version info and dependencies  

### PARAMETERS 
    -ModuleName <String>  
        The name of the module to create. Must follow GenXdev naming convention starting  
        with 'GenXdev.' followed by module identifier (e.g. GenXdev.Tools).  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        A brief description of the module's purpose and functionality. This will be used  
        in the module manifest and documentation.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Tags <String[]>  
        Optional array of tags for module discovery in PowerShell Gallery. Tags cannot  
        contain whitespace. Defaults to 'GenXdev'.  
        Required?                    false  
        Position?                    3  
        Default value                @('GenXdev')  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a pull request for changes made to a GenXdev module.  

### SYNTAX 
```PowerShell 
New-PullRequestForGenXdevModuleChanges [-ModuleName] <String> [[-CommitMessage] <String>] [[-PullRequestTitle] <String>] [[-PullRequestDescription] <String>] [[-GitUserName] <String>] [[-GitUserEmail] <String>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ShowWindow] [-RestoreFocus] [-PassThru] [-SideBySide] [-FocusWindow] [-SetForeground] [-Maximize] [-KeysToSend <String[]>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function automates the process of creating a pull request for changes made to  
    a GenXdev module. It handles GitHub authentication, repository forking, pull  
    request creation, and window positioning using the Set-WindowPosition function.  
    The function validates module dependencies, runs unit tests, and either creates  
    a GitHub pull request or uploads to genXdev.net depending on repository  
    availability.  

### PARAMETERS 
    -ModuleName <String>  
        The name of the GenXdev module to create a pull request for.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CommitMessage <String>  
        The commit message to use when committing changes.  
        Required?                    false  
        Position?                    2  
        Default value                Improvements to GenXdev module  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PullRequestTitle <String>  
        The title for the pull request.  
        Required?                    false  
        Position?                    3  
        Default value                Module improvements  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PullRequestDescription <String>  
        The description for the pull request.  
        Required?                    false  
        Position?                    4  
        Default value                These changes improve functionality and fix issues I encountered.  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -GitUserName <String>  
        Git username for commits.  
        Required?                    false  
        Position?                    5  
        Default value                Your Name  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -GitUserEmail <String>  
        Git email for commits.  
        Required?                    false  
        Position?                    6  
        Default value                you@example.com  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Monitor selection: 0=primary, 1+=specific monitor, -1=current, -2=secondary.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes window borders and title bar for a cleaner appearance.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Window width in pixels for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Window height in pixels for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Window horizontal position for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Window vertical position for positioning applications.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom half of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers window on screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShowWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RestoreFocus [<SwitchParameter>]  
        Returns focus to PowerShell window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns window helper object for further manipulation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Places windows side by side with PowerShell on the same monitor.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FocusWindow [<SwitchParameter>]  
        Focus the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SetForeground [<SwitchParameter>]  
        Set the window to foreground after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Maximize [<SwitchParameter>]  
        Maximize the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the window after positioning.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Creates a new refactoring set for code transformation tasks.  

### SYNTAX 
```PowerShell 
New-Refactor [-Name] <String> [-PromptKey] <String> [[-Prompt] <String>] [[-SelectionScript] <String>] [[-SelectionPrompt] <String>] [[-LLMQueryType] <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-MaxToken <Int32>] [-Cpu <Int32>] [-TTLSeconds <Int32>] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-Temperature <Double>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-FilesToAdd <FileInfo[]>] [-PreferencesDatabasePath <String>] [-AutoAddModifiedFiles] [-Force] [-SessionOnly] [-ClearSession] [-SkipSession] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates and configures a new refactoring definition with specified settings for  
    LLM-based code transformations. The function handles:  
    - Setting up refactoring configuration  
    - Configuring selection criteria and prompts  
    - Managing LLM model settings  
    - Integrating with development environments  
    - Persisting refactor definitions  

### PARAMETERS 
    -Name <String>  
        Unique identifier for the refactoring set. Must be non-empty and unique.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Key identifying which prompt template to use for refactoring operations.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Optional custom prompt text to override the template specified by PromptKey.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionScript <String>  
        PowerShell script defining selection criteria for items to refactor.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionPrompt <String>  
        Custom prompt text used by the LLM to guide selection of items for refactoring.  
        Required?                    false  
        Position?                    5  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -LLMQueryType <String>  
        The type of LLM query to perform (SimpleIntelligence, Knowledge, Pictures, etc.).  
        Required?                    false  
        Position?                    6  
        Default value                Coding  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Model <String>  
        Name or identifier of the specific LLM model to use for processing.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <String>  
        Identifier used to retrieve a specific model from LM Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MaxToken <Int32>  
        Maximum tokens allowed in LLM responses. Use -1 for model default.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Cpu <Int32>  
        The number of CPU cores to dedicate to AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TTLSeconds <Int32>  
        Time-to-live in seconds for API-loaded models. Use -1 for no expiration.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeRam [<SwitchParameter>]  
        Select configuration by available system RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam [<SwitchParameter>]  
        Select configuration by available GPU RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Temperature <Double>  
        Controls randomness in LLM responses (0.0-1.0). Lower is more deterministic.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Gpu <Int32>  
        GPU usage control: -2=Auto, -1=LM Studio default.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiEndpoint <String>  
        Custom API endpoint URL for accessing the LLM service.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiKey <String>  
        Authentication key required for API access.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeoutSeconds <Int32>  
        The timeout in seconds for AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <Int32>  
        Processing priority for this refactor set (higher numbers = higher priority).  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        Array of PowerShell cmdlet definitions to expose as tools to the LLM.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Array of files to initially include in the refactoring set.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AutoAddModifiedFiles [<SwitchParameter>]  
        When enabled, automatically adds any modified files to the refactoring queue.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Forces LM Studio to restart before initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Opens files in Visual Studio Code when enabled.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Opens files in Visual Studio when enabled.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Array of keystrokes to send after opening files.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Opens files in IDE that contain clipboard text  

### SYNTAX 
```PowerShell 
Open-GenXdevCmdletsContainingClipboardTextInIde [[-InputObject] <String>] [-Copilot] [<CommonParameters>] 
```` 

### DESCRIPTION 
    The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio  
    ##############################################################################  

### PARAMETERS 
    -InputObject <String>  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Copilot [<SwitchParameter>]  
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
 

##	Remove-Refactor 
```PowerShell 

   Remove-Refactor  
```` 

### SYNOPSIS 
    Removes refactor sets from GenXdev preferences system.  

### SYNTAX 
```PowerShell 
Remove-Refactor [-Name] <String[]> [[-RemoveDefault]] [-PreferencesDatabasePath <String>] [-DefaultValue <String>] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Manages refactor sets in the GenXdev preferences system by removing specified  
    entries. Works with both custom and default refactor sets. Default sets are  
    protected unless explicitly allowed for removal. All refactor sets are  
    identified by the prefix "refactor_set_" in the preferences system.  

### PARAMETERS 
    -Name <String[]>  
        One or more name patterns used to match refactor sets for removal. Supports  
        wildcard patterns like "*" and "?" for flexible matching. Multiple patterns can  
        be provided to target specific sets.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -RemoveDefault [<SwitchParameter>]  
        Switch parameter that, when enabled, allows the removal of protected default or  
        standard refactor sets. By default, these sets are protected from deletion.  
        Required?                    false  
        Position?                    2  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DefaultValue <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing.  

### SYNTAX 
```PowerShell 
Search-GenXdevCmdlet [[-CmdletName] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditCmdlet] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function searches for GenXdev cmdlets using a pattern and optionally opens  
    the found cmdlet's source file in Visual Studio Code or Visual Studio for  
    editing. It retrieves cmdlet information and provides keyboard shortcuts to  
    quickly navigate to the function definition.  

### PARAMETERS 
    -CmdletName <String>  
        Search pattern to filter cmdlets. Supports wildcards. Default is '*' to show  
        all cmdlets.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        GenXdev module names to search. Must match pattern starting with 'GenXdev'.  
        Default searches all GenXdev modules.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Skip searching in local module paths when finding cmdlets.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Limit search to published module paths only.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Search in script files instead of module files.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Open the found cmdlet in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Open the found cmdlet in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EditCmdlet [<SwitchParameter>]  
        Also opens the file in the editor after finding the cmdlet.  
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
 

##	Show-GenXdevCmdLetInIde 
```PowerShell 

   Show-GenXdevCmdLetInIde              --> editcmdlet  
```` 

### SYNOPSIS 
    Opens the specified GenXdev cmdlet in Visual Studio Code.  

### SYNTAX 
```PowerShell 
Show-GenXdevCmdLetInIde [[-CmdletName] <String>] [[-ModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-UnitTests] [-KeysToSend <String[]>] [-CoPilot] [-Search] [<CommonParameters>] 
```` 

### DESCRIPTION 
    This function retrieves the script file and line number for the specified GenXdev  
    cmdlet and opens it in Visual Studio Code. It can open either the main function  
    implementation or its associated unit tests, based on the UnitTests switch  
    parameter.  

### PARAMETERS 
    -CmdletName <String>  
        The name of the GenXdev cmdlet to locate and open in Visual Studio Code.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -ModuleName <String[]>  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -NoLocal [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPublished [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FromScripts [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -UnitTests [<SwitchParameter>]  
        When specified, opens the unit test file for the cmdlet instead of the main  
        implementation file.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CoPilot [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Search [<SwitchParameter>]  
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
 

##	SplitUpPsm1File 
```PowerShell 

   SplitUpPsm1File  
```` 

### SYNOPSIS 
    Splits a PowerShell module (.psm1) file into individual function files.  

### SYNTAX 
```PowerShell 
SplitUpPsm1File [-Psm1FilePath] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Takes a PowerShell module file and splits each function into separate .ps1 files  
    in a Functions subdirectory. Each function is extracted with its documentation  
    and saved in a file matching the function name. The original module file is  
    updated to dot-source all the split function files.  

### PARAMETERS 
    -Psm1FilePath <String>  
        The full path to the PowerShell module (.psm1) file that needs to be split into  
        individual function files. This path will be expanded to a full path if relative.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
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

### SYNOPSIS 
    Continues or restarts a code refactoring session.  

### SYNTAX 
```PowerShell 
Start-NextRefactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-Speak] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Manages code refactoring operations by processing refactor definitions in  
    priority order. Handles file selection, progress tracking, error handling, and  
    provides interactive user control over the refactoring process.  

### PARAMETERS 
    -Name <String[]>  
        Name pattern(s) of refactors to process. Accepts wildcards. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -FilesToAdd <FileInfo[]>  
        Files to include in the refactoring process.  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Files to exclude from the refactoring process.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles [<SwitchParameter>]  
        Remove files that no longer exist from the refactor set.  
        Required?                    false  
        Position?                    4  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Reset [<SwitchParameter>]  
        Restart processing from the beginning of the refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ResetLMSelections [<SwitchParameter>]  
        Restart all LLM selections in the refactoring process.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MarkAllCompleted [<SwitchParameter>]  
        Marks all files in the refactor set as completed.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RedoLast [<SwitchParameter>]  
        Repeat the last refactoring operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Speak [<SwitchParameter>]  
        Enables text-to-speech for refactoring progress and notifications.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Evaluates source files for refactoring eligibility using LLM analysis.  

### SYNTAX 
```PowerShell 
Test-RefactorLLMSelection [-RefactorDefinition] <RefactorDefinition> [-Path] <String> [<CommonParameters>] 
```` 

### DESCRIPTION 
    Uses Language Learning Model (LLM) analysis to determine if a source code file  
    should be selected for refactoring based on specified criteria. The function  
    processes the file content through an LLM query and returns a boolean response.  

### PARAMETERS 
    -RefactorDefinition <RefactorDefinition>  
        A RefactorDefinition object containing the LLM configuration and selection  
        criteria settings used to evaluate the source file.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Path <String>  
        The full filesystem path to the source code file that needs to be evaluated  
        for potential refactoring.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
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

### SYNOPSIS 
    Updates and manages refactoring sets including file selection and processing.  

### SYNTAX 
```PowerShell 
Update-Refactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-SelectionPrompt <String>] [-LLMQueryType <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Cpu <Int32>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-KeysToSend <String[]>] [-PreferencesDatabasePath <String>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformAutoSelections] [-PerformAISelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-ReprocessModifiedFiles] [-Force] [-Code] [-VisualStudio] [-Speak] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Update-Refactor [[-Refactor] <RefactorDefinition[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-SelectionPrompt <String>] [-LLMQueryType <String>] [-Model <String>] [-HuggingFaceIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Cpu <Int32>] [-Gpu <Int32>] [-ApiEndpoint <String>] [-ApiKey <String>] [-TimeoutSeconds <Int32>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-KeysToSend <String[]>] [-PreferencesDatabasePath <String>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformAutoSelections] [-PerformAISelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-ReprocessModifiedFiles] [-Force] [-Code] [-VisualStudio] [-Speak] [-SelectByFreeRam] [-SelectByFreeGpuRam] [-SessionOnly] [-ClearSession] [-SkipSession] [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Provides comprehensive management of refactoring sets by:  
    - Adding or removing files from processing queues  
    - Cleaning up deleted files from the set  
    - Managing state information and progress tracking  
    - Handling LLM-based file selection and processing  
    - Supporting both automatic and manual file management  
    - Maintaining detailed logs of all operations  
    - Gracefully handling deleted files (skipped unless CleanUpDeletedFiles is used)  

### PARAMETERS 
    -Name <String[]>  
        Names of refactor sets to update, accepts wildcards. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                @('*')  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -Refactor <RefactorDefinition[]>  
        Direct input of refactor set objects instead of loading by name.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToAdd <FileInfo[]>  
        Files to add to the processing queue.  
        Required?                    false  
        Position?                    3  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -FilesToRemove <FileInfo[]>  
        Files to remove from the processing queue.  
        Required?                    false  
        Position?                    4  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByModifiedDateFrom <DateTime>  
        Select files modified on or after this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByModifiedDateTo <DateTime>  
        Select files modified on or before this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByCreationDateFrom <DateTime>  
        Select files created on or after this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByCreationDateTo <DateTime>  
        Select files created on or before this date.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PromptKey <String>  
        Key identifying which prompt script to use.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Prompt <String>  
        Direct prompt text to use for processing.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionScript <String>  
        PowerShell script for file selection logic.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectionPrompt <String>  
        Content for LLM-based selection prompts.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -LLMQueryType <String>  
        Type of LLM query to perform.  
        Required?                    false  
        Position?                    named  
        Default value                Coding  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Model <String>  
        LLM model identifier for LM-Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HuggingFaceIdentifier <String>  
        Model retrieval identifier for LM-Studio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Temperature <Double>  
        Temperature setting for response randomness (0.0-1.0).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MaxToken <Int32>  
        Maximum tokens allowed in responses (-1 for default).  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TTLSeconds <Int32>  
        Time-to-live in seconds for API model requests.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Cpu <Int32>  
        Number of CPU cores to dedicate to AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Gpu <Int32>  
        GPU processing control (-2=Auto, -1=LM-Studio default).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiEndpoint <String>  
        API endpoint URL for LLM service.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ApiKey <String>  
        Authentication key for API access.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -TimeoutSeconds <Int32>  
        The timeout in seconds for AI operations.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Priority <Int32>  
        Processing priority level for this refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ExposedCmdLets <ExposedCmdletDefinition[]>  
        PowerShell commands available during LLM selection.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send after opening file.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferencesDatabasePath <String>  
        Database path for preference data files.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -CleanUpDeletedFiles [<SwitchParameter>]  
        Remove entries for files that no longer exist on disk. Without this parameter,  
        deleted files are preserved in collections but gracefully skipped during  
        processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AskBeforeLLMSelection [<SwitchParameter>]  
        Prompt before launching LLM invocations for file selections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PerformAutoSelections [<SwitchParameter>]  
        Enable LLM-based file selection processing.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PerformAISelections [<SwitchParameter>]  
        Process all files in the refactor set with LLM. Can also be used as  
        -PerformAISelections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RetryFailedLLMSelections [<SwitchParameter>]  
        Retry previously failed LLM selections.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Clear [<SwitchParameter>]  
        Remove all files from the refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearLog [<SwitchParameter>]  
        Clear the refactor set's operation log.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Reset [<SwitchParameter>]  
        Start processing from beginning of refactor set.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ResetLMSelections [<SwitchParameter>]  
        Restart all LLM selections from beginning.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -MarkAllCompleted [<SwitchParameter>]  
        Mark all files as successfully refactored.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RedoLast [<SwitchParameter>]  
        Reprocess the last refactoring operation.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReprocessModifiedFiles [<SwitchParameter>]  
        Automatically reprocess files that have been modified since the last refactor  
        update.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Force stop LM-Studio before initialization.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Code [<SwitchParameter>]  
        Open file in Visual Studio Code.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VisualStudio [<SwitchParameter>]  
        Open file in Visual Studio.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Speak [<SwitchParameter>]  
        Enable text-to-speech for operation details.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeRam [<SwitchParameter>]  
        Select configuration by available system RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SelectByFreeGpuRam [<SwitchParameter>]  
        Select configuration by available GPU RAM.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SessionOnly [<SwitchParameter>]  
        Use alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ClearSession [<SwitchParameter>]  
        Clear alternative settings stored in session for AI preferences.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SkipSession [<SwitchParameter>]  
        Store settings only in persistent preferences without affecting session.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
