################################################################################
<#
.SYNOPSIS
Permanently deletes specified folders from all branches in a Git repository.

.DESCRIPTION
Clones a repository, removes specified folders from all branches and commits,
then force pushes the changes back to origin. This permanently removes the
folders from Git history.

WARNING: This operation is destructive and cannot be undone. It rewrites Git history
and requires a force push, which could cause data loss or conflicts for other users.

.PARAMETER RepoUri
The URI of the Git repository to clean.

.PARAMETER Folders
Array of folder paths to permanently remove from the repository history.

.NOTES
This function supports ShouldProcess and has a high confirmation impact level.
You will be prompted to confirm before executing the operation.

.EXAMPLE
PermanentlyDeleteGitFolders -RepoUri "https://github.com/user/repo.git" `
    -Folders "bin", "obj"
#>
function PermanentlyDeleteGitFolders {

    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([string[]])]
    param(
        #######################################################################
        [parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "The URI of the Git repository to clean"
        )]
        [string] $RepoUri,
        #######################################################################
        [parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = "Array of folder paths to permanently remove"
        )]
        [string[]] $Folders
        #######################################################################
    )

    begin {
        Write-Warning "!!! DANGER - PERMANENT DESTRUCTIVE OPERATION !!!"
        Write-Warning "This operation will permanently delete the specified folders from ALL git history"
        Write-Warning "It rewrites Git history and force pushes the changes, which CANNOT BE UNDONE"
        Write-Warning "Other users of this repository will need to re-clone or reset their local copies"

        # create a unique temporary directory using utc ticks
        $tempPath = GenXdev.FileSystem\Expand-Path "$Env:TEMP\$([datetime]::UtcNow.Ticks)" -CreateDirectory
        Write-Verbose "Using temp directory: $tempPath"

        # store current location to restore later
        Push-Location
    }

    process {
        if (-not $PSCmdlet.ShouldProcess(
                "Repository: $RepoUri - Permanently delete folders: $($Folders -join ', ')",
                "Are you ABSOLUTELY SURE you want to permanently remove these folders from ALL git history?",
                "DANGER: Permanent Git History Modification")) {
            Write-Verbose "Operation cancelled by user"
            return
        }

        try {
            # change to temp directory
            Set-Location $tempPath
            Write-Verbose "Changed to temp directory"

            # clone the repository
            Write-Verbose "Cloning repository: $RepoUri"
            $null = git clone $RepoUri repo

            # change to repo directory
            Set-Location repo
            Write-Verbose "Changed to repository directory"

            # create tracking branches for all remote branches except HEAD
            Write-Verbose "Creating tracking branches"
            git branch -r | ForEach-Object {

                if (-not $PSItem.Contains("/HEAD")) {
                    $null = git checkout --track $PSItem.Trim()
                }

                # process each folder to remove
                foreach ($folder in $Folders) {

                    # normalize folder path to use forward slashes
                    $folderFixed = $folder.replace("\", "/")
                    if ($folderFixed.endswith("/")) {
                        $folderFixed = $folderFixed.Substring(0, $folderFixed.Length - 1)
                    }

                    if ($PSCmdlet.ShouldProcess($folderFixed, "Removing from Git history")) {
                        # remove folder from git history
                        Write-Verbose "Removing $folderFixed from history"
                        $filterCommand = "git rm -rf --cached --ignore-unmatch $folderFixed/"
                        git filter-branch --index-filter $filterCommand --prune-empty --tag-name-filter cat -- --all
                    }
                }

                try {
                    # clean up refs
                    Write-Verbose "Cleaning up refs"
                    $refs = git for-each-ref --format="%(refname)" refs/original/
                    foreach ($ref in $refs) {
                        git update-ref -d $ref
                    }

                    # remove old refs and logs
                    Get-ChildItem @(".git/logs", ".git/refs/original") `
                        -ErrorAction SilentlyContinue -Directory |
                    ForEach-Object -ErrorAction SilentlyContinue {
                        Remove-Item -LiteralPath $PSItem.FullName -Force -Recurse `
                            -ErrorAction SilentlyContinue
                    }
                }
                catch {
                    Write-Verbose "Error cleaning up refs (non-critical): $_"
                }

                # garbage collect to remove unreferenced commits
                Write-Verbose "Running garbage collection"
                $null = git gc --prune=all --aggressive

                # force push changes to remote
                if ($PSCmdlet.ShouldProcess("Origin", "Force pushing all changes")) {
                    Write-Verbose "Force pushing changes to remote"
                    $null = git push origin --all --force
                    $null = git push origin --tags --force
                }
            }
        }
        finally {
            # restore original location
            Pop-Location
            Write-Verbose "Restored original location"
        }
    }

    end {
    }
}