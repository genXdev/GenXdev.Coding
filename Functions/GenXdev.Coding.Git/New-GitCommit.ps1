###############################################################################
<#
.SYNOPSIS
Creates and pushes a new git commit with all changes.

.DESCRIPTION
Adds all changes, creates a commit with the specified title, and pushes to the
current branch's remote origin.

.PARAMETER Title
The commit message title to use. Defaults to "Improved scripts".

.EXAMPLE
New-GitCommit -Title "Added new feature"

.EXAMPLE
commit "Fixed bug"
#>
function New-GitCommit {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("commit")]

    param(
        #######################################################################
        [parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromRemainingArguments = $false,
            HelpMessage = "The commit message title"
        )]
        [string] $Title = "Improved scripts"
        #######################################################################
    )

    begin {

        # get the current branch name from git
        $branch = (git symbolic-ref refs/remotes/origin/HEAD).split("/")[3]
        Write-Verbose "Current branch: $branch"
    }

    process {

        # stage all changes
        Write-Verbose "Staging all changes..."
        if ($PSCmdlet.ShouldProcess("all changes", "git add")) {
            $null = git add *
            if ($LASTEXITCODE -ne 0) {
                Write-Error "Failed to stage changes"
                return
            }
        }

        # create the commit
        Write-Verbose "Creating commit with title: $Title"
        if ($PSCmdlet.ShouldProcess("commit with title: $Title", "git commit")) {
            $null = git commit -m $Title
            if ($LASTEXITCODE -ne 0) {
                Write-Error "Failed to create commit"
                return
            }
        }

        # set upstream branch
        Write-Verbose "Setting upstream branch to origin/$branch"
        if ($PSCmdlet.ShouldProcess("upstream branch to origin/$branch", "git push -u")) {
            $null = git push -u origin $branch
            if ($LASTEXITCODE -ne 0) {
                Write-Error "Failed to set upstream branch"
                return
            }
        }

        # push changes
        Write-Verbose "Pushing changes to remote"
        if ($PSCmdlet.ShouldProcess("changes to remote", "git push")) {
            $null = git push
            if ($LASTEXITCODE -ne 0) {
                Write-Error "Failed to push changes"
                return
            }
        }
    }

    end {
    }
}
