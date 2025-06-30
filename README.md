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
| [EnsureVSCodeInstallation](#EnsureVSCodeInstallation) |  | Installs and configures Visual Studio Code with recommended extensions. |
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
| [Get-GitChangedFiles](#Get-GitChangedFiles) | gitchanged, get-gitchangedfile | Get the list of changed files in a Git repository. |
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
| [Clear-GenXdevModules](#Clear-GenXdevModules) | cleangenxdev | Cleans build artifacts from GenXdev PowerShell modules. |
| [Complete-GenXDevREADME](#Complete-GenXDevREADME) |  | Completes the README file for specified GenXDev modules by adding documentation. |
| [EnsureCopilotKeyboardShortCut](#EnsureCopilotKeyboardShortCut) |  | Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code. |
| [Get-GenXDevModule](#Get-GenXDevModule) |  | Retrieves all GenXDev modules from a specified path. |
| [Get-GenXDevModuleInfo](#Get-GenXDevModuleInfo) |  | Retrieves detailed information about GenXdev PowerShell modules. |
| [Get-GenXDevNewModulesInOrderOfDependency](#Get-GenXDevNewModulesInOrderOfDependency) |  | Retrieves GenXDev modules in dependency order. |
| [Get-GenXDevNextCmdLet](#Get-GenXDevNextCmdLet) |  | Retrieves the next GenXdev cmdlet to be improved. |
| [Get-ModuleHelpMarkdown](#Get-ModuleHelpMarkdown) | get-genxdevmodulehelp | Generates markdown help documentation for specified GenXDev modules. |
| [Get-Refactor](#Get-Refactor) | refactor | Retrieves refactor definitions from GenXdev preferences based on name patterns. |
| [Get-RefactorReport](#Get-RefactorReport) | refactorreport | Generates a detailed report of refactoring operations and their status. |
| [Invoke-GenXdevScriptAnalyzer](#Invoke-GenXdevScriptAnalyzer) |  |  |
| [New-GenXdevCmdlet](#New-GenXdevCmdlet) | gcmd | Creates a new GenXdev PowerShell cmdlet with proper structure and validation. |
| [New-GenXdevModule](#New-GenXdevModule) |  | Creates a new GenXdev PowerShell module with proper structure and configuration. |
| [New-PullRequestForGenXdevModuleChanges](#New-PullRequestForGenXdevModuleChanges) | prgenxdevmodule | Creates a pull request for changes made to a GenXdev module. |
| [New-Refactor](#New-Refactor) | newrefactor | Creates a new refactoring set for code transformation tasks. |
| [Open-GenXdevCmdletsContainingClipboardTextInIde](#Open-GenXdevCmdletsContainingClipboardTextInIde) | vscodeclipboard | Opens files in IDE that contain clipboard text |
| [Remove-Refactor](#Remove-Refactor) |  | Removes refactor sets from GenXdev preferences system. |
| [Search-GenXdevCmdlet](#Search-GenXdevCmdlet) | searchcmdlet |  |
| [Search-NextGenXdevCmdlet](#Search-NextGenXdevCmdlet) | nextcmdlet |  |
| [Show-GenXdevCmdLetInIde](#Show-GenXdevCmdLetInIde) | editcmdlet | Opens the specified GenXdev cmdlet in Visual Studio Code. |
| [Show-RefactorReport](#Show-RefactorReport) | refactors | Displays a formatted report of refactoring information for specified modules. |
| [SplitUpPsm1File](#SplitUpPsm1File) |  | Splits a PowerShell module (.psm1) file into individual function files. |
| [Start-NextRefactor](#Start-NextRefactor) | nextrefactor | Continues or restarts a code refactoring session. |
| [Test-RefactorLLMSelection](#Test-RefactorLLMSelection) |  | Evaluates source files for refactoring eligibility using LLM analysis. |
| [Update-Refactor](#Update-Refactor) | updaterefactor | Updates and manages refactoring sets including file selection and processing. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Coding<hr/> 
NAME
    Add-FeatureLineToREADME
    
SYNOPSIS
    Adds a feature line to the README file with a timestamp.
    
    
SYNTAX
    Add-FeatureLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
    
    
DESCRIPTION
    Adds a feature line to the specified README file, prefixed with the current date
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Add-FeatureLineToREADME -Line "Added new Git feature"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > feature "Added new Git feature" -Code -Show
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Add-IdeaLineToREADME
    
SYNOPSIS
    Adds an idea item to the README.md file.
    
    
SYNTAX
    Add-IdeaLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
    
    
DESCRIPTION
    Adds a timestamped idea to the "## Ideas" section of a README.md file.
    Can display the modified section and open in Visual Studio Code.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Add-IdeaLineToREADME -Line "Create new PowerShell module" -Show
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > idea "New feature idea" -UseOneDriveREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Add-IssueLineToREADME
    
SYNOPSIS
    Adds an issue item to the README.md file.
    
    
SYNTAX
    Add-IssueLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
    
    
DESCRIPTION
    Adds a timestamped issue to the "## Issues" section of a README.md file.
    Can display the modified section and open in Visual Studio Code.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Add-IssueLineToREADME -Line "Found critical bug" -Show -UseHomeREADME
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > issue "Server connection fails" -Show
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Add-LineToREADME
    
SYNOPSIS
    Adds a line to a README.md markdown file in a specified section.
    
    
SYNTAX
    Add-LineToREADME [[-Line] <String>] [-Section] <String> [-Prefix] <String> [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
    
    
DESCRIPTION
    Finds and modifies a README.md file by adding a new line to a specified section.
    Can create the section if it doesn't exist. Supports formatting lines as code
    blocks and showing the modified section.
    
    Will look in current directory first, then walk up directories to find the README
    location. If not found, will use the README in the PowerShell profile directory.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Add-LineToREADME -Line "New feature" -Section "## Features" -Prefix "- [ ] "
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Add-LineToREADME "New feature" "## Features" "* " -Show
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Add-ReleaseNoteLineToREADME
    
SYNOPSIS
    Adds a ReleaseNote line to the README file with a timestamp.
    
    
SYNTAX
    Add-ReleaseNoteLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
    
    
DESCRIPTION
    Adds a ReleaseNote line to the specified README file, prefixed with the current date
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Add-ReleaseNoteLineToREADME -Line "Added new Git ReleaseNote"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > ReleaseNote "Added new Git ReleaseNote" -Code -Show
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Add-TodoLineToREADME
    
SYNOPSIS
    Adds a todo item to the README.md file.
    
    
SYNTAX
    Add-TodoLineToREADME [[-Line] <String>] [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
    
    
DESCRIPTION
    Adds a timestamped todo item to the "## Todoos" section of a README.md file.
    The todo items can be marked as done and the modified section can be displayed.
    Each new todo item is automatically timestamped unless marking as done.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Add-TodoLineToREADME -Line "Implement new feature" -Show -Code
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > todo "Fix bug" -Done
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    EnsureVSCodeInstallation
    
SYNOPSIS
    Installs and configures Visual Studio Code with recommended extensions.
    
    
SYNTAX
    EnsureVSCodeInstallation [<CommonParameters>]
    
    
DESCRIPTION
    Checks if Visual Studio Code is installed and if not, installs it using WinGet.
    Configures user settings, keybindings, and installs recommended extensions from
    the workspace configuration. Also sets up PSGallery as a trusted repository and
    configures specific extension settings.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > EnsureVSCodeInstallation
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Features
    
SYNOPSIS
    Displays features from a README.md file.
    
    
SYNTAX
    Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
    
    
DESCRIPTION
    Shows all features from the "## Features" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Features -UseHomeREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Ideas
    
SYNOPSIS
    Displays ideas from a README.md file.
    
    
SYNTAX
    Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
    
    
DESCRIPTION
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either
    the README in the current location, PowerShell profile directory, or OneDrive
    directory.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Ideas -UseHomeREADME
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Ideas -UseOneDriveREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Issues
    
SYNOPSIS
    Displays issues from a README.md file.
    
    
SYNTAX
    Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
    
    
DESCRIPTION
    Shows all issues from the "## Issues" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Issues -UseHomeREADME
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Issues -UseOneDriveREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-SourceFileInIde
    
SYNOPSIS
    Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio).
    
    
SYNTAX
    Open-SourceFileInIde [-Path] <String> [[-LineNo] <Int32>] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    This function opens a specified source file in either Visual Studio Code or
    Visual Studio. It can navigate directly to a specific line number and optionally
    send keyboard inputs to the IDE after opening the file. The function will
    attempt to determine which IDE to use based on the current host process, running
    applications, or user selection.
    

PARAMETERS
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
        
    -KeysToSend <String[]>
        Array of keyboard inputs to send to the application after opening. The function
        will wait 2 seconds before sending the keys to ensure the IDE has loaded.
        
        Required?                    false
        Position?                    named
        Default value                @()
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-SourceFileInIde -Path "C:\Projects\MyScript.ps1" -LineNo 25 -Code
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > editcode "C:\Projects\MyScript.ps1" 25
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    ReleaseNotes
    
SYNOPSIS
    Displays ReleaseNotes from a README.md file.
    
    
SYNTAX
    ReleaseNotes [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
    
    
DESCRIPTION
    Shows all ReleaseNotes from the "## ReleaseNotes" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > ReleaseNotes -UseHomeREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Todoos
    
SYNOPSIS
    Displays todo items from a README.md file.
    
    
SYNTAX
    Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
    
    
DESCRIPTION
    Shows all todo items from the "## Todoos" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Todoos -UseHomeREADME
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Todoos -UseOneDriveREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    VSCode
    
SYNOPSIS
    Opens one or more files in Visual Studio Code.
    
    
SYNTAX
    VSCode [-FilePath] <String[]> [-Copilot] [<CommonParameters>]
    
    
DESCRIPTION
    This function takes file paths and opens them in Visual Studio Code. It expands
    paths and validates file existence before attempting to open them. The function
    supports both direct file paths and pipeline input, making it ideal for quickly
    opening multiple files from terminal searches.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > VSCode -FilePath "C:\path\to\file.txt" -Copilot
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-ChildItem *.js -Recurse | VSCode
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.Git<hr/> 
NAME
    Get-GitChangedFiles
    
SYNOPSIS
    Get the list of changed files in a Git repository.
    
    
SYNTAX
    Get-GitChangedFiles [-PassThru] [<CommonParameters>]
    
    
DESCRIPTION
    This function retrieves the list of files that have been changed in the current Git repository.
    It can be used to identify which files have been modified, added, or deleted.
    By default, returns relative paths with .\ prefix. Use -PassThru to get FileInfo objects.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-GitChangedFile
    Returns relative paths like ".\Modules\GenXdev.AI\1.198.2025\README.md"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-GitChangedFile -PassThru
    Returns FileInfo objects for each changed file
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    New-GitCommit
    
SYNOPSIS
    Creates and pushes a new git commit with all changes.
    
    
SYNTAX
    New-GitCommit [[-Title] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Stages all changes in the current git repository, creates a commit with the
    specified title, and pushes the changes to the remote origin. Automatically sets
    up upstream tracking if needed.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > New-GitCommit -Title "Added new authentication feature"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > commit "Hotfix for login issue"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    PermanentlyDeleteGitFolders
    
SYNOPSIS
    Permanently deletes specified folders from all branches in a Git repository.
    
    
SYNTAX
    PermanentlyDeleteGitFolders [-RepoUri] <String> [-Folders] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Cleans a Git repository by removing specified folders from the entire commit
    history across all branches. This is done by cloning the repository, using
    git filter-branch to remove the folders, and force pushing the changes back.
    This operation is destructive and permanently rewrites Git history.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    System.String[]
    
    
NOTES
    
    
        This operation is destructive and cannot be undone. It rewrites Git history and
        requires force pushing, which affects all repository users.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > PermanentlyDeleteGitFolders `
        -RepoUri "https://github.com/user/repo.git" `
        -Folders "bin", "obj"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Coding.PowerShell.Modules<hr/> 
NAME
    Add-MissingGenXdevUnitTests
    
SYNTAX
    Add-MissingGenXdevUnitTests [<CommonParameters>]
    
    
PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    None
    
    
OUTPUTS
    System.Object
    
ALIASES
    None
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Assert-GenXdevCmdlet
    
SYNOPSIS
    Improves GenXdev cmdlet documentation and implementation through AI assistance.
    
    
SYNTAX
    Assert-GenXdevCmdlet [[-CmdletName] <String>] [-BaseModuleName <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditPrompt] [-Integrate] [<CommonParameters>]
    
    
DESCRIPTION
    This function enhances GenXdev cmdlets by analyzing and improving their code
    through AI prompts. It can integrate cmdlets into modules, update documentation,
    and verify proper implementation. The function supports custom prompt templates
    and can open files in Visual Studio Code or Visual Studio.
    

PARAMETERS
    -CmdletName <String>
        The name or search pattern of the cmdlet to improve. Supports wildcards.
        
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  true
        
    -BaseModuleName <String[]>
        Array of GenXdev module names to search within. Must match pattern
        "GenXdev.*".
        
        Required?                    false
        Position?                    named
        Default value                @("GenXdev*")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Assert-GenXdevCmdlet -CmdletName "Get-Something" -PromptKey "CheckDocs" -Code
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > improvecmdlet Get-Something CheckDocs -c
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Assert-GenXdevCmdletTests
    
SYNOPSIS
    Asserts and improves unit-tests of a specified GenXdev cmdlet.
    
    
SYNTAX
    Assert-GenXdevCmdletTests [-CmdletName] <String> [[-Prompt] <String>] [[-PromptKey] <String>] [-EditPrompt] [-AssertFailedTest] [-FromScripts] [<CommonParameters>]
    
    
DESCRIPTION
    This function helps maintain and improve unit tests for GenXdev cmdlets by:
    1. Creating test files if they don't exist
    2. Opening the cmdlet in VS Code
    3. Preparing and applying AI prompts for test generation/improvement
    4. Managing test execution workflow
    

PARAMETERS
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
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Assert-GenXdevCmdletTests -CmdletName "Get-GenXDevModuleInfo" -EditPrompt
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > improvecmdlettests Get-GenXDevModuleInfo -AssertFailedTest
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Assert-GenXdevDependencyUsage
    
SYNTAX
    Assert-GenXdevDependencyUsage [[-BaseModuleName] <string[]>] [-FromScripts] [<CommonParameters>]
    
    
PARAMETERS
    -BaseModuleName <string[]>
        Filter to apply to module names
        
        Required?                    false
        Position?                    1
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Parameter set name           (All)
        Aliases                      Module, ModuleName
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
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    System.String[]
    
    
OUTPUTS
    System.Object
    
ALIASES
    checkgenxdevdependencies
    checkgenxdevdependencies
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Assert-GenXdevUnitTest
    
SYNOPSIS
    Executes unit tests for specified PowerShell modules and cmdlets with detailed
    reporting.
    
    
SYNTAX
    Assert-GenXdevUnitTest [[-BaseModuleName] <String[]>] [-ModuleFilter <String[]>] [-CmdletName <String>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Verbosity <String>] [-StackTraceVerbosity <String>] [-AllowLongRunningTests] [-DebugFailedTests] [-Passthru] [<CommonParameters>]
    
    
DESCRIPTION
    This script provides a comprehensive test runner for PowerShell modules and
    cmdlets. It offers configurable verbosity levels, interactive debugging of
    failed tests, and color-coded output. Results can be displayed directly or
    returned as objects for pipeline processing.
    
    The script supports filtering by module name or specific cmdlet, handling of
    local vs published modules, and various output formatting options.
    

PARAMETERS
    -BaseModuleName <String[]>
        Target modules to test. Accepts wildcards and multiple module names.
        Default value: "GenXdev*"
        
        Required?                    false
        Position?                    1
        Default value                @("GenXdev*")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -ModuleFilter <String[]>
        Optional filter to exclude certain modules from testing.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -CmdletName <String>
        Name of specific cmdlet to test. Limits testing scope to just this cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoLocal [<SwitchParameter>]
        When specified, excludes local development versions of modules from testing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -OnlyPublished [<SwitchParameter>]
        When specified, only tests modules that have been published to repositories.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FromScripts [<SwitchParameter>]
        When specified, sources tests from script files rather than module files.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Verbosity <String>
        Controls detail level of test output.
        Valid values: None, Normal, Detailed, Diagnostic
        
        Required?                    false
        Position?                    named
        Default value                None
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -StackTraceVerbosity <String>
        Controls stack trace detail in error output.
        Valid values: None, FirstLine, Filtered, Full
        
        Required?                    false
        Position?                    named
        Default value                FirstLine
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AllowLongRunningTests [<SwitchParameter>]
        When specified, includes tests marked as long-running in the test execution.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DebugFailedTests [<SwitchParameter>]
        When specified, enables interactive debugging of failed tests with retry option.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Passthru [<SwitchParameter>]
        When specified, returns test result objects instead of formatted console output.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Assert-GenXdevUnitTest -BaseModuleName "MyModule" -Verbosity Detailed `
        -StackTraceVerbosity Full -DebugFailedTests
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Assert-GenXdevUnitTest "MyModule*" -NoLocal -OnlyPublished
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Assert-ModuleDefinition
    
SYNOPSIS
    Assists in refactoring PowerShell source code files using AI assistance.
    
    
SYNTAX
    Assert-ModuleDefinition [-ModuleName] <String> [-Prompt <String>] [-EditPrompt] [<CommonParameters>]
    
    
DESCRIPTION
    This function automates the process of refactoring PowerShell code using AI.
    It manages prompt templates, detects the active IDE (VS Code or Visual Studio),
    and orchestrates the refactoring workflow through keyboard automation.
    The function can handle both module manifest (.psd1) and module script (.psm1)
    files.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Assert-ModuleDefinition -ModuleName "MyModule" -EditPrompt
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "MyModule" | Assert-ModuleDefinition
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Assert-NextGenXdevCmdlet
    
SYNOPSIS
    Asserts and improves the next GenXdev cmdlet in sequence.
    
    
SYNTAX
    Assert-NextGenXdevCmdlet [[-ModuleName] <String>] [[-Key] <String>] [[-PromptKey] <String>] [[-Prompt] <String>] [-EditPrompt] [-FromScripts] [-Integrate] [-OnlyNonExisting] [<CommonParameters>]
    
    
DESCRIPTION
    This function processes GenXdev cmdlets one at a time, opening them in Visual
    Studio Code and updating their AI prompts. It can filter by module name, reset
    the sequence, customize prompts, and handle scripts integration.
    

PARAMETERS
    -ModuleName <String>
        Name of the module to filter cmdlets by. Accepts wildcards. Default: "GenXdev.*"
        
        Required?                    false
        Position?                    1
        Default value                GenXdev.*
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  true
        
    -Key <String>
        Storage key for tracking the current cmdlet index in the sequence.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PromptKey <String>
        Template key for selecting the AI prompt to use.
        
        Required?                    false
        Position?                    3
        Default value                CheckAllRequirements
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Prompt <String>
        Custom AI prompt text to override the template.
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -EditPrompt [<SwitchParameter>]
        Switch to modify only the AI prompt without changing the cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FromScripts [<SwitchParameter>]
        Switch to process scripts from the script folder instead of module cmdlets.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Integrate [<SwitchParameter>]
        Switch to integrate scripts from the script folder into the module.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -OnlyNonExisting [<SwitchParameter>]
        Switch to skip cmdlets that already have associated unit tests.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Assert-NextGenXdevCmdlet -ModuleName "GenXdev.Helpers" `
                            -PromptKey "CheckAllRequirements" `
                            -Reset
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > nextcmdlet GenXdev.Helpers -Reset
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Assert-NextGenXdevCmdletTest
    
SYNOPSIS
    Automates testing improvements for GenXdev cmdlets by managing test creation.
    
    
SYNTAX
    Assert-NextGenXdevCmdletTest [[-ModuleName] <String>] [[-Reset]] [[-RedoLast]] [[-Key] <String>] [[-Prompt] <String>] [[-PromptKey] <String>] [-EditPrompt] [-OnlyNonExisting] [<CommonParameters>]
    
    
DESCRIPTION
    Systematically processes GenXdev cmdlets to create or improve their unit tests.
    It can work through cmdlets sequentially, allowing for AI-assisted test
    generation using customizable prompts. The function maintains state to track
    progress and can skip cmdlets that already have tests.
    

PARAMETERS
    -ModuleName <String>
        The module name pattern to filter cmdlets (e.g., "GenXdev.*"). Used to focus
        test creation on specific modules.
        
        Required?                    false
        Position?                    1
        Default value                GenXdev.*
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  true
        
    -Reset [<SwitchParameter>]
        When specified, restarts the cmdlet processing from the beginning of the list.
        
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RedoLast [<SwitchParameter>]
        When specified, processes the same cmdlet again instead of moving to the next.
        
        Required?                    false
        Position?                    3
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Key <String>
        Custom identifier for storing the progress state. The string ".Tests" will be
        appended to this key.
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Prompt <String>
        Custom AI prompt text to use for test generation guidance.
        
        Required?                    false
        Position?                    5
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PromptKey <String>
        
        Required?                    false
        Position?                    6
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -EditPrompt [<SwitchParameter>]
        When specified, allows editing of the AI prompt without processing the cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -OnlyNonExisting [<SwitchParameter>]
        When specified, skips cmdlets that already have unit tests implemented.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Assert-NextGenXdevCmdletTest -ModuleName "GenXdev.Helpers" `
                                 -Reset `
                                 -OnlyNonExisting
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > nextcmdlettest GenXdev.Helpers -Reset
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Assert-RefactorFile
    
SYNTAX
    Assert-RefactorFile [-RefactorDefinition] <RefactorDefinition> [-Path] <string> [-EditPrompt] [<CommonParameters>]
    
    
PARAMETERS
    -EditPrompt
        Switch to only edit the AI prompt
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Path <string>
        The path to the sourcefile to improve
        
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      FullName
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -RefactorDefinition <RefactorDefinition>
        The refactor definition
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    None
    
    
OUTPUTS
    System.Object
    
ALIASES
    None
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Clear-GenXdevModules
    
SYNOPSIS
    Cleans build artifacts from GenXdev PowerShell modules.
    
    
SYNTAX
    Clear-GenXdevModules [<CommonParameters>]
    
    
DESCRIPTION
    Removes build directories and artifacts from all GenXdev PowerShell modules in
    the user's PowerShell Modules directory. Cleans both module root directories and
    version-specific subdirectories, removing bin, obj, trash and other build
    artifacts.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > .\clean-genxdev-modules.ps1 -Verbose
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Complete-GenXDevREADME
    
SYNOPSIS
    Completes the README file for specified GenXDev modules by adding documentation.
    
    
SYNTAX
    Complete-GenXDevREADME [[-ModuleName] <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    This function enhances README.md files for GenXDev modules by automatically
    generating and inserting a cmdlet index and detailed cmdlet documentation. It
    processes either specified modules or all modules if none are specified. The
    function updates existing README.md files with a standardized format including
    a command index and detailed help for each cmdlet.
    

PARAMETERS
    -ModuleName <String[]>
        Specifies which module(s) to process. If omitted, all modules will be processed.
        Can accept multiple module names and supports pipeline input. Accepts string array
        input.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Complete-GenXDevREADME -ModuleName "GenXdev.Helpers"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "GenXdev.Helpers" | Complete-GenXDevREADME
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    EnsureCopilotKeyboardShortCut
    
SYNOPSIS
    Configures the GitHub Copilot Chat keyboard shortcuts in Visual Studio Code.
    
    
SYNTAX
    EnsureCopilotKeyboardShortCut [<CommonParameters>]
    
    
DESCRIPTION
    This function ensures that GitHub Copilot Chat's file attachment feature has a proper
    keyboard shortcut (Ctrl+Shift+Alt+F12) configured in Visual Studio Code.
    
    It will remove any existing Copilot attachment shortcuts and replace them with the
    current correct command (github.copilot.chat.attachFile).
    
    Also adds Alt+` (backtick) shortcut for toggling the maximized panel.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > EnsureCopilotKeyboardShortCut
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-GenXDevModule
    
SYNOPSIS
    Retrieves all GenXDev modules from a specified path.
    
    
SYNTAX
    Get-GenXDevModule [[-Path] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function searches through a directory structure for GenXdev modules,
    excluding any with '.local' in the name. For each valid module found, it returns
    the most recent version folder (1.x) that contains a valid module manifest
    (.psd1) file.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-GenXDevModule -Path "C:\PowerShell\Modules"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-GenXDevModule "C:\PowerShell\Modules"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-GenXDevModuleInfo
    
SYNOPSIS
    Retrieves detailed information about GenXdev PowerShell modules.
    
    
SYNTAX
    Get-GenXDevModuleInfo [[-ModuleName] <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    This function examines GenXdev PowerShell modules and returns information about
    their configuration, versions, and presence of key files. It can process either
    specified modules or all available modules.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-GenXDevModuleInfo -ModuleName "GenXdev.Console"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "GenXdev.Console" | Get-GenXDevModuleInfo
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-GenXDevNewModulesInOrderOfDependency
    
SYNOPSIS
    Retrieves GenXDev modules in dependency order.
    
    
SYNTAX
    Get-GenXDevNewModulesInOrderOfDependency [[-ModuleName] <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of GenXDev modules arranged in the correct dependency
    order to ensure proper module loading. It first retrieves all module information
    and then orders them based on their dependencies, starting with core modules and
    ending with dependent modules. This ensures modules are loaded in the correct
    sequence.
    

PARAMETERS
    -ModuleName <String[]>
        One or more module names to filter the results. If not provided, all modules are
        returned in their dependency order. The function will maintain the correct
        dependency chain even when filtering specific modules.
        
        Required?                    false
        Position?                    1
        Default value                @('GenXdev*')
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-GenXDevNewModulesInOrderOfDependency -ModuleName "GenXdev.Helpers"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "GenXdev.Console" | Get-GenXDevNewModulesInOrderOfDependency
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-GenXDevNextCmdLet
    
SYNOPSIS
    Retrieves the next GenXdev cmdlet to be improved.
    
    
SYNTAX
    Get-GenXDevNextCmdLet [[-CmdletName] <String>] [[-BaseModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Reset] [-RedoLast] [-Key <String>] [-OnlyNonExisting] [<CommonParameters>]
    
    
DESCRIPTION
    This function manages a sequential list of GenXdev cmdlets for systematic
    improvement. It tracks progress using a key-value store and can filter cmdlets by
    module name. The function supports starting over, redoing the last cmdlet, and
    filtering for cmdlets without unit tests.
    

PARAMETERS
    -CmdletName <String>
        
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  true
        
    -BaseModuleName <String[]>
        
        Required?                    false
        Position?                    2
        Default value                @("GenXdev*")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
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
        Switch to process scripts from the Scripts folder instead of module cmdlets.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Reset [<SwitchParameter>]
        Switch to restart the sequence from the beginning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RedoLast [<SwitchParameter>]
        Switch to process the previous cmdlet again instead of advancing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Key <String>
        Custom key name for storing progress in the key-value store.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -OnlyNonExisting [<SwitchParameter>]
        Switch to skip cmdlets that already have unit tests.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-GenXDevNextCmdLet -ModuleName "GenXdev.Helpers" -Reset
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-GenXDevNextCmdLet GenXdev.Helpers
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-ModuleHelpMarkdown
    
SYNOPSIS
    Generates markdown help documentation for specified GenXDev modules.
    
    
SYNTAX
    Get-ModuleHelpMarkdown [[-ModuleName] <String[]>] [[-CommandNames] <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    This function generates markdown help documentation for specified GenXDev modules
    and their cmdlets. It processes each module and cmdlet, formatting the help
    content into markdown with proper sections and code blocks. The output includes
    syntax highlighting for PowerShell code blocks and proper formatting for
    different help sections.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-ModuleHelpMarkdown -ModuleName "GenXdev.Helpers" -CommandNames "Get-*"
    Generates markdown documentation for all Get-* cmdlets in GenXdev.Helpers.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "GenXdev.Helpers" | Get-GenXDevModuleHelp
    Uses pipeline to generate documentation for all cmdlets in GenXdev.Helpers.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-Refactor
    
SYNOPSIS
    Retrieves refactor definitions from GenXdev preferences based on name patterns.
    
    
SYNTAX
    Get-Refactor [[-Name] <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    Searches for and loads refactor definition sets stored in GenXdev preferences.
    Each refactor set is stored as a JSON string in a preference with name starting
    with 'refactor_set_'. The function deserializes matching sets into objects.
    

PARAMETERS
    -Name <String[]>
        One or more name patterns to match against refactor set names. Patterns are
        matched against the portion of the preference name after 'refactor_set_' prefix.
        Supports wildcards. If omitted, returns all refactor sets.
        
        Required?                    false
        Position?                    1
        Default value                @("*")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  true
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    GenXdev.Helpers.RefactorDefinition[]
    
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-Refactor -Name "CodeStyle*"
    # Returns refactor definitions matching pattern "CodeStyle*"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > refactor "UnitTest"
    # Uses alias to find refactor definitions containing "UnitTest"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-RefactorReport
    
SYNOPSIS
    Generates a detailed report of refactoring operations and their status.
    
    
SYNTAX
    Get-RefactorReport [[-Name] <String[]>] [-AsText] [<CommonParameters>]
    
    
DESCRIPTION
    Analyzes and reports on the progress of refactoring operations by examining
    their current state, completion status, and affected functions. Provides output
    in either structured hashtable format or human-readable aligned text columns.
    The report includes refactor name, prompt key, priority, status, function count
    and completion percentage.
    

PARAMETERS
    -Name <String[]>
        The name pattern to filter refactors. Supports wildcards. Multiple names can be
        specified. Default value is "*" to display all refactors.
        
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  true
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-RefactorReport -Name "DatabaseRefactor" -AsText
    Generates a text report for refactors matching "DatabaseRefactor"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > refactorreport "*"
    Generates hashtable report for all refactors using alias
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Invoke-GenXdevScriptAnalyzer
    
SYNTAX
    Invoke-GenXdevScriptAnalyzer [-Path] <string> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]
    
    Invoke-GenXdevScriptAnalyzer -ScriptDefinition <string> [-EnableExit] [-Fix] [-Recurse] [-ReportSummary] [<CommonParameters>]
    
    
PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    None
    
    
OUTPUTS
    System.Object
    
ALIASES
    None
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    New-GenXdevCmdlet
    
SYNOPSIS
    Creates a new GenXdev PowerShell cmdlet with proper structure and validation.
    
    
SYNTAX
    New-GenXdevCmdlet [-CmdletName] <String> [[-Synopsis] <String>] [[-Description] <String>] [[-BaseModuleName] <String>] [[-ModuleName] <String>] [[-CmdletAliases] <String[]>] [[-PromptKey] <String>] [[-Prompt] <String>] [-EditPrompt] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a new PowerShell cmdlet following GenXdev standards, including parameter
    validation, help documentation, and proper verb-noun naming convention. Validates
    the verb against approved PowerShell verbs and ensures proper casing of both verb
    and noun components. Can integrate new cmdlets into existing module structures.
    

PARAMETERS
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
        The name of the base GenXdev module to integrate the cmdlet into.
        Must match pattern GenXdev or GenXdev.SubModule.
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ModuleName <String>
        The name of the specific GenXdev submodule to integrate the cmdlet into.
        Must match pattern GenXdev.SubModule.Component.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > New-GenXdevCmdlet -CmdletName "Get-SystemInfo" -Synopsis "Gets system information" `
        -Description "Retrieves detailed system information" -ModuleName "GenXdev.System"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > gcmd Get-SystemInfo -EditPrompt
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    New-GenXdevModule
    
SYNOPSIS
    Creates a new GenXdev PowerShell module with proper structure and configuration.
    
    
SYNTAX
    New-GenXdevModule [-ModuleName] <String> [-Description] <String> [[-Tags] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a new PowerShell module following GenXdev standards by:
    - Generating module manifest (psd1) with proper metadata
    - Creating module script file (psm1)
    - Setting up directory structure for functions and tests
    - Adding required files like LICENSE and README
    - Configuring version info and dependencies
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > New-GenXdevModule `
        -ModuleName "GenXdev.Example" `
        -Description "Example module demonstrating GenXdev standards" `
        -Tags @('GenXdev','Example','Demo')
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    New-PullRequestForGenXdevModuleChanges
    
SYNOPSIS
    Creates a pull request for changes made to a GenXdev module.
    
    
SYNTAX
    New-PullRequestForGenXdevModuleChanges [-ModuleName] <String> [[-CommitMessage] <String>] [[-PullRequestTitle] <String>] [[-PullRequestDescription] <String>] [[-GitUserName] <String>] [[-GitUserEmail] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    This function automates the process of creating a pull request for changes made to
    a GenXdev module. It handles GitHub authentication, repository forking, and pull
    request creation.
    

PARAMETERS
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
        
        Required?                    false
        Position?                    5
        Default value                Your Name
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -GitUserEmail <String>
        
        Required?                    false
        Position?                    6
        Default value                you@example.com
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > New-PullRequestForGenXdevModuleChanges -ModuleName "GenXdev.Coding" `
        -CommitMessage "Added new features" `
        -PullRequestTitle "New Features" `
        -PullRequestDescription "Added support for X and Y"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > prmodule GenXdev.Coding "Bug fixes" "Fixed issues" "Various bug fixes implemented"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    New-Refactor
    
SYNOPSIS
    Creates a new refactoring set for code transformation tasks.
    
    
SYNTAX
    New-Refactor [-Name] <String> [-PromptKey] <String> [[-Prompt] <String>] [[-SelectionScript] <String>] [[-SelectionPrompt] <String>] [[-Model] <String>] [[-ModelLMSGetIdentifier] <String>] [[-Temperature] <Double>] [[-MaxToken] <Int32>] [[-TTLSeconds] <Int32>] [[-Gpu] <Int32>] [[-Priority] <Int32>] [[-ExposedCmdLets] <ExposedCmdletDefinition[]>] [-FilesToAdd <FileInfo[]>] [-ApiEndpoint <String>] [-ApiKey <String>] [-AutoAddModifiedFiles] [-Force] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Creates and configures a new refactoring definition with specified settings for
    LLM-based code transformations. The function handles:
    - Setting up refactoring configuration
    - Configuring selection criteria and prompts
    - Managing LLM model settings
    - Integrating with development environments
    - Persisting refactor definitions
    

PARAMETERS
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
        
    -Model <String>
        Name or identifier of the specific LLM model to use for processing.
        
        Required?                    false
        Position?                    6
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ModelLMSGetIdentifier <String>
        Identifier used to retrieve a specific model from LM Studio.
        
        Required?                    false
        Position?                    7
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Temperature <Double>
        Controls randomness in LLM responses (0.0-1.0). Lower is more deterministic.
        
        Required?                    false
        Position?                    8
        Default value                0.2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -MaxToken <Int32>
        Maximum tokens allowed in LLM responses. Use -1 for model default.
        
        Required?                    false
        Position?                    9
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -TTLSeconds <Int32>
        Time-to-live in seconds for API-loaded models. Use -1 for no expiration.
        
        Required?                    false
        Position?                    10
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Gpu <Int32>
        GPU usage control: -2=Auto, -1=LM Studio default.
        
        Required?                    false
        Position?                    11
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Priority <Int32>
        Processing priority for this refactor set (higher numbers = higher priority).
        
        Required?                    false
        Position?                    12
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ExposedCmdLets <ExposedCmdletDefinition[]>
        Array of PowerShell cmdlet definitions to expose as tools to the LLM.
        
        Required?                    false
        Position?                    13
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > New-Refactor -Name "UpdateLogging" -PromptKey "LoggingRefactor" `
        -SelectionScript "Get-LoggingMethods" -Priority 1 `
        -Model "qwen2.5-14b-instruct" -Code
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > newrefactor UpdateLogging LoggingRefactor -p "Get-LoggingMethods" -c
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GenXdevCmdletsContainingClipboardTextInIde
    
SYNOPSIS
    Opens files in IDE that contain clipboard text
    
    
SYNTAX
    Open-GenXdevCmdletsContainingClipboardTextInIde [-Copilot] [<CommonParameters>]
    
    
DESCRIPTION
    The text in the clipboard is used to search in all GenXdev scripts and when found opens that file in Code or Visual Studio
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Remove-Refactor
    
SYNOPSIS
    Removes refactor sets from GenXdev preferences system.
    
    
SYNTAX
    Remove-Refactor [-Name] <String[]> [[-RemoveDefault]] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Manages refactor sets in the GenXdev preferences system by removing specified
    entries. Works with both custom and default refactor sets. Default sets are
    protected unless explicitly allowed for removal. All refactor sets are
    identified by the prefix "refactor_set_" in the preferences system.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Remove-Refactor -Name "CustomRefactor" -RemoveDefault
    # Removes a specific refactor set named "CustomRefactor" and allows removal
    # of default sets if matched
    
    # Removes all non-default refactor sets using the alias
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Search-GenXdevCmdlet
    
SYNTAX
    Search-GenXdevCmdlet [[-CmdletName] <string>] [[-BaseModuleName] <string[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-EditCmdlet] [<CommonParameters>]
    
    
PARAMETERS
    -BaseModuleName <string[]>
        GenXdev module names to search
        
        Required?                    false
        Position?                    1
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Parameter set name           (All)
        Aliases                      Module, ModuleName
        Dynamic?                     false
        Accept wildcard characters?  false
        
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
        The ide to open the file in
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -EditCmdlet
        Also opens the file in the editor
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    System.String[]
    
    
OUTPUTS
    System.Object
    
ALIASES
    searchcmdlet
    searchcmdlet
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Search-NextGenXdevCmdlet
    
SYNTAX
    Search-NextGenXdevCmdlet [[-ModuleName] <string>] [[-Key] <string>] [-OnlyNonExisting] [<CommonParameters>]
    
    Search-NextGenXdevCmdlet [[-Key] <string>] [-FromScripts] [-OnlyNonExisting] [<CommonParameters>]
    
    
PARAMETERS
    -FromScripts
        Switch to scripts from the script folder
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           FromScripts
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Key <string>
        Key for storing the last cmdlet index
        
        Required?                    false
        Position?                    3
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -ModuleName <string>
        Optional module name to filter cmdlets by
        
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Parameter set name           Default
        Aliases                      Name, Module
        Dynamic?                     false
        Accept wildcard characters?  true
        
    -OnlyNonExisting
        Indicates to skip cmdlets that already have unit-tests
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    System.String
    
    
OUTPUTS
    System.Object
    
ALIASES
    nextcmdlet
    nextcmdlet
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Show-GenXdevCmdLetInIde
    
SYNOPSIS
    Opens the specified GenXdev cmdlet in Visual Studio Code.
    
    
SYNTAX
    Show-GenXdevCmdLetInIde [[-CmdletName] <String>] [[-BaseModuleName] <String[]>] [-NoLocal] [-OnlyPublished] [-FromScripts] [-Code] [-VisualStudio] [-UnitTests] [-KeysToSend <String[]>] [-CoPilot] [-Search] [<CommonParameters>]
    
    
DESCRIPTION
    This function retrieves the script file and line number for the specified GenXdev
    cmdlet and opens it in Visual Studio Code. It can open either the main function
    implementation or its associated unit tests, based on the UnitTests switch
    parameter.
    

PARAMETERS
    -CmdletName <String>
        The name of the GenXdev cmdlet to locate and open in Visual Studio Code.
        
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  true
        
    -BaseModuleName <String[]>
        
        Required?                    false
        Position?                    2
        Default value                @("GenXdev*")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Show-GenXdevCmdLetInIde -CmdletName "Get-GenXDevModuleInfo"
    Opens the implementation of Get-GenXDevModuleInfo in VSCode.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > editcmdlet Get-GenXDevModuleInfo -UnitTests
    Opens the unit tests for Get-GenXDevModuleInfo using the alias.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Show-RefactorReport
    
SYNOPSIS
    Displays a formatted report of refactoring information for specified modules.
    
    
SYNTAX
    Show-RefactorReport [[-Name] <String[]>] [-Full] [<CommonParameters>]
    
    
DESCRIPTION
    Shows a table containing refactoring status and metrics for PowerShell modules
    matching the specified name pattern. The report includes details like name,
    prompt key, status, function count, priority and completion percentage.
    

PARAMETERS
    -Name <String[]>
        One or more module name patterns to filter the report. Supports wildcards.
        If omitted, shows all modules.
        
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  true
        
    -Full [<SwitchParameter>]
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Show-RefactorReport -Name "GenXdev.*"
    Shows refactoring status for all GenXdev modules.
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > refactors *
    Shows refactoring status for all modules using the alias.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    SplitUpPsm1File
    
SYNOPSIS
    Splits a PowerShell module (.psm1) file into individual function files.
    
    
SYNTAX
    SplitUpPsm1File [-Psm1FilePath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Takes a PowerShell module file and splits each function into separate .ps1 files
    in a Functions subdirectory. Each function is extracted with its documentation
    and saved in a file matching the function name. The original module file is
    updated to dot-source all the split function files.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > SplitUpPsm1File -Psm1FilePath "C:\Modules\MyModule\MyModule.psm1"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > split "C:\Modules\MyModule\MyModule.psm1"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Start-NextRefactor
    
SYNOPSIS
    Continues or restarts a code refactoring session.
    
    
SYNTAX
    Start-NextRefactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [[-CleanUpDeletedFiles]] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-RedoLast] [-EditPrompt] [-Speak] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Manages code refactoring operations by processing refactor definitions in priority
    order. Handles file selection, progress tracking, error handling, and provides
    interactive user control over the refactoring process.
    

PARAMETERS
    -Name <String[]>
        Name pattern(s) of refactors to process. Accepts wildcards. Default is "*".
        
        Required?                    false
        Position?                    1
        Default value                @("*")
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
        
    -EditPrompt [<SwitchParameter>]
        Only modify the AI prompt for the refactoring.
        
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Start-NextRefactor -Name "RefactorProject" -Reset -CleanUpDeletedFiles
    Restarts refactoring for "RefactorProject" and removes deleted files.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Test-RefactorLLMSelection
    
SYNOPSIS
    Evaluates source files for refactoring eligibility using LLM analysis.
    
    
SYNTAX
    Test-RefactorLLMSelection [-RefactorDefinition] <RefactorDefinition> [-Path] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Uses Language Learning Model (LLM) analysis to determine if a source code file
    should be selected for refactoring based on specified criteria. The function
    processes the file content through an LLM query and returns a boolean response.
    

PARAMETERS
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Test-RefactorLLMSelection -RefactorDefinition $refDef -Path "C:\source.ps1"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > $def | Test-RefactorLLMSelection -Path source.ps1
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Update-Refactor
    
SYNOPSIS
    Updates and manages refactoring sets including file selection and processing.
    
    
SYNTAX
    Update-Refactor [[-Name] <String[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformLLMSelections] [-PerformAllLLMSelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-RedoLast] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-AutoAddModifiedFiles] [-SelectionPrompt <String>] [-Model <String>] [-ModelLMSGetIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Gpu <Int32>] [-Force] [-ApiEndpoint <String>] [-ApiKey <String>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-Speak] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    Update-Refactor [[-Refactor] <RefactorDefinition[]>] [[-FilesToAdd] <FileInfo[]>] [[-FilesToRemove] <FileInfo[]>] [-CleanUpDeletedFiles] [-AskBeforeLLMSelection] [-PerformLLMSelections] [-PerformAllLLMSelections] [-RetryFailedLLMSelections] [-Clear] [-ClearLog] [-Reset] [-ResetLMSelections] [-MarkAllCompleted] [-SelectByModifiedDateFrom <DateTime>] [-SelectByModifiedDateTo <DateTime>] [-SelectByCreationDateFrom <DateTime>] [-SelectByCreationDateTo <DateTime>] [-RedoLast] [-PromptKey <String>] [-Prompt <String>] [-SelectionScript <String>] [-AutoAddModifiedFiles] [-SelectionPrompt <String>] [-Model <String>] [-ModelLMSGetIdentifier <String>] [-Temperature <Double>] [-MaxToken <Int32>] [-TTLSeconds <Int32>] [-Gpu <Int32>] [-Force] [-ApiEndpoint <String>] [-ApiKey <String>] [-Priority <Int32>] [-ExposedCmdLets <ExposedCmdletDefinition[]>] [-Code] [-VisualStudio] [-KeysToSend <String[]>] [-Speak] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Provides comprehensive management of refactoring sets by:
    - Adding or removing files from processing queues
    - Cleaning up deleted files from the set
    - Managing state information and progress tracking
    - Handling LLM-based file selection and processing
    - Supporting both automatic and manual file management
    - Maintaining detailed logs of all operations
    

PARAMETERS
    -Name <String[]>
        Names of refactor sets to update, accepts wildcards. Default is "*".
        
        Required?                    false
        Position?                    1
        Default value                @("*")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  true
        
    -Refactor <RefactorDefinition[]>
        Direct input of refactor set objects instead of loading by name.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FilesToAdd <FileInfo[]>
        Files to add to the processing queue.
        
        Required?                    false
        Position?                    2
        Default value                @()
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FilesToRemove <FileInfo[]>
        Files to remove from the processing queue.
        
        Required?                    false
        Position?                    3
        Default value                @()
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -CleanUpDeletedFiles [<SwitchParameter>]
        Remove entries for files that no longer exist on disk.
        
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
        
    -PerformLLMSelections [<SwitchParameter>]
        Enable LLM-based file selection processing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PerformAllLLMSelections [<SwitchParameter>]
        Process all files in the refactor set with LLM.
        
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
        
    -RedoLast [<SwitchParameter>]
        Reprocess the last refactoring operation.
        
        Required?                    false
        Position?                    named
        Default value                False
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
        
    -AutoAddModifiedFiles [<SwitchParameter>]
        Automatically add modified files to processing queue.
        
        Required?                    false
        Position?                    named
        Default value                False
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
        
    -Model <String>
        LLM model identifier for LM-Studio.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  true
        
    -ModelLMSGetIdentifier <String>
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
        Default value                0.2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -MaxToken <Int32>
        Maximum tokens allowed in responses (-1 for default).
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -TTLSeconds <Int32>
        Time-to-live in seconds for API model requests.
        
        Required?                    false
        Position?                    named
        Default value                -1
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
        
    -Force [<SwitchParameter>]
        Force stop LM-Studio before initialization.
        
        Required?                    false
        Position?                    named
        Default value                False
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
        
    -KeysToSend <String[]>
        Keystrokes to send after opening file.
        
        Required?                    false
        Position?                    named
        Default value                @()
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
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Update-Refactor -Name "CodeCleanup" -FilesToAdd ".\src\*.cs" `
        -CleanUpDeletedFiles -PerformLLMSelections
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Get-Refactor "MyRefactor" | Update-Refactor -Reset -Clear
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
