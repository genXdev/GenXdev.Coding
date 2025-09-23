<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Show-GenXdevCmdLetInIde.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

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
################################################################################>
###############################################################################
<#
.SYNOPSIS
Opens the specified GenXdev cmdlet in Visual Studio Code.

.DESCRIPTION
This function retrieves the script file and line number for the specified GenXdev
cmdlet and opens it in Visual Studio Code. It can open either the main function
implementation or its associated unit tests, based on the UnitTests switch
parameter.

.PARAMETER CmdletName
The name of the GenXdev cmdlet to locate and open in Visual Studio Code.

.PARAMETER UnitTests
When specified, opens the unit test file for the cmdlet instead of the main
implementation file.

.PARAMETER ChangeDirectoryOnly -> 'cd'
When specified, only changes the current PowerShell location
the respective Cmdlet sourcecode directory.

.EXAMPLE
Show-GenXdevCmdLetInIde -CmdletName "Get-GenXDevModuleInfo"
Opens the implementation of Get-GenXDevModuleInfo in VSCode.

.EXAMPLE
editcmdlet Get-GenXDevModuleInfo -UnitTests
Opens the unit tests for Get-GenXDevModuleInfo using the alias.
#>
function Show-GenXdevCmdLetInIde {

    [CmdletBinding()]
    [Alias('editcmdlet', 'cmdlet')]
    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'Search pattern to filter cmdlets'
        )]
        [Alias('Filter', 'CmdLet', 'Cmd', 'FunctionName', 'Name')]
        [SupportsWildcards()]
        [string] $CmdletName,
        ########################################################################
        [parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 1,
            HelpMessage = 'GenXdev module names to search'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Module', 'SubModuleName')]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.[\w\*\[\]\?]*)+)+$')]
        [SupportsWildcards()]
        [string[]] $ModuleName,
        ########################################################################
        [Parameter(Mandatory = $false)]
        [switch] $NoLocal,
        ########################################################################
        [Parameter(Mandatory = $false)]
        [switch] $OnlyPublished,
        ########################################################################
        [Parameter(Mandatory = $false)]
        [switch] $FromScripts,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The ide to open the file in'
        )]
        [Alias('c')]
        [switch] $Code,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open in Visual Studio'
        )]
        [Alias('vs')]
        [switch] $VisualStudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Show the function's unit-tests instead of the function"
        )]
        [switch] $UnitTests,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The keys to send'
        )]
        [Alias('keys')]
        [string[]] $KeysToSend = @(),
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Add to Co-Pilot edit session'
        )]
        [switch] $CoPilot,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Also global search for the cmdlet'
        )]
        [switch] $Search,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("When specified, only changes the current PowerShell location\r\n"+
                           "the respective Cmdlet directory")
        )]
        [Alias('cd')]
        [switch] $ChangedirectoryOnly,
        #######################################################################
        [Parameter(
            ParameterSetName="New",
            Mandatory = $false,
            HelpMessage = "Create a new cmdlet"
        )]
        [switch] $New,
        ########################################################################
        [Parameter(
            ParameterSetName="New",
            Position = 3,
            Mandatory = $false,
            HelpMessage = "A brief description of the cmdlet's purpose"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Synopsis = "todo: A brief description of the cmdlet's purpose",
        ########################################################################
        [Parameter(
            ParameterSetName="New",
            Position = 4,
            Mandatory = $false,
            HelpMessage = 'A detailed description of what the cmdlet does'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Description = 'todo: [A detailed description of what the cmdlet does]',
        ########################################################################
        [Parameter(
            ParameterSetName="New",
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Integrate the new cmdlet into an existing GenXdev module'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^(GenXdev|GenXdev(\.\w+)+)+$')]
        [string] $BaseModuleName,
        ########################################################################
        [parameter(
            ParameterSetName="New",
            Mandatory = $false,
            Position = 5,
            HelpMessage = 'One or more aliases for the cmdlet. Accepts an array of strings.'
        )]
        [string[]] $CmdletAliases,
        ########################################################################
        [parameter(
            ParameterSetName="New",
            Mandatory = $false,
            HelpMessage = 'The AI prompt key to use for template selection'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Custom AI prompt text to use for cmdlet generation'
        )]
        [AllowEmptyString()]
        [string] $Prompt = "Create a boilerplate GenXdev cmdlet that does what it's name suggests",
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Only edit the AI prompt without creating the cmdlet'
        )]
        [switch] $EditPrompt
        ########################################################################
    )

    begin {

        $PSRootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"
        $null = GenXdev.Coding\EnsureCopilotKeyboardShortCut

        # retrieve and validate the target cmdlet exists
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Helpers\Get-GenXDevCmdlet' `
            -BoundParameters $PSBoundParameters
        $invocationParams.ExactMatch = $true
        $m = [string]::IsNullOrWhiteSpace($ModuleName) ? $ModuleName :
                [string]::IsNullOrWhiteSpace($BaseModuleName) ? $Null : $BaseModuleName;
        if ($m) {

            $invocationParams.ModuleName = $m
        }

        if (-not $new -and ($null -eq $cmdletName)) {

            throw "You need to specify a GenXdev cmdletname or alias"
        }


        $cmdlet =  $null

        if (-not $new) {

            $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlet @invocationParams |
                Microsoft.PowerShell.Utility\Select-Object -First 1

            if (-not $cmdlet) {

                $invocationParams.FromScripts = $true

                $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlet @invocationParams |
                    Microsoft.PowerShell.Utility\Select-Object -First 1
            }
        }

        if (-not $new -and ($null -eq $cmdlet)) {

            throw "Could not find GenXdev cmdlet $CmdletName"
        }

        # initialize core variables
        $CmdletName = $new ? $CmdletName : $cmdlet.Name

        Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet: $CmdletName"

        $PSRootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"
        $VSCodeInvoked = $false
    }

    process {
        $filePath = $UnitTests ? $cmdlet.ScriptTestFilePath : $cmdlet.ScriptFilePath;

        if ($ChangedirectoryOnly) {

           Microsoft.PowerShell.Management\Set-Location (GenXdev.FileSystem\Expand-Path ([System.IO.Path]::GetDirectoryName($filePath)) -CreateDirectory) -ErrorAction SilentlyContinue
           Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath $filePath -File -ErrorAction SilentlyContinue

           return;
        }

        if ($New) {

            if ([string]::IsNullOrWhiteSpace($PromptKey)) {
                $PromptKey = 'NewGenXdevCmdLet'
            }

            $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName "GenXdev.Coding\New-GenXdevCmdlet" `
                -DefaultValues (
                    Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue
            )

            GenXdev.Coding\New-GenXdevCmdlet @params

            return
        }

        if (-not ([String]::IsNullOrWhiteSpace($PromptKey) -or [string]::IsNullOrWhiteSpace($Prompt))) {

            $params = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName "GenXdev.Coding\Assert-GenXdevCmdlet" `
                -DefaultValues (
                    Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue
            )

            GenXdev.Coding\Assert-GenXdevCmdlet @params

            return;
        }

        if (-not $VSCodeInvoked -and ($filePath.StartsWith("$PSRootPath\"))) {

            $VSCodeInvoked = $true
            GenXdev.Coding\Open-SourceFileInIde `
                -Path $PSRootPath `
                -Code
        }

        # open cmdlet in vscode and insert prompt
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Coding\Open-SourceFileInIde' `
            -BoundParameters $PSBoundParameters

        $invocationParams.Path = $filePath
        $invocationParams.LineNo = $UnitTests ? 0 : ($cmdlet.LineNo)
        $invocationParams.KeysToSend = ($CoPilot ? @('+%E', '+%S', '^+%{F12}') : @('+%E', '+%S')) + @($KeysToSend ? $KeysToSend : @())

        GenXdev.Coding\Open-SourceFileInIde @invocationParams
    }

    end {

        if ($Search) {

            if ($ChangedirectoryOnly) {

                if (-not [string]::IsNullOrWhiteSpace($ModuleName)) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Searching '$(
                            "$($ModuleName.Replace('.','\.').Replace('*', '.*').Replace('?','.?'))"+
                            "\\"+
                            "$($CmdletName.Replace('.','\.').Replace('*', '.*').Replace('?','.?'))"
                        )' in '$PSRootPath\*.ps1'"

                    GenXdev.FileSystem\Find-Item -PassThru "$PSRootPath\*.ps1" `
                        (
                            "$($ModuleName.Replace('.','\.').Replace('*', '.*').Replace('?','.?'))"+
                            "\\"+
                            "$($CmdletName.Replace('.','\.').Replace('*', '.*').Replace('?','.?'))"
                        ) | Microsoft.PowerShell.Core\Where-Object { $_.FullPath -ne $filePath }
                }
                else {

                    Microsoft.PowerShell.Utility\Write-Verbose "Searching '$($CmdletName.Replace('.','\.').Replace('*', '.*').Replace('?','.?'))' in '$PSRootPath\*.ps1'"

                    GenXdev.FileSystem\Find-Item -PassThru "$PSRootPath\*.ps1" `
                        (
                            "$($CmdletName.Replace('.','\.').Replace('*', '.*').Replace('?','.?'))"
                        ) | Microsoft.PowerShell.Core\Where-Object { $_.FullPath -ne $filePath }
                }
                return;
            }

            $invocationArgs = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Coding\Search-GenXdevCmdlet'

            $null = GenXdev.Coding\Search-GenXdevCmdlet @invocationArgs
        }
    }
}