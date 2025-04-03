# Powershell script development and execution environment
<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

## Issues
- [ ] 20250326 --> need template for  refactors
- [ ] 20250322 --> :\Program Files\dotnet\sdk\9.0.202\Sdks\NuGet.Build.Tasks.Pack\build\NuGet.Build.Tasks.Pack.targets(221,5): warning NU5111: The script file 'Tests\GenXdev.Webbrowser\Get-ChromiumRemoteDebuggingPort.Tests.ps1' is not recognized by NuGet and hence will not be executed during installation of this package. Rename it to install.ps1, uninstall.ps1 or init.ps1 and place it directly under 'tools'. [C:\Users\renev\AppData\Local\Temp\57ae084a-3ecb-47dc-ab00-80c571f5935d\Temp.csproj]
- [ ] 20250224 --> ParseAndFixErrorInIde -> fixerror (myinvocation, all output types, commandline -> [PromptForGithubCopilotToFixProblem, errorReferences: [{ filename, linenumber, errormessage, stacktrace }]
- [ ] 20250224 --> Add-GenXdevUnitTest
- [ ] 20250223 --> Rename-GenXdevCmdlet [-NewAliases @()]
- [ ] 20250223 --> Assert-GenXdevCmdlet [-MoveToModule 'somemodule']
- [ ] 20250223 --> Move-GenXdevCmdletsToModule

- [ ] 20250316 --> sdel and error output
- [ ] 20250314 --> powershell.genxdev.net -> portrait tiles in landscape mode, multi columns
- [ ] 20250313 --> add realtime transcriptions
- [ ] 20250312 --> media .mkv in zelfde dir
- [ ] 20250311 --> media e:\incoming\*1923*s02e03* from vscode with terminal open will focus terminal
- [ ] 20250309 --> new-llmchat open clean vm, is nog niet in orde
- [ ] 20250308 --> wp gaat nog steeds terug naar pwsh window
- [ ] 20250302 --> _AssertGenXdevUnitTests's Write-Error, need invocation too
- [ ] 20250301 --> need to add functionality to error handles that invoke AI to fix it, need to parse error message for other cmdlets and if there add them to the ai context

## Todoos
- [ ] 20250323 --> flowtech nozzle
- [ ] 20250322 --> find code iamlazy in mmx and implement
- [ ] 20250227 --> playwright docs in -online help for et and st
- [ ] 20210727 --> updating Windows terminal or pwsh
- [ ] 20210727 --> search for revisitedClose
- [ ] 20210727 --> badge in genxdev.queries readme.md
- [ ] 20250223 --> Playwright; white bg; auto enable js; events like onVisibilityChange
- [ ] 20250223 --> qvideos: 'S' for subscription toggle, doesn't work
- [ ] 20250223 --> wb: no repositioning window anymore when no URL

- [ ] 20250223 --> 1-by-1 improve -> 'integrate'
- [ ] 20250223 --> refactors: a functions that create them using preselectors for prompts and SelectionScripts
- [ ] 20250223 --> Remove-GenXdevModule, Remove-GenXdevCmdlet
- [ ] 20250223 --> Add-NewGenXdevModule, Add-NewGenXdevCmdlet
- [ ] 20250223 --> media extend with saving playlist and parsing of playlist for file selections
- [ ] 20250223 --> qvideos: -AsJob
- [ ] 20250223 --> When idle on PowerShell.genxdev.net, start videos, music, or cool examples automatically
- [ ] 20250223 --> Find_Item better examples in documentation
- [ ] 20250223 --> GenXdev.Webbrowser extend with own Playwright engine, for et, st, ct, nav, etc
- [ ] 20250223 --> No RefactorSet, or everything RefactorSet
- [ ] 20250223 --> Get-RefactorLog
- [ ] 20250223 --> switches always last, and never mandatory
- [ ] 20250223 --> paramfrompipeline, $input, valuefrompipeline CHECK, SANITY UNIT TESTS
- [ ] 20250223 --> bjork
- [ ] 20250223 --> bookmark 'AI\'
- [ ] 20250223 --> no default page for wb without URL, but try to connect to existing or if not found do nothing
- [ ] 20250223 --> check 2025 screenshots made
- [ ] 20250222 --> replace 1.170.2025 with a function
- [ ] 20250221 --> automate module name prefixes for function calls
- [ ] 20250221 --> assert-cmdlet* don't use Open-SourceFileInIde Yet
- [ ] 20250219 --> register-engineevent -?
- [ ] 20250219 --> update-refactorset and such: load configuration restore state, save
- [ ] 20250217 --> Find_Item extend with possibilities like c:\users\guest*\desktop\*.jpg
- [ ] 20250216 --> Get-IdenticalFunctionParams should check if $null values can be set, if so do that
- [ ] 20250216 --> Accept wildcard characters? false
- [ ] 20250215 --> check if playwright also allows -Firefox for st, et, etc
- [ ] 20250213 --> wb -sidebyside
- [ ] 20250206 --> why migrate only from modeldev, also from other modules to other models
- [ ] 20250206 --> Use of preferences and set-preference functions for GenXdev.AI
- [ ] 20250206 --> language defaults according to locale using Get-GenXdevPreference also for Open-WikipediaQuery
- [ ] 20250203 --> add imdb advanced search property to Open-IMDBQuery, and which one next?
- [ ] 20250202 --> ask extend with -LLM <llmname>
- [ ] 20250201 --> https://aka.ms/deprecateLicenseUrl
- [ ] 20250128 --> function to assure compatibility of BoundParameter array between two given functions
- [ ] 20250123 --> wb -acceptlang doesn't work?
- [ ] 20250122 --> movies, music, etc cmdlets extend with showing list of offerings
- [ ] 20250121 --> ScriptsToProcess for Update-Help
- [ ] 20250120 --> Make sure FileSystem module only uses .Net routines to be compatible with NTFS additional file streams
- [ ] 20250120 --> set exported functions and cmdlets in .psd1 when compiling
- [ ] 20250117 --> come up with a comprehensive list of possible unit tests for Start-RoboCopy's parameter options
- [ ] 20250115 --> is there an official way to retrieve the OneDrive folder, like registry
- [ ] 20250114 --> screenshot in 2025, over Selenium driver
- [ ] 20250114 --> $PSDefaultParameterValues
- [ ] 20250114 --> profile import-module genxdev
- [ ] 20250114 --> videos of everything in parts, install, configure, use, etc without red colored text. ;-)
- [ ] 20250114 --> wsl pwsh
- [ ] 20250114 --> GenXdev.Data extend with persistency helpers that sync via OneDrive!!
- [ ] 20250113 --> legal assistance living
- [ ] 20250110 --> encode srt into video file
- [ ] 20250110 --> Import-BrowserBookmarks
- [ ] 20250110 --> Get-ImageGeolocation
- [ ] 20241213 --> How to get started with PowerShell YouTube video on PowerShell.genxdev.net
- [ ] 20241218 --> ql extend with shadowdom and iframe capabilities
- [ ] 20241222 --> vlc/media extend with -UseDefaultLauncher
- [ ] 20241222 --> test GenXdev.Data cmdlets + make videos with OBS + add videos to PowerShell.genxdev.net
- [ ] 20241221 --> devtoolsFrontendUrl -> cmdlet (Switch?) to open debugger window
- [ ] 20241221 --> script using 'l' for adding files to code
- [ ] 20241219 --> add -home to todo, issue, idea, etc, and where does it place readme.md if it does? first special folder or root?
- [ ] 20241218 --> -CustomPipeName, didn't work? shame for debugging nt-powerhshell scripts
- [ ] 20241218 --> ps.ps1 is broken due to authentication /api/
- [ ] 20210802 --> further complete Add-SpotifyTracksToPlaylist and apply on name
- [ ] 20210727 --> add way of retrieving liked in Spotify
- [ ] 20210727 --> line comments
- [ ] 20210727 --> PDFsFromGoogleQuery instead of replace sanitizefilename
- [ ] 20210727 --> more examples in cmdlet docs
- [ ] 20210727 --> cmdlet description for repeaters timeline viral etc
- [ ] 20210624 --> better js error messages line numbers etc.. in eval functions
- [ ] 20210710 --> Spotify select playlist add remove track to playlist
- [ ] 20210710 --> add format XML for search results Spotify
- [ ] 20210625 --> logoff/logon for Spotify
- [ ] 20210606 --> Fixed scripts for periodic scheduled tasks
- [ ] 20210614 --> GenXdev.Windows SystemMaintenance
- [ ] 20210622 --> api for genxdev.net + email templates using razor pages
- [ ] 20210701 --> push-webbrowsertab and pop-dito
- [ ] 20210624 --> asjob functionality start-robocopy
- [ ] 20210606 --> A better command-notfound actions
- [ ] 20210806 --> fmq -SearchType Episode "'Peter Hotez'"

## Ideas
- [ ] 20250323 --> automate backup file reader/writer editor
- [ ] 20250314 --> use ai to create very nich and exclusive webshop articles by using other services like for printing, stickers, posters, etc.
- [ ] 20250313 --> from 'add-GenXdevCmdlet' to 'create-NewModuleSuite -alias 'somebrand' -githubUsername 'someone'
- [ ] 20250312 --> agent idea: create embeddings of images and use them to search
- [ ] 20250312 --> agent idea: read error eventlogs, report if needed
- [ ] 20250312 --> agent idea: read emails, create summary
- [ ] 20250309 --> ask llm if it is possible using powershell to setup current users windows profile with disk encryption using cloude account and secure boot
- [ ] 20250224 --> cmd not found handler for Automate cloud notification listner for executing other blocks and a 'ls' and 'ps' function all the way into powershell
- [ ] 20250224 --> odysee and a few others to add to qvideos, maybe rewrite?
- [ ] 20250223 --> Create infographic with module dependencies
- [ ] 20250223 --> Create dependency / cmdlet invocation refactorer that prefixes module names and checks if the module name is in the dependency list of the calling module's .psd1 file
- [ ] 20250217 --> vlc api, and Spotify improvements of course
- [ ] 20250217 --> more AI media album management
- [ ] 20250217 --> work out an AI assistant video channel format for YouTube
- [ ] 20210728 --> management of PowerShell modules with JSON file
- [ ] 20250108 --> Alternatively add a custom browser to all 'et', 'st', 'wb', etc cmdlets that is implemented using Selenium driver (or whatever it's called)
- [ ] 20210606 --> CmdLets for zipping directories with/without encrypting and then mailing expirable download link
- [ ] 20250102 --> hollywood but really useful
- [ ] 20241219 --> use AI to inspect backup logs
- [ ] 20241222 --> log files found on current system, analyzed by AI and reported back to administrator
- [ ] 20241218 --> what is Microsoft.CoreMemory a kind of library
- [ ] 20241218 --> experiment and get lm studio working with Microsoft.Symantec.Kernel
- [ ] 20250223 --> Use AI to create a really good GenXdev.PackageManagement with software groups, all with AI made really cool and useful
- [ ] 20250223 --> Find-Item extend with mime types + FileType groups
- [ ] 20250206 --> migrate modeldev away from local
- [ ] 20250205 --> Add-NewGenXdevModule with git clone, and everything
- [ ] 20250202 --> rename GenXdev.Local to GenXdev.Roaming add a clean GenXdev.Local, move certain scripts from roaming to local
- [ ] 20250202 --> PowerShell pipe streaming C# class to filter username
- [ ] 20250131 --> checkout the PSModule.psm1 provider mentioned in C:\Users\renev\Documents\PowerShell\Modules\PowerShellGet\2.2.5\PowerShellGet.psd1
- [ ] 20250108 --> release notes for genxdev.module commits and psd1
- [ ] 20210623 --> property editor build with JavaScript/eval + way to select and copy settings from backup appdata
- [ ] 20210619 --> wb -> -cascade
- [ ] 20210611 --> A Windows start menu with nice categories and proxies for installable apps with descriptions etc
- [ ] 20250228 --> remember: Win-X + 2x U -> shutdown gracefully

## Features
- [✅] 20210606 --> Lots of PowerShell CmdLets to boost productivity during software development and system maintenance
- [✅] 20210606 --> Debug PowerShell scripts directly from VSCode
- [✅] 20210606 --> Uses Chocolatey package manager for maintaining 3rd party Windows software, to keep them up-to-date with the latest security patches
- [✅] 20210715 --> q and other queries use the existing browser window
- [✅] 20210711 --> whatifpreference control at -whatif parameters and also set that
- [✅] 20210621 --> Set-RemoteDebuggerPortInBrowserShortcuts dependency
- [✅] 20210621 --> readme queries are not ok

## Release notes

## Description
- The scripts in these folders, should be seen as personalisations of the default Windows commandshell.
- Are written by the author for his personal use only.
- No support is provided.
- These scripts are used to increase productivity and should never be shipped with any product.

## Guidelines
- Don't store any 'secrets' in script files
- Press F5 from within VSCode to start debugging

## License
All Rights Reserved - with exception of source files with their own license header

## Workspace Overview

This workspace primarily consists of the `./Scripts` folder and all the `./Modules/GenXdev*/*.*.*/` modules. These are the core components of the project.

Each module directory has at least:

- .\Functions\*\*.ps1   all the cmdlet functions
- .\Tests\*\*.Tests.ps1 all the cmdlet unit-tests
- .\README.md           all the info about the Module and it's cmdlets
