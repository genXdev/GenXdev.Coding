<##############################################################################
Part of PowerShell module : GenXdev.Coding.Git
Original cmdlet filename  : PermanentlyDeleteGitFolders.ps1
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
###############################################################################
<#
.SYNOPSIS
Permanently deletes specified folders from all branches in a Git repository.

.DESCRIPTION
Cleans a Git repository by removing specified folders from the entire commit
history across all branches. This is done by cloning the repository, using
git filter-branch to remove the folders, and force pushing the changes back.
This operation is destructive and permanently rewrites Git history.

.PARAMETER RepoUri
The Git repository URI to clean (HTTPS or SSH format).

.PARAMETER Folders
Array of folder paths to remove from the repository history. Paths can be
specified with forward or back slashes.

.NOTES
This operation is destructive and cannot be undone. It rewrites Git history and
requires force pushing, which affects all repository users.

.EXAMPLE
PermanentlyDeleteGitFolders `
    -RepoUri "https://github.com/user/repo.git" `
    -Folders "bin", "obj"
#>
function PermanentlyDeleteGitFolders {

    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([string[]])]
    param(
        ########################################################################
        [parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'The URI of the Git repository to clean'
        )]
        [string] $RepoUri,
        ########################################################################
        [parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = 'Array of folder paths to permanently remove'
        )]
        [string[]] $Folders
        ########################################################################
    )

    begin {

        # display prominent warnings about the destructive nature of this operation
        Microsoft.PowerShell.Utility\Write-Warning '!!! DANGER - PERMANENT DESTRUCTIVE OPERATION !!!'
        Microsoft.PowerShell.Utility\Write-Warning ('This operation will permanently delete the specified ' +
            'folders from ALL git history')
        Microsoft.PowerShell.Utility\Write-Warning ('It rewrites Git history and force pushes the changes, ' +
            'which CANNOT BE UNDONE')
        Microsoft.PowerShell.Utility\Write-Warning ('Other users of this repository will need to re-clone ' +
            'or reset their local copies')

        # create unique temp directory using UTC ticks for isolation
        $tempPath = GenXdev.FileSystem\Expand-Path (
            "$Env:TEMP\$([datetime]::UtcNow.Ticks)"
        ) -CreateDirectory
        Microsoft.PowerShell.Utility\Write-Verbose "Using temp directory: $tempPath"

        # store current location to restore at end
        Microsoft.PowerShell.Management\Push-Location
    }


    process {

        # final confirmation before proceeding with destructive operation
        if (-not $PSCmdlet.ShouldProcess(
                ("Repository: $RepoUri - Permanently delete folders: " +
                "$($Folders -join ', ')"),
                ('Are you ABSOLUTELY SURE you want to permanently remove ' +
                'these folders from ALL git history?'),
                'DANGER: Permanent Git History Modification')) {
            Microsoft.PowerShell.Utility\Write-Verbose 'Operation cancelled by user'
            return
        }

        try {
            # change to temp directory
            Microsoft.PowerShell.Management\Set-Location -LiteralPath $tempPath
            Microsoft.PowerShell.Utility\Write-Verbose 'Changed to temp directory'

            # clone the repository
            Microsoft.PowerShell.Utility\Write-Verbose "Cloning repository: $RepoUri"
            $null = git clone $RepoUri repo

            # change to repo directory
            Microsoft.PowerShell.Management\Set-Location -LiteralPath repo
            Microsoft.PowerShell.Utility\Write-Verbose 'Changed to repository directory'

            # create tracking branches for all remote branches except HEAD
            Microsoft.PowerShell.Utility\Write-Verbose 'Creating tracking branches'
            git branch -r | Microsoft.PowerShell.Core\ForEach-Object {

                if (-not $PSItem.Contains('/HEAD')) {
                    $null = git checkout --track $PSItem.Trim()
                }

                # process each folder to remove
                foreach ($folder in $Folders) {

                    # normalize folder path to use forward slashes
                    $folderFixed = $folder.replace('\', '/')
                    if ($folderFixed.endswith('/')) {
                        $folderFixed = $folderFixed.Substring(0, $folderFixed.Length - 1)
                    }

                    if ($PSCmdlet.ShouldProcess($folderFixed, 'Removing from Git history')) {
                        # remove folder from git history
                        Microsoft.PowerShell.Utility\Write-Verbose "Removing $folderFixed from history"
                        $filterCommand = "git rm -rf --cached --ignore-unmatch $folderFixed/"
                        git filter-branch --index-filter $filterCommand --prune-empty --tag-name-filter cat -- --all
                    }
                }

                try {
                    # clean up refs
                    Microsoft.PowerShell.Utility\Write-Verbose 'Cleaning up refs'
                    $refs = git for-each-ref --format="%(refname)" refs/original/
                    foreach ($ref in $refs) {
                        git update-ref -d $ref
                    }

                    # remove old refs and logs
                    Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath @('.git/logs', '.git/refs/original') `
                        -ErrorAction SilentlyContinue -Directory |
                        Microsoft.PowerShell.Core\ForEach-Object -ErrorAction SilentlyContinue {
                            Microsoft.PowerShell.Management\Remove-Item -LiteralPath $PSItem.FullName -Force -Recurse `
                                -ErrorAction SilentlyContinue
                        }
                    }
                    catch {
                        Microsoft.PowerShell.Utility\Write-Verbose "Error cleaning up refs (non-critical): $_"
                    }

                    # garbage collect to remove unreferenced commits
                    Microsoft.PowerShell.Utility\Write-Verbose 'Running garbage collection'
                    $null = git gc --prune=all --aggressive

                    # force push changes to remote
                    if ($PSCmdlet.ShouldProcess('Origin', 'Force pushing all changes')) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Force pushing changes to remote'
                        $null = git push origin --all --force
                        $null = git push origin --tags --force
                    }
                }
            }
            finally {
                # restore original working directory
                Microsoft.PowerShell.Management\Pop-Location
                Microsoft.PowerShell.Utility\Write-Verbose 'Restored original location'
            }
        }

        end {
        }
    }