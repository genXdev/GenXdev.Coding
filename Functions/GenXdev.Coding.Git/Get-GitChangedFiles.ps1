<##############################################################################
Part of PowerShell module : GenXdev.Coding.Git
Original cmdlet filename  : Get-GitChangedFiles.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
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
function Get-GitChangedFiles {
    <#
    .SYNOPSIS
        Get the list of changed files in a Git repository.

    .DESCRIPTION
        This function retrieves the list of files that have been changed in the current Git repository.
        It can be used to identify which files have been modified, added, or deleted.
        By default, returns relative paths with .\ prefix. Use -PassThru to get FileInfo objects.

    .PARAMETER PassThru
        Returns FileInfo objects (like Get-ChildItem) instead of path strings.

    .EXAMPLE
        Get-GitChangedFile
        Returns relative paths like ".\Modules\GenXdev.AI\1.300.2025\README.md"

    .EXAMPLE
        Get-GitChangedFile -PassThru
        Returns FileInfo objects for each changed file
    #>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('gitchanged')]
    param(
        [switch]$PassThru
    )

    # Ensure the current directory is a Git repository
    if ('true' -ne (git rev-parse --is-inside-work-tree)) {
        Microsoft.PowerShell.Utility\Write-Error 'This command must be run inside a Git repository.'
        return
    }

    # Get the list of changed files
    $changedFiles = git diff --name-only HEAD

    if ($changedFiles) {
        $changedFiles | Microsoft.PowerShell.Core\ForEach-Object {
            $file = $_.Trim()
            if ($PassThru) {
                # Return FileInfo object like Get-ChildItem would
                if (Microsoft.PowerShell.Management\Test-Path -LiteralPath $file) {
                    Microsoft.PowerShell.Management\Get-Item -LiteralPath $file
                } else {
                    # For deleted files, we can't get FileInfo, so return a custom object
                    [PSCustomObject]@{
                        Name         = Microsoft.PowerShell.Management\Split-Path $file -Leaf
                        FullName     = (Microsoft.PowerShell.Management\Resolve-Path -LiteralPath $file -ErrorAction SilentlyContinue).Path
                        RelativePath = $file
                        Exists       = $false
                    }
                }
            } else {
                # Return relative path with .\ prefix
                ".\$($file.Replace('/', '\'))"
            }
        }
    } else {
        Microsoft.PowerShell.Utility\Write-Output 'No changed files found.'
    }
}