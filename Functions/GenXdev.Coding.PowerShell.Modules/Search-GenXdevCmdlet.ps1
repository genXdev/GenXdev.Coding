<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : Search-GenXdevCmdlet.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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
Searches for a GenXdev cmdlet and optionally opens it in an IDE for editing.

.DESCRIPTION
This function searches for GenXdev cmdlets using a pattern and optionally opens
the found cmdlet's source file in Visual Studio Code or Visual Studio for
editing. It retrieves cmdlet information and provides keyboard shortcuts to
quickly navigate to the function definition.

.PARAMETER CmdletName
Search pattern to filter cmdlets. Supports wildcards. Default is '*' to show
all cmdlets.

.PARAMETER ModuleName
GenXdev module names to search. Must match pattern starting with 'GenXdev'.
Default searches all GenXdev modules.

.PARAMETER NoLocal
Skip searching in local module paths when finding cmdlets.

.PARAMETER OnlyPublished
Limit search to published module paths only.

.PARAMETER FromScripts
Search in script files instead of module files.

.PARAMETER Code
Open the found cmdlet in Visual Studio Code.

.PARAMETER VisualStudio
Open the found cmdlet in Visual Studio.

.PARAMETER EditCmdlet
Also opens the file in the editor after finding the cmdlet.

.EXAMPLE
Search-GenXdevCmdlet -CmdletName "Get-*" -Code
Opens first matching cmdlet starting with "Get-" in Visual Studio Code.

.EXAMPLE
searchcmdlet "Set-GitConfig" -EditCmdlet
Searches for Set-GitConfig cmdlet and opens it for editing.
#>
function Search-GenXdevCmdlet {

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [Alias('searchcmdlet')]

    param(
        ###############################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'Search pattern to filter cmdlets'
        )]
        [Alias('Filter', 'CmdLet', 'Cmd', 'FunctionName', 'Name')]
        [SupportsWildcards()]
        [string] $CmdletName,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 1,
            HelpMessage = 'GenXdev module names to search'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Module', 'BaseModuleName', 'SubModuleName')]
        [ValidatePattern('^(GenXdev|GenXde[v]\*|GenXdev(\.[\w\*\[\]\?]*)+)+$')]
        [SupportsWildcards()]
        [string[]] $ModuleName,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Skip searching in local module paths'
        )]
        [switch] $NoLocal,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Limit search to published module paths only'
        )]
        [switch] $OnlyPublished,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Search in script files instead of module files'
        )]
        [switch] $FromScripts,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open the found cmdlet in Visual Studio Code'
        )]
        [Alias('c')]
        [switch] $Code,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open the found cmdlet in Visual Studio'
        )]
        [Alias('vs')]
        [switch] $VisualStudio,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Also opens the file in the editor after finding'
        )]
        [switch] $EditCmdlet
    )

    begin {

        # retrieve and validate the target cmdlet exists
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Helpers\Get-GenXDevCmdlet' `
            -BoundParameters $PSBoundParameters

        $invocationParams.ExactMatch = $true

        $cmdlet = GenXdev.Helpers\Get-GenXDevCmdlet @invocationParams |
            Microsoft.PowerShell.Utility\Select-Object -First 1

        if ($null -eq $cmdlet) {

            throw "Could not find GenXdev cmdlet $CmdletName"
        }

        # initialize core variables for processing
        $CmdletName = $cmdlet.Name

        $previousClipboard = Microsoft.PowerShell.Management\Get-Clipboard

        $CmdletName | Microsoft.PowerShell.Management\Set-Clipboard

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Processing cmdlet: $CmdletName"
        )
    }


    process {

        # open cmdlet in ide and insert prompt with keyboard shortcuts
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Coding\Open-SourceFileInIde' `
            -BoundParameters $PSBoundParameters

        $invocationParams.KeysToSend = @(
            '^+f', '^a', '{DELETE}', '^v', '{ENTER}', '^{ENTER}', "^``"
        )

        $invocationParams.Path = $cmdlet.ScriptFilePath

        $invocationParams.LineNo = $cmdlet.LineNo

        GenXdev.Coding\Open-SourceFileInIde @invocationParams
    }

    end {

        # wait for ide operations to complete
        Microsoft.PowerShell.Utility\Start-Sleep 3

        # restore original clipboard content
        $null = Microsoft.PowerShell.Management\Set-Clipboard `
            -Value $previousClipboard

        if ($EditCmdlet) {

            # copy parameters for editing cmdlet function
            $invocationArgs = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Coding\Show-GenXdevCmdLetInIde'

            $null = GenXdev.Coding\Show-GenXdevCmdLetInIde @invocationArgs
        }
    }
}
###############################################################################