################################################################################
<#
.SYNOPSIS
Opens a source file in the preferred IDE (Visual Studio Code or Visual Studio).

.DESCRIPTION
This function opens a specified source file in either Visual Studio Code or
Visual Studio. It can navigate directly to a specific line number and optionally
send keyboard inputs to the IDE after opening the file. The function will
attempt to determine which IDE to use based on the current host process, running
applications, or user selection.

.PARAMETER Path
The path to the source file that should be opened in the IDE. Accepts both
relative and absolute paths, as well as paths with environment variables.

.PARAMETER LineNo
The line number to navigate to when opening the file. Default is 0, which opens
the file without positioning to a specific line.

.PARAMETER KeysToSend
Array of keyboard inputs to send to the application after opening. The function
will wait 2 seconds before sending the keys to ensure the IDE has loaded.

.PARAMETER Code
Switch parameter to force opening the file in Visual Studio Code regardless
of the current host process or other running IDEs.

.PARAMETER VisualStudio
Switch parameter to force opening the file in Visual Studio regardless of the
current host process or other running IDEs.

.PARAMETER SendKeyEscape
When specified, escapes special characters so they are sent as literal text
instead of being interpreted as control sequences.

.PARAMETER SendKeyHoldKeyboardFocus
Prevents returning keyboard focus to PowerShell after sending keys.

.PARAMETER SendKeyUseShiftEnter
Sends Shift+Enter instead of regular Enter for line breaks.

.PARAMETER SendKeyDelayMilliSeconds
Adds delay between sending different key sequences. Useful for slower apps.

.EXAMPLE
Open-SourceFileInIde -Path "C:\Projects\MyScript.ps1" -LineNo 25 -Code

.EXAMPLE
editcode "C:\Projects\MyScript.ps1" 25
#>
################################################################################
function Open-SourceFileInIde {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseUsingScopeModifierInNewRunspaces', '')]
    [Alias('editcode')]
    param(
        #########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The path to the sourcefile to open'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('FullName')]
        [string] $Path,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The line number to navigate to'
        )]
        [int] $LineNo = 0,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Array of keyboard inputs to send to the application'
        )]
        [Alias('keys')]
        [string[]] $KeysToSend = @(),
        #########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The ide to open the file in'
        )]
        [Alias('c')]
        [switch] $Code,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open in Visual Studio'
        )]
        [Alias('vs')]
        [switch] $VisualStudio,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters and modifiers'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hold keyboard focus on target window'
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use Shift+Enter instead of Enter'
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        #########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Delay between different input strings in milliseconds'
        )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds
        #########################################################################
    )

    begin {

        # expand any environment variables or relative paths in the file path
        $Path = GenXdev.FileSystem\Expand-Path $Path
        $PSRoot = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"

        # get the process that's hosting the current PowerShell session
        [System.Diagnostics.Process] $hostProcess = (
            GenXdev.Windows\Get-PowershellMainWindowProcess |
                Microsoft.PowerShell.Core\Where-Object {
                    "$($_.Name)".ToLowerInvariant() -in @(
                        'code',
                        'code - insiders',
                        'vscodium',
                        'vscodium - insiders',
                        'devenv',
                        'sublime_text',
                        'atom',
                        'idea64',
                        'pycharm64',
                        'cursor'
                    )
                }
        )

        # determine default IDE path based on host process availability
        $normalPath = Microsoft.PowerShell.Management\Join-Path `
            $env:LOCALAPPDATA 'Programs\Microsoft VS Code\Code.exe'
        $normalPath2 = Microsoft.PowerShell.Management\Join-Path `
            $env:ProgramFiles 'Microsoft VS Code\Code.exe'
        $previewPath = Microsoft.PowerShell.Management\Join-Path `
            $env:LOCALAPPDATA `
            'Programs\Microsoft VS Code Insiders\Code - Insiders.exe'
        $previewPath2 = Microsoft.PowerShell.Management\Join-Path `
            $env:ProgramFiles `
            '\Microsoft VS Code Insiders\Code - Insiders.exe'

        $idePath = ((($null -eq $hostProcess) -or `
                ($hostProcess -like '*Terminal*')) ? (
                ([IO.File]::Exists($previewPath) ? $previewPath : (
                    ([IO.File]::Exists($previewPath2) ? $previewPath2 : (
                        ([IO.File]::Exists($normalPath) ? $normalPath : (
                            ([IO.File]::Exists($normalPath2) ? $normalPath2 : 'code')))))))) : `
                $hostProcess.Path)

        # output verbose message about initial host process path
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Initial host process path: $idePath"
        )

        # check if current host is VS Code or Visual Studio
        $filename = ([IO.Path]::GetFileNameWithoutExtension($idePath)).ToLowerInvariant()
        $isCode = ($filename -eq 'code') -or ($filename -eq 'code - insiders')
        $isVisualStudio = $filename -eq 'devenv'

        # output verbose message about initial IDE detection
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Initial IDE detection: VSCode=$isCode, VS=$isVisualStudio"
        )

        # if neither Code nor VS is hosting, try to find them running elsewhere
        if (-not ($isCode -or $isVisualStudio)) {

            # try to find a running VS Code process
            [System.Diagnostics.Process] $hostProcess = (
                Microsoft.PowerShell.Management\Get-Process 'Code' `
                    -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Utility\Select-Object -First 1
            )

            # update path if VS Code process was found
            $idePath = ((($null -eq $hostProcess) -or `
                    ($hostProcess -like '*Terminal*')) ?
                $idePath : $hostProcess.Path)

            $isCode = $null -ne $hostProcess

            # output verbose message about VS Code detection
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Found running VS Code: $isCode"
            )

            # try to find a running Visual Studio process
            [System.Diagnostics.Process] $hostProcess = (
                Microsoft.PowerShell.Management\Get-Process 'devenv' `
                    -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Utility\Select-Object -First 1
            )

            # update path if Visual Studio process was found
            $idePath = ((($null -eq $hostProcess) -or `
                    ($hostProcess -like '*Terminal*')) ?
                $idePath : $hostProcess.Path)

            $isVisualStudio = $null -ne $hostProcess

            # output verbose message about Visual Studio detection
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Found running Visual Studio: $isVisualStudio"
            )
        }

        # if still can't determine which IDE to use, prompt the user
        if (-not ($isCode -bxor $isVisualStudio)) {

            # use previously chosen IDE or prompt user to select one
            $userAnswer = (($null -ne $Global:_CodeOrVisualStudioRefactor ?
                    $Global:_CodeOrVisualStudioRefactor :
                    ($host.ui.PromptForChoice(
                        'Make a choice',
                        'What ide to use for refactoring?',
                        @('Visual Studio &Code', '&Visual Studio'),
                        0))))

            # save user's choice for future use in this session
            $Global:_CodeOrVisualStudioRefactor = $userAnswer

            # configure IDE settings based on user's choice
            switch ($Global:_CodeOrVisualStudioRefactor) {
                0 {
                    # user chose VS Code
                    $isCode = $true

                    $isVisualStudio = $false

                    # common VS Code installation locations
                    $locations = (
                        "${Env:AppData}\Local\Programs\Microsoft VS Code\Code.exe",
                        "${Env:ProgramFiles}\Microsoft VS Code\Code.exe"
                    )

                    # find the VS Code executable
                    $idePath = Microsoft.PowerShell.Management\Get-ChildItem `
                        -LiteralPath $locations `
                        -File `
                        -Recurse `
                        -ErrorAction SilentlyContinue |
                        Microsoft.PowerShell.Core\ForEach-Object { "$($_.FullName)" } |
                        Microsoft.PowerShell.Utility\Select-Object -First 1

                    # output verbose message about selected VS Code path
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Selected VS Code at: $idePath"
                    )
                    break
                }
                1 {
                    # user chose Visual Studio
                    $isCode = $false

                    $isVisualStudio = $true

                    # common Visual Studio installation locations
                    $locations = (
                        "${Env:ProgramFiles}\Microsoft Visual Studio\devenv.exe",
                        "${env:ProgramFiles(x86)}\Microsoft Visual Studio\devenv.exe"
                    )

                    # find the newest Visual Studio executable
                    $idePath = Microsoft.PowerShell.Management\Get-ChildItem `
                        -LiteralPath $locations `
                        -File `
                        -Recurse `
                        -ErrorAction SilentlyContinue |
                        Microsoft.PowerShell.Utility\Sort-Object {
                            $_.Replace(
                                "${env:ProgramFiles(x86)}\Microsoft Visual Studio\",
                                ''
                            ).Replace(
                                "${Env:ProgramFiles}\Microsoft Visual Studio\",
                                ''
                            )
                        } -Descending |
                        Microsoft.PowerShell.Core\ForEach-Object { "$($_.FullName)" } |
                        Microsoft.PowerShell.Utility\Select-Object -First 1

                    # output verbose message about selected Visual Studio path
                    Microsoft.PowerShell.Utility\Write-Verbose (
                        "Selected Visual Studio at: $idePath"
                    )
                    break
                }
            }
        }

        # ensure vs code installation if chosen
        if ($isCode) {

            $null = GenXdev.Coding\EnsureVSCodeInstallation
        }
    }

    process {

        # validate that an IDE was found
        if ($null -eq $idePath) {

            # throw an error if no IDE was found
            throw 'No ide found'
            return
        }

        if ($Code) {
            if ($Path.StartsWith($PSRoot) -and (-not (Microsoft.PowerShell.Management\Get-Process code -ErrorAction SilentlyContinue))) {

                $null = Microsoft.PowerShell.Core\Start-Job {
                    param($idePath, $arguments)
                    Microsoft.PowerShell.Management\Start-Process `
                        -FilePath $idePath `
                        -ArgumentList $arguments
                } -ArgumentList @($idePath, $PSRoot) |
                    Microsoft.PowerShell.Core\Wait-Job
            }
        }

        # prepare arguments for opening the file
        # if VS Code and line number specified, use -g argument
        if ($Code -and $LineNo -gt 0) {

            if ($Path.StartsWith("$PSRoot\") -and ((Microsoft.PowerShell.Management\Get-Process code -ErrorAction SilentlyContinue))) {

                $null = Microsoft.PowerShell.Core\Start-Job {
                    param($idePath, $arguments)
                    Microsoft.PowerShell.Management\Start-Process `
                        -FilePath $idePath `
                        -ArgumentList $arguments
                } -ArgumentList @($idePath, "$PSRoot\.") |
                    Microsoft.PowerShell.Core\Wait-Job
            }

            # output verbose message about opening file in VS Code with line number
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Opening in VS Code at line $($LineNo): $Path"
            )

            # start file in VS Code at specific line number using background job
            $null = Microsoft.PowerShell.Core\Start-Job {
                param($idePath, $arguments)
                Microsoft.PowerShell.Management\Start-Process `
                    -FilePath $idePath `
                    -ArgumentList $arguments
            } -ArgumentList @($idePath, @('-g', "$($Path):$LineNo")) |
                Microsoft.PowerShell.Core\Wait-Job
        }
        else {


            # output verbose message about opening file in IDE
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Opening file in IDE: $Path"
            )

            # start file in IDE without line number using background job
            $null = Microsoft.PowerShell.Core\Start-Job {
                param($idePath, $arguments)
                Microsoft.PowerShell.Management\Start-Process `
                    -FilePath $idePath `
                    -ArgumentList $arguments
            } -ArgumentList @($idePath, @($Path)) |
                Microsoft.PowerShell.Core\Wait-Job
        }

        # send keyboard inputs if requested
        if (($null -ne $KeysToSend) -and ($KeysToSend.Length -gt 0)) {

            # wait for the application to start before sending keys
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Waiting 2 seconds before sending keyboard inputs'
            )

            Microsoft.PowerShell.Utility\Start-Sleep 2

            # output verbose message about sending keyboard inputs
            Microsoft.PowerShell.Utility\Write-Verbose (
                'Sending keyboard inputs to IDE'
            )

            $SendKeyDelayMilliSeconds = ($PSBoundParameters.ContainsKey('SendKeyDelayMilliSeconds') ?
                $SendKeyDelayMilliSeconds : 500)
            # send keyboard inputs with parameters
            $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                -FunctionName 'GenXdev.Windows\Send-Key' `
                -BoundParameters $PSBoundParameters `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

            GenXdev.Windows\Send-Key @params
        }
    }
}