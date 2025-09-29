<##############################################################################
Part of PowerShell module : GenXdev.Coding.Git
Original cmdlet filename  : Get-GitChangedFiles.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
        Returns relative paths like ".\Modules\GenXdev.AI\1.288.2025\README.md"

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