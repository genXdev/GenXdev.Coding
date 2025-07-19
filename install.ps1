Microsoft.PowerShell.Core\Import-Module GenXdev.FileSystem

Microsoft.PowerShell.Management\Push-Location $PSScriptRoot

try {
    try {

        $localPath = '..\..\GenXdev.Local\'
        [Version]$version = $null

        if ([IO.Directory]::Exists($localPath)) {

            $version = Microsoft.PowerShell.Management\Get-ChildItem "$localPath\*.*.*" -Directory -ErrorAction SilentlyContinue |
                Microsoft.PowerShell.Core\Where-Object {
                    [Version]::TryParse($_.Name, [ref]$version)
                }
            Microsoft.PowerShell.Utility\Sort-Object {

                [Version]::new($_.Name)

            } -Descending | Microsoft.PowerShell.Utility\Select-Object -First 1

            if (-not $version) { return }

            try {
                [System.IO.Directory]::Move(
                    "$localPath\$($version.Name)",
                    "$localPath\1.208.2025"
                )
            }
            catch {
                GenXdev.FileSystem\Start-RoboCopy "$localPath\$($version.Name)" "$localPath\1.208.2025"
            }
        }
    }
    finally {
        Microsoft.PowerShell.Management\Pop-Location
    }
}
catch {

}
