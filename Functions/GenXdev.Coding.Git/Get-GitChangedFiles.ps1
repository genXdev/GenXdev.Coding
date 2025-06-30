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
        Returns relative paths like ".\Modules\GenXdev.AI\1.198.2025\README.md"

    .EXAMPLE
        Get-GitChangedFile -PassThru
        Returns FileInfo objects for each changed file
    #>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('gitchanged', 'Get-GitChangedFile')]
    param(
        [switch]$PassThru
    )

    # Ensure the current directory is a Git repository
    if ("true" -ne (git rev-parse --is-inside-work-tree)) {
        Microsoft.PowerShell.Utility\Write-Error "This command must be run inside a Git repository."
        return
    }

    # Get the list of changed files
    $changedFiles = git diff --name-only HEAD

    if ($changedFiles) {
        $changedFiles | Microsoft.PowerShell.Core\ForEach-Object {
            $file = $_.Trim()
            if ($PassThru) {
                # Return FileInfo object like Get-ChildItem would
                if (Microsoft.PowerShell.Management\Test-Path $file) {
                    Microsoft.PowerShell.Management\Get-Item $file
                } else {
                    # For deleted files, we can't get FileInfo, so return a custom object
                    [PSCustomObject]@{
                        Name = Microsoft.PowerShell.Management\Split-Path $file -Leaf
                        FullName = (Microsoft.PowerShell.Management\Resolve-Path $file -ErrorAction SilentlyContinue).Path
                        RelativePath = $file
                        Exists = $false
                    }
                }
            } else {
                # Return relative path with .\ prefix
                ".\$($file.Replace('/', '\'))"
            }
        }
    } else {
        Microsoft.PowerShell.Utility\Write-Output "No changed files found."
    }
}