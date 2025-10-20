<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : EnsureDefaultGenXdevRefactors.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.302.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
<#
.SYNOPSIS
Ensures default GenXdev refactoring definitions are available.

.DESCRIPTION
This function creates and maintains default refactoring definitions for GenXdev
PowerShell modules. It sets up refactors for documentation and formatting,
C# conversion, and installation consent prompts.

.PARAMETER Force
Forces recreation of existing refactor definitions.

.EXAMPLE
EnsureDefaultGenXdevRefactors

.EXAMPLE
EnsureDefaultGenXdevRefactors -Force
#>
function EnsureDefaultGenXdevRefactors {

    [CmdletBinding()]

    param
    (
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Forces recreation of existing refactor definitions"
        )]
        [switch] $Force
        #######################################################################
    )

    begin {
    }

    process {

        # expand the root path to the workspace directory
        $rootPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\"

        # list of deprecated refactor names to remove
        $depricated = @("MissingDocumentation", "OnlyDocumentation", "TooManyParameters")

        # remove any deprecated refactors that still exist
        foreach ($name in $depricated) {

            # try to get the refactor object
            $obj = GenXdev.Coding\Get-Refactor -Name $name -ErrorAction SilentlyContinue

            # if the refactor exists, remove it
            if ($null -ne $obj) {

                # remove the deprecated refactor
                Microsoft.PowerShell.Utility\Write-Verbose "Removing deprecated refactor: $name"
                $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
            }
        }

        # DocumentationAndFormatting refactor setup
        $obj = GenXdev.Coding\Get-Refactor -Name "DocumentationAndFormatting" `
            -ErrorAction SilentlyContinue

        # if force is specified and refactor exists, remove it first
        if ($Force -and ($null -ne $obj)) {

            # remove existing refactor when force is used
            $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
            $obj = $null
        }

        # create the refactor if it doesn't exist
        if (-not $obj) {

            # create a refactor definition for recently modified files
            # this refactor will only include files that have been modified in the last 7 days
            # and will not prompt the user for any input.
            Microsoft.PowerShell.Utility\Write-Verbose "Creating DocumentationAndFormatting refactor"
            $null = GenXdev.Coding\New-Refactor `
                -Name "DocumentationAndFormatting" `
                -PromptKey "OnlyDocumentation" `
                -SelectionScript "GenXdev.FileSystem\Find-Item `"$PSScriptRoot\..\..\..\..\GenXdev.*\1.302.2025\functions\*.ps1`" -PassThru -Exclude `"*\_*`" | Microsoft.PowerShell.Utility\Sort-Object -property LastWriteTime" `
                -AutoAddModifiedFiles `
                -Priority 0
        }

        # DocumentationAndFormattingCSharp refactor setup
        $obj = GenXdev.Coding\Get-Refactor -Name "DocumentationAndFormattingCSharp" `
            -ErrorAction SilentlyContinue

        # if force is specified and refactor exists, remove it first
        if ($Force -and ($null -ne $obj)) {

            # remove existing refactor when force is used
            $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
            $obj = $null
        }

        # create the refactor if it doesn't exist
        if (-not $obj) {

            # create a refactor definition for recently modified files
            # this refactor will only include files that have been modified in the last 7 days
            # and will not prompt the user for any input.
            Microsoft.PowerShell.Utility\Write-Verbose "Creating DocumentationAndFormattingCSharp refactor"
            $null = GenXdev.Coding\New-Refactor `
                -Name "DocumentationAndFormattingCSharp" `
                -PromptKey "OnlyCSharpDocumentation" `
                -SelectionScript "GenXdev.FileSystem\Find-Item `"$PSScriptRoot\..\..\..\..\GenXdev.*\1.302.2025\functions\*.cs`" -PassThru  -Exclude `"*\_*`" | Microsoft.PowerShell.Utility\Sort-Object -property LastWriteTime" `
                -AutoAddModifiedFiles `
                -Priority 0
        }

        # ConvertToCSharp refactor setup
        $obj = GenXdev.Coding\Get-Refactor -Name "ConvertToCSharp" -ErrorAction SilentlyContinue

        # if force is specified and refactor exists, remove it first
        if ($Force -and ($null -ne $obj)) {

            # remove existing refactor when force is used
            $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
            $obj = $null
        }

        # create the refactor if it doesn't exist
        if (-not $obj) {

            # create a refactor definition for all cmdlets prioritized for C# conversion
            # this refactor uses the cmdlet usage analysis to identify all functions
            # and prioritizes them for conversion to C# with most used first.
            Microsoft.PowerShell.Utility\Write-Verbose "Creating ConvertToCSharp refactor"
            $null = GenXdev.Coding\New-Refactor `
                -Name "ConvertToCSharp" `
                -PromptKey "ConvertToCSharp" `
                -SelectionScript "GenXdev.FileSystem\Find-Item `"$PSScriptRoot\..\..\..\..\GenXdev.*\1.302.2025\functions\*-*.ps1`" -PassThru -Exclude `"*\_*`", `"*Ensure*`" | ? { `$dir = [io.path]::GetDirectoryName(`$_); `$fn = [io.path]::GetFileNameWithoutExtension(`$_); if (-not (Test-Path `"`$dir\`${fn}.cs`")) { if (-not ([IO.file]::ReadAllText(`$_).Contains('dontrefactor'))) { `$_ } } } | Sort-Object Length" `
                -AutoAddModifiedFiles:$false `
                -Priority 1000
        }

        # AddInstallationConsentPrompt refactor setup
        $obj = GenXdev.Coding\Get-Refactor -Name "AddInstallationConsentPrompt" `
            -ErrorAction SilentlyContinue

        # if force is specified and refactor exists, remove it first
        if ($Force -and ($null -ne $obj)) {

            # remove existing refactor when force is used
            $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
            $obj = $null
        }

        # create the refactor if it doesn't exist
        if (-not $obj) {

            # create a refactor definition for all cmdlets prioritized for C# conversion
            # this refactor uses the cmdlet usage analysis to identify all functions
            # and prioritizes them for conversion to C# with most used first.
            Microsoft.PowerShell.Utility\Write-Verbose "Creating AddInstallationConsentPrompt refactor"
            $null = GenXdev.Coding\New-Refactor `
                -Name "AddInstallationConsentPrompt" `
                -PromptKey "AddInstallationConsentPrompt" `
                -SelectionScript "GenXdev.FileSystem\Find-Item `"$rootPath\Modules\GenXdev.*\*.ps1`" 'winget' -PassThru -Quiet | Where-Object { -not (([IO.File]::ReadAllText(`$_.FullName)) | Select-String 'Confirm-InstallationConsent' -Quiet) }" `
                -AutoAddModifiedFiles:$false `
                -Priority 10
        }

        # CheckCSharpInvocations refactor setup
        $obj = GenXdev.Coding\Get-Refactor -Name "CheckCSharpInvocations" `
            -ErrorAction SilentlyContinue

        # if force is specified and refactor exists, remove it first
        if ($Force -and ($null -ne $obj)) {

            # remove existing refactor when force is used
            $null = GenXdev.Coding\Remove-Refactor -Name $obj.Name
            $obj = $null
        }

        # create the refactor if it doesn't exist
        if (-not $obj) {

            # create a refactor definition for C# files that may contain old script invocations
            # that should be replaced with base class methods from PSGenXdevCmdlet
            Microsoft.PowerShell.Utility\Write-Verbose "Creating CheckCSharpInvocations refactor"
            $null = GenXdev.Coding\New-Refactor `
                -Name "CheckCSharpInvocations" `
                -PromptKey "CheckCSharpInvocations" `
                -SelectionScript "GenXdev.FileSystem\Find-Item `"$PSScriptRoot\..\..\..\..\GenXdev.*\1.302.2025\functions\*.cs`" -PassThru -Exclude `"*\_*`" -Quiet -Content 'Confirm-InstallationConsent|Get-Variable|Copy-IdenticalParamValues|Expand-Path|LOCALAPPDATA|\.\.\\\.\.\\|\\Scripts' | Sort-Object Length" `
                -AutoAddModifiedFiles:$false `
                -Priority 1500
        }

        # return all available refactors
        GenXdev.Coding\Get-Refactor
    }

    end {
    }
}
################################################################################