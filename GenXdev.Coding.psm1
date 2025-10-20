if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Coding\Add-LineToREADME.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\EnsureVSCodeInstallation.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\Ideas.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\Issues.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\Open-SourceFileInIde.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\ReleaseNotes.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\Todoos.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding\VSCode.ps1"
