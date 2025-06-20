################################################################################
<#
.SYNOPSIS
Creates a pull request for changes made to a GenXdev module.

.DESCRIPTION
This function automates the process of creating a pull request for changes made to
a GenXdev module. It handles GitHub authentication, repository forking, and pull
request creation.

.PARAMETER ModuleName
The name of the GenXdev module to create a pull request for.

.PARAMETER CommitMessage
The commit message to use when committing changes.

.PARAMETER PullRequestTitle
The title for the pull request.

.PARAMETER PullRequestDescription
The description for the pull request.

.EXAMPLE
New-PullRequestForGenXdevModuleChanges -ModuleName "GenXdev.Coding" `
    -CommitMessage "Added new features" `
    -PullRequestTitle "New Features" `
    -PullRequestDescription "Added support for X and Y"

.EXAMPLE
prmodule GenXdev.Coding "Bug fixes" "Fixed issues" "Various bug fixes implemented"
#>
function New-PullRequestForGenXdevModuleChanges {

    [CmdletBinding(SupportsShouldProcess)]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]

    [Alias("prgenxdevmodule")]

    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "Name of the GenXdev module"
        )]
        [ValidateSet(
            "GenXdev.AI",
            "GenXdev.Coding",
            "GenXdev.Console",
            "GenXdev.Data",
            "GenXdev.FileSystem",
            "GenXdev.Helpers",
            "GenXdev.Queries",
            "GenXdev.Webbrowser",
            "GenXdev.Windows"
        )]
        [string]$ModuleName,
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "Message for the commit"
        )]
        [string]$CommitMessage = "Improvements to GenXdev module",
        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = "Title for the pull request"
        )]
        [string]$PullRequestTitle = "Module improvements",
        ########################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = "Description for the pull request"
        )]
        [string]$PullRequestDescription = "These changes improve functionality " +
        "and fix issues I encountered.",
        ########################################################################
        [Parameter(
            Position = 4,
            Mandatory = $false,
            HelpMessage = "Git username for commits"
        )]
        [string]$GitUserName = "Your Name",
        ########################################################################
        [Parameter(
            Position = 5,
            Mandatory = $false,
            HelpMessage = "Git email for commits"
        )]
        [string]$GitUserEmail = "you@example.com"
        ########################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Host "This script is not yet fully functional and is a work in progress." -ForegroundColor Cyan
        Microsoft.PowerShell.Utility\Write-Host "Feel free to fix it ;-)." -ForegroundColor Cyan
        $null = git config --global --add safe.directory (GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\..\")
        $w = "store/fileupload"
        Microsoft.PowerShell.Utility\Write-Verbose "Checking for GitHub CLI installation"
        GenXdev.AI\EnsureGithubCLIInstalled
    }


    process {
        throw (
            Microsoft.PowerShell.Utility\New-Object "System.NotImplementedException" `
                -ArgumentList "This function is not yet fully functional and is a work in progress. Feel free to fix it ;-)."
        )

        function Register-GitHubApp {

            # GitHub OAuth application credentials
            $clientId = "Ov23livZivIhWiBMR3Yb"

            # Start device flow authentication
            GenXdev.Webbrowser\Close-Webbrowser -Force
            GenXdev.Webbrowser\Open-Webbrowser -nw -mon 0 -Right
            GenXdev.Webbrowser\Select-WebbrowserTab
            GenXdev.Windows\Set-WindowPosition -Left

            $deviceCodeRequest = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://github.com/login/device/code" -Body @{
                client_id = $clientId
                scope     = "repo"
            } -Headers @{
                Accept = "application/json"
            }

            GenXdev.Webbrowser\Set-WebbrowserTabLocation ($deviceCodeRequest.verification_uri)

            Microsoft.PowerShell.Utility\Write-Host "Please visit: $($deviceCodeRequest.verification_uri)"
            Microsoft.PowerShell.Utility\Write-Host "And enter code: $($deviceCodeRequest.user_code)"
            Microsoft.PowerShell.Utility\Write-Host "Waiting for authentication..."

            # Poll for the token
            $token = $null
            $startTime = Microsoft.PowerShell.Utility\Get-Date
            while (((Microsoft.PowerShell.Utility\Get-Date) - $startTime).TotalSeconds -lt 300) {
                try {
                    $tokenResponse = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://github.com/login/oauth/access_token" -Body @{
                        client_id   = $clientId
                        device_code = $deviceCodeRequest.device_code
                        grant_type  = "urn:ietf:params:oauth:grant-type:device_code"
                    } -Headers @{
                        Accept = "application/json"
                    }

                    if ($tokenResponse.access_token) {
                        $token = $tokenResponse.access_token
                        break
                    }

                    if ($tokenResponse.error -eq "authorization_pending") {
                        Microsoft.PowerShell.Utility\Write-Verbose "Authorization pending. Waiting for user to authorize..."
                    }
                    elseif ($tokenResponse.error -eq "slow_down") {
                        Microsoft.PowerShell.Utility\Write-Verbose "Rate limit hit. Slowing down polling..."
                        Microsoft.PowerShell.Utility\Start-Sleep -Seconds 10
                    }
                    else {
                        Microsoft.PowerShell.Utility\Write-Error "Unexpected error: $($tokenResponse.error)"
                        break
                    }
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Verbose "Still waiting for user to authorize..."
                }

                Microsoft.PowerShell.Utility\Start-Sleep -Seconds 5
            }

            if (-not $token) {
                Microsoft.PowerShell.Utility\Write-Error "Authentication failed or timed out"
            }

            return $token
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Checking dependencies for $ModuleName"
        GenXdev.Coding\Assert-GenXdevDependencyUsage -BaseModuleName $ModuleName -ErrorAction Stop

        Microsoft.PowerShell.Utility\Write-Verbose "Running unit tests for $ModuleName"
        try {
            GenXdev.Coding\Assert-GenXdevUnitTest -ModuleName $ModuleName -ErrorAction Stop
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error "Unit tests failed for $($ModuleName): $_"
            return
        }

        # get full path to module
        $modulePath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\$ModuleName\1.184.2025\"

        Microsoft.PowerShell.Utility\Write-Verbose "Checking for module manifest at: $modulePath"
        if (!(Microsoft.PowerShell.Management\Test-Path -Path "$modulePath\$ModuleName.psd1")) {
            Microsoft.PowerShell.Utility\Write-Error "No module manifest found in module directory"
            return
        }

        # load module version information
        $manifestFile = GenXdev.FileSystem\Expand-Path "$modulePath\$ModuleName.psd1"
        $moduleVersion = (Microsoft.PowerShell.Utility\Import-PowerShellDataFile $manifestFile).ModuleVersion

        Microsoft.PowerShell.Utility\Write-Verbose "Processing $ModuleName version $moduleVersion"

        $repoSearchResult = $null

        # authenticate with github
        Microsoft.PowerShell.Utility\Write-Verbose "Authenticating with GitHub"
        $token = Register-GitHubApp
        if ($null -ne $token) {

            # Find the original repository
            $headers = @{
                Authorization = "token $token"
                Accept        = "application/vnd.github.v3+json"
            }

            # Search for the repository in genXdev organization
            $repoSearchResult = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/genXdev/$ModuleName" -Headers $headers -ErrorAction SilentlyContinue
        }

        if (!$repoSearchResult) {
            Microsoft.PowerShell.Utility\Write-Host "Repository not found. Uploading to genXdev.net instead..."

            # Get module path and create zip file
            try {
                $zipPath = [System.IO.Path]::GetTempFileName() + ".zip"
                Microsoft.PowerShell.Archive\Compress-Archive -Path "$modulePath\*" -DestinationPath $zipPath -Force
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Error "Failed to compress module directory: $_"
                return
            }

            try {
                $uploadUrl = ("https://genxdev.net/$w?filename=$([Uri]::EscapeDataString(
                    "$ModuleName.zip"))&session=$([Uri]::EscapeDataString(
                        [Guid]::NewGuid().ToString().ToLowerInvariant()))");

                $fileBytes = [System.IO.File]::ReadAllBytes($zipPath)

                $result = Microsoft.PowerShell.Utility\Invoke-RestMethod -Uri $uploadUrl `
                    -Method Post `
                    -ContentType "application/octet-stream" `
                    -Body $fileBytes

                Microsoft.PowerShell.Utility\Write-Verbose "Upload result: $($result | Microsoft.PowerShell.Utility\ConvertTo-Json -Compress)"
                Microsoft.PowerShell.Utility\Write-Host "Module successfully uploaded to genXdev.net"
                Microsoft.PowerShell.Utility\Write-Host "Please contact genXdev to inform about the new module suggestion."
                return
            }
            finally {
                try {
                    Microsoft.PowerShell.Management\Remove-Item $zipPath -Force
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Error "Failed to remove temporary zip file: $_"
                }
            }
        }

        Microsoft.PowerShell.Utility\Write-Host "Found original repository: $($repoSearchResult.html_url)"

        # Create a fork if doesn't exist
        $username = (Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri "https://api.github.com/user" -Headers $headers).login

        try {
            Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/$username/$ModuleName" -Headers $headers
            Microsoft.PowerShell.Utility\Write-Verbose "Fork already exists"
        }
        catch {
            # Fork doesn't exist, create it
            if ($PSCmdlet.ShouldProcess("$ModuleName", "Create fork")) {
                Microsoft.PowerShell.Utility\Write-Host "Creating fork of $ModuleName..."
                try {
                    Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://api.github.com/repos/genXdev/$ModuleName/forks" -Headers $headers
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Error "Failed to create fork: $_"
                    return
                }
            }
        }

        # Setup git and push changes
        if ($PSCmdlet.ShouldProcess("$ModuleName", "Push changes to GitHub")) {
            Microsoft.PowerShell.Management\Push-Location $modulePath
            try {
                try {
                    # Add the directory to Git's safe directory list
                    Microsoft.PowerShell.Utility\Write-Verbose "Adding $modulePath to Git's safe directory list"
                    git config --global --add safe.directory $modulePath

                    # Remove the .git folder if it exists
                    $gitFolderPath = Microsoft.PowerShell.Management\Join-Path -Path $modulePath -ChildPath ".git"
                    if (Microsoft.PowerShell.Management\Test-Path -Path $gitFolderPath) {
                        Microsoft.PowerShell.Utility\Write-Verbose "Removing existing .git folder at $gitFolderPath"
                        GenXdev.FileSystem\Remove-AllItems $gitFolderPath -DeleteFolder
                    }

                    # Initialize a new Git repository
                    git init

                    # Ensure the remote URLs are correctly formatted
                    $originUrl = "https://$token@github.com/$username/$ModuleName.git/"
                    $upstreamUrl = "https://$token@github.com/genXdev/$ModuleName.git/"

                    # Check if remotes already exist
                    if (-not (git remote | Microsoft.PowerShell.Utility\Select-String -Pattern "^origin$")) {
                        git remote add origin $originUrl
                        Microsoft.PowerShell.Utility\Write-Verbose "Added origin remote: $originUrl"
                    }
                    if (-not (git remote | Microsoft.PowerShell.Utility\Select-String -Pattern "^upstream$")) {
                        git remote add upstream $upstreamUrl
                        Microsoft.PowerShell.Utility\Write-Verbose "Added upstream remote: $upstreamUrl"
                    }

                    # Configure Git user identity using GitHub API details
                    git config user.name $GitUserName
                    Microsoft.PowerShell.Utility\Write-Verbose "Git user.name set to '$GitUserName'."
                    git config user.email $GitUserEmail
                    Microsoft.PowerShell.Utility\Write-Verbose "Git user.email set to '$GitUserEmail'."

                    # Switch to the new branch
                    git checkout -b $newBranchName

                    # Add and commit changes
                    git add .
                    if (git diff --cached --quiet) {
                        Microsoft.PowerShell.Utility\Write-Verbose "No changes to commit. Skipping commit step."
                    }
                    else {
                        git commit -m $CommitMessage
                    }

                    # Push the new branch
                    git push -u origin $newBranchName -f
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Error "Git command failed: $($Error[0])"
                    return
                }
            }
            finally {
                Microsoft.PowerShell.Management\Pop-Location
            }
        }

        # --- Begin Modification ---
        # Find the commit with the exact message "Release 1.184.2025" in the GenXdev module repository using the GitHub API
        $releaseCommitMsg = "Release 1.184.2025"
        $commitsApiUrl = "https://api.github.com/repos/genXdev/$ModuleName/commits"
        $releaseCommitHash = $null

        try {
            $commits = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri $commitsApiUrl -Headers $headers
            foreach ($commit in $commits) {
                if ($commit.commit.message -eq $releaseCommitMsg) {
                    $releaseCommitHash = $commit.sha
                    break
                }
            }
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error "Failed to retrieve commits from the repository: $_"
            return
        }

        if (-not $releaseCommitHash) {
            Microsoft.PowerShell.Utility\Write-Error "No commit found with message '$releaseCommitMsg' in the repository"
            return
        }

        # Append the commit hash to the pull request description.
        $PullRequestDescription += "`nCommit hash: $releaseCommitHash"

        # Generate a unique branch name
        $timestamp = (Microsoft.PowerShell.Utility\Get-Date -Format "yyyyMMddHHmmss")
        $newBranchName = "release-branch-$timestamp"

        # Create a branch in the user's fork pointing to the desired commit
        try {
            # Create the branch
            $createBranchBody = @{
                ref = "refs/heads/$newBranchName"
                sha = $releaseCommitHash
            }
            Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://api.github.com/repos/$username/$ModuleName/git/refs" -Body ($createBranchBody | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10) -Headers $headers -ContentType "application/json"
            Microsoft.PowerShell.Utility\Write-Verbose "Branch '$newBranchName' created in the user's fork."
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error "Failed to create branch '$newBranchName' in the user's fork: $($Error[0])"
            return
        }

        # Fetch GitHub user details
        Microsoft.PowerShell.Utility\Write-Verbose "Fetching GitHub user details"
        try {
            $userDetails = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri "https://api.github.com/user" -Headers $headers -ErrorAction Stop
            $GitUserName = $userDetails.name
            $GitUserEmail = $userDetails.email

            if (-not $GitUserName) {
                $GitUserName = $userDetails.login
                Microsoft.PowerShell.Utility\Write-Verbose "GitHub user name not set, using login: $GitUserName"
            }

            if (-not $GitUserEmail) {
                $GitUserEmail = "$($userDetails.login)@users.noreply.github.com"
                Microsoft.PowerShell.Utility\Write-Verbose "GitHub user email not set, using noreply email: $GitUserEmail"
            }
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error "Failed to fetch GitHub user details: $($Error[0])"
            return
        }

        # Ensure changes are committed to the new branch
        if ($PSCmdlet.ShouldProcess("$ModuleName", "Push changes to GitHub")) {
            Microsoft.PowerShell.Management\Push-Location $modulePath
            try {
                try {
                    # Add the directory to Git's safe directory list
                    Microsoft.PowerShell.Utility\Write-Verbose "Adding $modulePath to Git's safe directory list"
                    git config --global --add safe.directory $modulePath

                    # Remove the .git folder if it exists
                    $gitFolderPath = Microsoft.PowerShell.Management\Join-Path -Path $modulePath -ChildPath ".git"
                    if (Microsoft.PowerShell.Management\Test-Path -Path $gitFolderPath) {
                        Microsoft.PowerShell.Utility\Write-Verbose "Removing existing .git folder at $gitFolderPath"
                        GenXdev.FileSystem\Remove-AllItems $gitFolderPath -DeleteFolder
                    }

                    # Initialize a new Git repository
                    git init

                    # Ensure the remote URLs are correctly formatted
                    $originUrl = "https://$token@github.com/$username/$ModuleName.git/"
                    $upstreamUrl = "https://$token@github.com/genXdev/$ModuleName.git/"

                    # Check if remotes already exist
                    if (-not (git remote | Microsoft.PowerShell.Utility\Select-String -Pattern "^origin$")) {
                        git remote add origin $originUrl
                        Microsoft.PowerShell.Utility\Write-Verbose "Added origin remote: $originUrl"
                    }
                    if (-not (git remote | Microsoft.PowerShell.Utility\Select-String -Pattern "^upstream$")) {
                        git remote add upstream $upstreamUrl
                        Microsoft.PowerShell.Utility\Write-Verbose "Added upstream remote: $upstreamUrl"
                    }

                    # Configure Git user identity using GitHub API details
                    git config user.name $GitUserName
                    Microsoft.PowerShell.Utility\Write-Verbose "Git user.name set to '$GitUserName'."
                    git config user.email $GitUserEmail
                    Microsoft.PowerShell.Utility\Write-Verbose "Git user.email set to '$GitUserEmail'."

                    # Switch to the new branch
                    git checkout -b $newBranchName

                    # Add and commit changes
                    git add .
                    if (git diff --cached --quiet) {
                        Microsoft.PowerShell.Utility\Write-Verbose "No changes to commit. Skipping commit step."
                    }
                    else {
                        git commit -m $CommitMessage
                    }

                    # Push the new branch
                    git push -u origin $newBranchName -f
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Error "Git command failed: $($Error[0])"
                    return
                }
            }
            finally {
                Microsoft.PowerShell.Management\Pop-Location
            }
        }

        # # Ensure the branch contains changes before creating the pull request
        # $compareUrl = "https://api.github.com/repos/genXdev/$ModuleName/compare/main...${username}:$newBranchName"
        # try {
        #     $compareResult = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri $compareUrl -Headers $headers -ErrorAction Stop
        #     if ($compareResult.commits.Count -eq 0) {
        #         Microsoft.PowerShell.Utility\Write-Error "No commits between genXdev:main and ${username}:$newBranchName. Ensure changes are committed before creating the pull request."
        #         return
        #     }
        # }
        # catch {
        #     Microsoft.PowerShell.Utility\Write-Error "Failed to compare branches: $($Error[0])"
        #     return
        # }

        # Create pull request
        if ($PSCmdlet.ShouldProcess("$ModuleName", "Create pull request")) {
            try {
                $prBody = @{
                    title = $PullRequestTitle
                    body  = $PullRequestDescription
                    head  = "${username}:${newBranchName}"  # Use the new branch in the user's fork
                    base  = "main"
                }

                # Create the pull request
                $pr = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://api.github.com/repos/genXdev/$ModuleName/pulls" -Body ($prBody | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 10) -Headers $headers -ContentType "application/json"

                Microsoft.PowerShell.Utility\Write-Host "Pull request created successfully: $($pr.html_url)" -ForegroundColor Cyan
                Microsoft.PowerShell.Utility\Write-Host "Thank you for contributing to GenXdev!" -ForegroundColor Green
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Error "Failed to create pull request: $($Error[0])"
                return
            }
        }
    }

    end {

    }
}
################################################################################
