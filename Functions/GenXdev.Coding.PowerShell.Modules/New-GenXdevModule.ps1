<##############################################################################
Part of PowerShell module : GenXdev.Coding.PowerShell.Modules
Original cmdlet filename  : New-GenXdevModule.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.290.2025
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
Creates a new GenXdev PowerShell module with proper structure and configuration.

.DESCRIPTION
Creates a new PowerShell module following GenXdev standards by:
- Generating module manifest (psd1) with proper metadata
- Creating module script file (psm1)
- Setting up directory structure for functions and tests
- Adding required files like LICENSE and README
- Configuring version info and dependencies

.PARAMETER ModuleName
The name of the module to create. Must follow GenXdev naming convention starting
with 'GenXdev.' followed by module identifier (e.g. GenXdev.Tools).

.PARAMETER Description
A brief description of the module's purpose and functionality. This will be used
in the module manifest and documentation.

.PARAMETER Tags
Optional array of tags for module discovery in PowerShell Gallery. Tags cannot
contain whitespace. Defaults to 'GenXdev'.

.EXAMPLE
New-GenXdevModule `
    -ModuleName "GenXdev.Example" `
    -Description "Example module demonstrating GenXdev standards" `
    -Tags @('GenXdev','Example','Demo')
#>
function New-GenXdevModule {
    ############################################################################
    [CmdletBinding(SupportsShouldProcess)]
    param(
        ############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'Name of the module to create (must follow GenXdev.* pattern)'
        )]
        [ValidatePattern('^GenXdev(\.\w+)+$')]
        [string] $ModuleName,
        ############################################################################
        [Parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "Description of the module's functionality"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        ############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'Tags for module discovery (no whitespace allowed)'
        )]
        [ValidateScript({
                if ($_ | Microsoft.PowerShell.Core\Where-Object { $_ -match '\s' }) {
                    throw 'Tags cannot contain whitespace characters'
                }
                return $true
            })]
        [string[]] $Tags = @('GenXdev')
        ############################################################################
    )

    begin {

        # verbose output to show module creation starting
        Microsoft.PowerShell.Utility\Write-Verbose "Creating new GenXdev module: $ModuleName"

        $newModulePsm = @"
        ###############################################################################
Module manifest for module '$ModuleName'
        ###############################################################################

@{

Script module or binary module file associated with this manifest.
RootModule = '$ModuleName.psm1'

Version number of this module.
ModuleVersion = '1.290.2025'

Supported PSEditions
CompatiblePSEditions = 'Core'

ID used to uniquely identify this module
GUID = '$([guid]::NewGuid())'

Author of this module
Author = 'genXdev'

Company or vendor of this module
CompanyName = 'GenXdev'

Copyright statement for this module
Copyright = 'Copyright 2021-$([System.DateTime]::UtcNow.Year) GenXdev'

Description of the functionality provided by this module
Description = '$Description'

Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.5.0'

Name of the PowerShell host required by this module
PowerShellHostName = ''

Minimum version of the PowerShell host required by this module
PowerShellHostVersion = ''

Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = ''

Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
ClrVersion = '9.0.1'

Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'GenXdev'; ModuleVersion = '1.290.2025'; })

Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @()

Script files (.ps1) that are run in the caller's environment prior to importing this module.
ScriptsToProcess = @()

Type files (.ps1xml) to be loaded when importing this module
TypesToProcess = @()

Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @()

Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @()

Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('*')

Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @('*')

Variables to export from this module
VariablesToExport = @('*')

Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @('*')

DSC resources to export from this module
DscResourcesToExport = @()

List of all modules packaged with this module
ModuleList = @('$ModuleName')

List of all files packaged with this module
FileList = '$ModuleName.psm1', '$ModuleName.psd1', 'LICENSE', 'license.txt',
           'powershell.jpg', 'README.md'

Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = $(($Tags | Microsoft.PowerShell.Core\ForEach-Object { "'$_'" }) -join ', ')

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/genXdev/$ModuleName/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://powershell.genxdev.net/#$ModuleName'

        # A URL to an icon representing this module.
        IconUri = 'https://genxdev.net/favicon.ico'

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        RequireLicenseAcceptance = `$false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

HelpInfo URI of this module
HelpInfoURI = ''

Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
DefaultCommandPrefix = ''
}
"@

        $readME = @"
<hr/>

<img src='"powershell.jpg'" alt='"GenXdev'" width='"50%'"/>

<hr/>

NAME
    $ModuleName
SYNOPSIS
    $Description
[![$ModuleName](https://img.shields.io/powershellgallery/v/$ModuleName.svg?style=flat-square&label=$ModuleName)](https://www.powershellgallery.com/packages/$ModuleName/) [![License](https://img.shields.io/github/license/$ModuleName/$ModuleName?style=flat-square)](./LICENSE)

FEATURES
* ✅ <enter feature here>
     * <enter feature description here>
     * <enter feature description here>

DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev](https://img.shields.io/powershellgallery/v/GenXdev.svg?style=flat-square&label=GenXdev)](https://www.powershellgallery.com/packages/GenXdev/)
INSTALLATION
````````PowerShell
Install-Module `"$ModuleName`"
Import-Module `"$ModuleName`"
````````
UPDATE
````````PowerShell
Update-Module
````````
<br/><hr/><br/>

# Cmdlet Index
"@;

        # construct the module paths
        $modulesPath = GenXdev.FileSystem\Expand-Path `
            -Path "$PSScriptRoot\..\..\..\..\Modules\"

        $moduleRootDirectory = GenXdev.FileSystem\Expand-Path `
            -Path "$modulesPath\$ModuleName\"

        # verify module doesn't already exist
        if ([IO.directory]::Exists($moduleRootDirectory)) {
            throw "Module directory already exists: $moduleRootDirectory"
        }

        # create versioned module directory
        $moduleDirectory = GenXdev.FileSystem\Expand-Path `
            -Path "$moduleRootDirectory\1.290.2025\" `
            -CreateDirectory

        # store current location and move to module directory
        Microsoft.PowerShell.Management\Push-Location -LiteralPath $moduleDirectory
    }

    process {

        # verbose output for file creation
        Microsoft.PowerShell.Utility\Write-Verbose 'Creating module files and structure'

        if ($PSCmdlet.ShouldProcess($moduleDirectory, "Create new PowerShell module '$ModuleName'")) {
            # create the initial module script file with sample cmdlet import
            "# . `"$PSScriptRoot\Functions\$ModuleName\My-Cmdlet.ps1`"`r`n" |
                Microsoft.PowerShell.Utility\Out-File  ".\$ModuleName.psm1"

            # create the module manifest with all required metadata
            $newModulePsm |
                Microsoft.PowerShell.Utility\Out-File  .\$ModuleName.psd1 -Force

            # create standard module directory structure
            $null = GenXdev.FileSystem\Expand-Path `
                -Path ".\Functions\$ModuleName" -CreateDirectory
            $null = GenXdev.FileSystem\Expand-Path `
                -Path ".\Tests\$ModuleName" -CreateDirectory

            # copy required support files from template
            Microsoft.PowerShell.Management\Copy-Item -LiteralPath "$PSScriptRoot\..\..\LICENSE" -Destination .\LICENSE
            Microsoft.PowerShell.Management\Copy-Item -LiteralPath "$PSScriptRoot\..\..\license.txt" -Destination .\license.txt
            Microsoft.PowerShell.Management\Copy-Item -LiteralPath "$PSScriptRoot\..\..\powershell.jpg" -Destination .\powershell.jpg

            # create module documentation
            $readME | Microsoft.PowerShell.Utility\Out-File '.\README.md'
        }
    }

    end {

        # display created module structure
        Microsoft.PowerShell.Utility\Write-Host "Module created under $($modulesPath):"
        GenXdev.FileSystem\Find-Item .\ -RelativeBasePath $modulesPath

        # restore original location
        Microsoft.PowerShell.Management\Pop-Location
    }
}
###############################################################################