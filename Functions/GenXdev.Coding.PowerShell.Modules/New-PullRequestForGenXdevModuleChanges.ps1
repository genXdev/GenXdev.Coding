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
        "and fix issues I encountered."
        ########################################################################
    )

    begin {
        $w = "store/fileupload"
        Microsoft.PowerShell.Utility\Write-Verbose "Checking for GitHub CLI installation"
        GenXdev.Coding\AssureGithubCLIInstalled
    }


process {
        function Register-GitHubApp {

            # GitHub OAuth application credentials
            $clientId = "Ov23livZivIhWiBMR3Yb"

            # Start device flow authentication
            GenXdev.Webbrowser\Close-Webbrowser -Force
            GenXdev.Webbrowser\Open-Webbrowser -nw -mon 0 -right
            GenXdev.Webbrowser\Select-WebbrowserTab
            GenXdev.Windows\Set-WindowPosition -left

            $deviceCodeRequest = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://github.com/login/device/code" -Body @{
                client_id = $clientId
                scope     = "repo"
            } -Headers @{
                Accept = "application/json"
            }

            GenXdev.Webbrowser\Set-WebbrowserTabLocation (deviceCodeRequest.verification_uri)

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
                }
                catch {
                    # Still waiting for user to authorize
                    Microsoft.PowerShell.Utility\Start-Sleep -Seconds 5
                }
            }

            return $token
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Checking dependencies for $ModuleName"
        GenXdev.Coding\Assert-GenXdevDependencyUsage -BaseModuleName $ModuleName -ErrorAction Stop

        Microsoft.PowerShell.Utility\Write-Verbose "Running unit tests for $ModuleName"
        GenXdev.Coding\Assert-GenXdevUnitTest -ModuleName $ModuleName -ErrorAction Stop

        # get full path to module
        $modulePath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\Modules\$ModuleName\1.156.2025\"

        Microsoft.PowerShell.Utility\Write-Verbose "Checking for module manifest at: $modulePath"
        if (!(Microsoft.PowerShell.Management\Test-Path -Path "$modulePath\$ModuleName.psd1")) {
            Microsoft.PowerShell.Utility\Write-Error "No module manifest found in current directory"
            exit 1
        }

        # load module version information
        $manifestFile = GenXdev.FileSystem\Expand-Path "$modulePath\$ModuleName.psd1"
        $moduleVersion = (Microsoft.PowerShell.Utility\Import-PowerShellDataFile $manifestFile).ModuleVersion

        Microsoft.PowerShell.Utility\Write-Verbose "Processing $ModuleName version $moduleVersion"

        # authenticate with github
        Microsoft.PowerShell.Utility\Write-Verbose "Authenticating with GitHub"
        $token = Register-GitHubApp
        if (!$token) {
            Microsoft.PowerShell.Utility\Write-Error "Authentication failed or timed out"
            exit 1
        }

        # Find the original repository
        $headers = @{
            Authorization = "token $token"
            Accept        = "application/vnd.github.v3+json"
        }

        # Search for the repository in genXdev organization
        $repoSearchResult = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/genXdev/$ModuleName" -Headers $headers -ErrorAction SilentlyContinue

        if (!$repoSearchResult) {
            Microsoft.PowerShell.Utility\Write-Host "Repository not found. Uploading to genXdev.net instead..."

            # Get module path and create zip file
            $modulePath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\Modules\$ModuleName\1.156.2025\"
            $zipPath = [System.IO.Path]::GetTempFileName() + ".zip"
            Microsoft.PowerShell.Archive\Compress-Archive -Path "$modulePath\*" -DestinationPath $zipPath -Force

            try {
                $uploadUrl = ("https://genxdev.net/$w?filename=$([Uri]::EscapeDataString(
                    "$ModuleName.zip"))&session=$([Uri]::EscapeDataString(
                        [Guid]::NewGuid().ToString().ToLowerInvariant()))");

                $boundary = [System.Guid]::NewGuid().ToString()
                $fileBin = [System.IO.File]::ReadAllBytes($zipPath)
                $enc = [System.Text.Encoding]::GetEncoding("iso-8859-1")
                $fileEnc = $enc.GetString($fileBin)

                $LF = "`r`n"
                $bodyLines = (
                    "--$boundary",
                    "Content-Disposition: form-data; name=`"file`"; filename=`"$ModuleName.zip`"",
                    "Content-Type: application/x-zip-compressed$LF",
                    $fileEnc,
                    "--$boundary--$LF"
                ) -join $LF

                $result = Microsoft.PowerShell.Utility\Invoke-RestMethod -Uri $uploadUrl `
                    -Method Post `
                    -ContentType "multipart/form-data; boundary=$boundary" `
                    -Body $bodyLines

                Microsoft.PowerShell.Utility\Write-Verbose "Upload result: $($result | Microsoft.PowerShell.Utility\ConvertTo-Json -Compress)"
                Microsoft.PowerShell.Utility\Write-Host "Module successfully uploaded to genXdev.net"
                Microsoft.PowerShell.Utility\Write-Host "Please contact genXdev to inform about the new module suggestion."
                return
            }
            finally {
                Microsoft.PowerShell.Management\Remove-Item $zipPath -Force
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
                Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://api.github.com/repos/genXdev/$ModuleName/forks" -Headers $headers
            }
        }

        # Setup git and push changes
        if ($PSCmdlet.ShouldProcess("$ModuleName", "Push changes to GitHub")) {
            git init
            git config user.name $username
            git remote add origin "https://github.com/$username/$ModuleName.git"
            git remote add upstream "https://github.com/genXdev/$ModuleName.git"

            # Add, commit and push changes
            git add .
            git commit -m $CommitMessage
            git branch -M main
            git push -u origin main -f
        }

        # --- Begin Extension ---
        # Find the commit with the exact message "Release 1.156.2025" and extract its commit hash
        $releaseCommitMsg = "Release 1.156.2025"
        $releaseCommitHash = (git log --grep="^$releaseCommitMsg$" --format="%H" -n 1).Trim()
        if (-not $releaseCommitHash) {
            Microsoft.PowerShell.Utility\Write-Error "No commit found with message '$releaseCommitMsg'"
            exit 1
        }
        # Append the commit hash to the pull request description.
        $PullRequestDescription += "`nCommit hash: $releaseCommitHash"
        # --- End Extension ---

        # Create pull request
        if ($PSCmdlet.ShouldProcess("$ModuleName", "Create pull request")) {
            $prBody = @{
                title = $PullRequestTitle
                body  = $PullRequestDescription
                head  = "$username:main"
                base  = "main"
            }

            $pr = Microsoft.PowerShell.Utility\Invoke-RestMethod -Method Post -Uri "https://api.github.com/repos/genXdev/$ModuleName/pulls" -Body ($prBody | Microsoft.PowerShell.Utility\ConvertTo-Json) -Headers $headers -ContentType "application/json"

            Microsoft.PowerShell.Utility\Write-Host "Pull request created successfully: $($pr.html_url)"
            Microsoft.PowerShell.Utility\Write-Host "Thank you for contributing to GenXdev!"
        }
    }

    end {

    }
}
################################################################################
