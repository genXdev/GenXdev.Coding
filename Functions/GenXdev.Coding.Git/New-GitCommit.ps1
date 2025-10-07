<##############################################################################
Part of PowerShell module : GenXdev.Coding.Git
Original cmdlet filename  : New-GitCommit.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
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
Creates and pushes a new git commit with all changes.

.DESCRIPTION
Stages all changes in the current git repository, creates a commit with the
specified title, and pushes the changes to the remote origin. Automatically sets
up upstream tracking if needed.

.PARAMETER Title
The message to use for the git commit. If not specified, defaults to
"Improved scripts".

.EXAMPLE
New-GitCommit -Title "Added new authentication feature"

.EXAMPLE
commit "Hotfix for login issue"
#>
function New-GitCommit {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('commit')]

    param(
        ########################################################################
        [parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromRemainingArguments = $false,
            HelpMessage = 'The commit message title to use'
        )]
        [string] $Title = 'Improved scripts'
        ########################################################################
    )

    begin {

        # extract the current branch name from git's symbolic reference
        $branch = (git symbolic-ref refs/remotes/origin/HEAD).split('/')[3]
        Microsoft.PowerShell.Utility\Write-Verbose "Operating on git branch: $branch"
    }


    process {

        # add all changed files to git staging area
        Microsoft.PowerShell.Utility\Write-Verbose 'Staging all modified files...'
        if ($PSCmdlet.ShouldProcess('all changes', 'git add')) {
            $null = git add *
            if ($LASTEXITCODE -ne 0) {
                Microsoft.PowerShell.Utility\Write-Error 'Failed to stage changes'
                return
            }
        }

        # create a new commit with the specified title
        Microsoft.PowerShell.Utility\Write-Verbose ("Creating commit with message: $Title")
        if ($PSCmdlet.ShouldProcess("commit with title: $Title", 'git commit')) {
            $null = git commit -m $Title
            if ($LASTEXITCODE -ne 0) {
                Microsoft.PowerShell.Utility\Write-Error 'Failed to create commit'
                return
            }
        }

        # ensure branch is tracking upstream remote
        Microsoft.PowerShell.Utility\Write-Verbose "Configuring upstream tracking to origin/$branch"
        if ($PSCmdlet.ShouldProcess(
                "upstream branch to origin/$branch",
                'git push -u')) {

            $null = git push -u origin $branch
            if ($LASTEXITCODE -ne 0) {
                Microsoft.PowerShell.Utility\Write-Error 'Failed to set upstream branch'
                return
            }
        }

        # push committed changes to remote repository
        Microsoft.PowerShell.Utility\Write-Verbose 'Pushing changes to remote repository...'
        if ($PSCmdlet.ShouldProcess('changes to remote', 'git push')) {
            $null = git push
            if ($LASTEXITCODE -ne 0) {
                Microsoft.PowerShell.Utility\Write-Error 'Failed to push changes'
                return
            }
        }
    }

    end {
    }
}