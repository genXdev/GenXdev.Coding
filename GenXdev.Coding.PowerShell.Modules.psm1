if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Add-MissingGenXdevUnitTests.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdlet.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevCmdletTests.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevDependencyUsage.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Assert-GenXdevTest.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Assert-ModuleDefinition.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Assert-RefactorFile.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Clear-GenXdevModules.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Complete-GenXDevREADME.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\EnsureCopilotKeyboardShortCut.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\EnsureDefaultGenXdevRefactors.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXdevCmdletUsageAnalysis.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevModule.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevModuleInfo.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-GenXDevNewModulesInOrderOfDependency.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-ModuleHelpMarkdown.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-Refactor.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Get-RefactorReport.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Invoke-GenXdevPSFormatter.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Invoke-GenXdevScriptAnalyzer.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\New-GenXdevCmdlet.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\New-GenXdevModule.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\New-PullRequestForGenXdevModuleChanges.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\New-Refactor.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Open-GenXdevCmdletsContainingClipboardTextInIde.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Remove-Refactor.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Search-GenXdevCmdlet.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Show-GenXdevCmdLetInIde.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\SplitUpPsm1File.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Start-NextRefactor.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Test-RefactorLLMSelection.ps1"
. "$PSScriptRoot\Functions\GenXdev.Coding.PowerShell.Modules\Update-Refactor.ps1"
