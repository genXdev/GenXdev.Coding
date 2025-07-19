###############################################################################
<#
.SYNOPSIS
Splits a PowerShell module (.psm1) file into individual function files.

.DESCRIPTION
Takes a PowerShell module file and splits each function into separate .ps1 files
in a Functions subdirectory. Each function is extracted with its documentation
and saved in a file matching the function name. The original module file is
updated to dot-source all the split function files.

.PARAMETER Psm1FilePath
The full path to the PowerShell module (.psm1) file that needs to be split into
individual function files. This path will be expanded to a full path if relative.

.EXAMPLE
SplitUpPsm1File -Psm1FilePath "C:\Modules\MyModule\MyModule.psm1"

.EXAMPLE
split "C:\Modules\MyModule\MyModule.psm1"
#>
function SplitUpPsm1File {

    [CmdletBinding()]
    [Alias()]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Path to the .psm1 file to split into functions'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Path')]
        [string] $Psm1FilePath
        ########################################################################
    )

    begin {
        # convert the provided path to a full filesystem path
        $psm1FilePath = GenXdev.FileSystem\Expand-Path $Psm1FilePath -CreateFile

        # extract the module directory and name from the full path
        $moduleDir = [System.IO.Path]::GetDirectoryName($psm1FilePath)
        $moduleName = [System.IO.Path]::GetFileNameWithoutExtension($psm1FilePath)

        # create the functions directory with module name subfolder
        $functionsDir = GenXdev.FileSystem\Expand-Path "$moduleDir\Functions\$moduleName" `
            -CreateDirectory

        Microsoft.PowerShell.Utility\Write-Verbose "Processing module file: $psm1FilePath"
        Microsoft.PowerShell.Utility\Write-Verbose "Functions will be saved to: $functionsDir"
    }


    process {

        # read all lines from the module file
        $psm1Content = [System.IO.File]::ReadAllLines($psm1FilePath)

        # initialize variables to track function parsing state
        $inFunction = $false
        $inFunctionHeader = $false
        $functionContent = ''
        $functionName = ''

        # process each line to extract function blocks with their documentation
        $functions = $psm1Content | Microsoft.PowerShell.Core\ForEach-Object {

            # look for the start of function documentation (line of hash marks)
            if (-not $inFunction) {
                if ($_ -match '^#+$') {
                    $inFunctionHeader = $true
                    $functionContent = $_ + "`r`n"
                    return
                }

                # detect the function declaration and extract the name
                if ($_ -match '^function\s+([\w-]+)') {
                    $functionName = $matches[1]
                    $inFunction = $true
                    $inFunctionHeader = $false
                    $functionContent += $_ + "`r`n"
                    return
                }

                # accumulate function header content (comment block)
                if ($inFunctionHeader) {
                    $functionContent += $_ + "`r`n"
                    return
                }
                return
            }

            # detect function end and emit the complete function
            if ($_ -match '^}\s*$') {
                $functionContent += $_ + "`r`n"
                $inFunction = $false
                @{
                    'functionName'    = $functionName
                    'functionContent' = $functionContent
                }
                $functionContent = ''
                $functionName = ''
                return
            }

            # accumulate function body content
            if ($inFunctionHeader -or $inFunction) {
                $functionContent += $_ + "`r`n"
                return
            }
        }

        # verify that functions were found in the module
        if (-not $functions) {
            Microsoft.PowerShell.Utility\Write-Verbose 'No functions were found in the module file'
            return
        }

        # save each extracted function to its own file
        $functions | Microsoft.PowerShell.Core\ForEach-Object {
            $functionFilePath = GenXdev.FileSystem\Expand-Path ([System.IO.Path]::Combine(
                    $functionsDir,
                    "$($_.functionName).ps1"
                )) -CreateDirectory

            [System.IO.File]::WriteAllText($functionFilePath, $_.functionContent)
            Microsoft.PowerShell.Utility\Write-Verbose "Saved function $($_.functionName) to $functionFilePath"
        }
    }

    end {
        # update the module file to dot-source all function files
        Microsoft.PowerShell.Utility\Write-Verbose 'Updating module file to dot-source function files'
@"
if (-not `$IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

`$osVersion = [System.Environment]::OSVersion.Version
`$major = `$osVersion.Major
`$build = `$osVersion.Build

if (`$major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}
$PSItem

"@  | Microsoft.PowerShell.Utility\Out-File $psm1FilePath -Force

        Microsoft.PowerShell.Management\Get-ChildItem "$functionsDir\*.ps1" -File -Recurse `
            -ErrorAction SilentlyContinue |
            Microsoft.PowerShell.Core\ForEach-Object {
                if ($PSItem.Name.StartsWith('_')) {
                    return;
                }
                $dirName = [IO.Path]::GetFileName([IO.Path]::GetDirectoryName($_))
                ". `"`$PSScriptRoot\Functions\$dirName\$($_.Name)`""
            } |
            Microsoft.PowerShell.Utility\Out-File $psm1FilePath -Force -Append

        Microsoft.PowerShell.Utility\Write-Verbose 'Module splitting completed successfully'
    }
}