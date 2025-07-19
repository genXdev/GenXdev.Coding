function Invoke-GenXdevPSFormatter {
    [CmdletBinding()]
    param (
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Specifies the path to the script file to format.')]
        [Alias('Name', 'FullName', 'ImagePath', 'FileName', 'ScriptFileName')]
        [string] $Path,

        [Parameter(HelpMessage = 'A settings hashtable or a path to a PowerShell data file (.psd1) that contains the formatting settings.')]
        [Object] $Settings,

        [Parameter(HelpMessage = 'The range within which formatting should take place as an array of four integers: starting line number, starting column number, ending line number, ending column number.')]
        [int[]] $Range,

        [Parameter(HelpMessage = 'Recursively process files in subdirectories.')]
        [switch] $Recurse
    )
    begin {
        if (-not $Settings) {
            try {
                $settingsPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\PSScriptAnalyzerFormattingSettings.psd1"
                if ([IO.File]::Exists($settingsPath)) {
                    $settings = Microsoft.PowerShell.Utility\Invoke-Expression ([IO.File]::ReadAllText($settingsPath))

                    # Use formatting-specific settings if available
                    if ($settings.CodeFormatting) {
                        $Settings = $settings.CodeFormatting
                    }
                    elseif ($settings) {
                        $Settings = $settings
                    }
                } else {
                    Microsoft.PowerShell.Utility\Write-Verbose 'Settings file not found. Using built-in defaults.'
                    $Settings = @{
                        IncludeRules = @(
                            'PSUseCorrectCasing',
                            'PSPlaceOpenBrace',
                            'PSUseConsistentIndentation',
                            'PSAvoidUsingDoubleQuotesForConstantString',
                            'PSAlignAssignmentStatement'
                        )
                        Rules        = @{
                            PSUseCorrectCasing                        = @{
                                Enable = $true
                            }
                            PSPlaceOpenBrace                          = @{
                                Enable     = $true
                                OnSameLine = $true
                            }
                            PSUseConsistentIndentation                = @{
                                Enable                      = $true
                                IndentationSize             = 4
                                ContinuationIndentationSize = 4
                            }
                            PSAvoidUsingDoubleQuotesForConstantString = @{
                                Enable = $true
                            }
                            PSAlignAssignmentStatement                = @{
                                Enable = $true
                            }
                        }
                    }
                }
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Warning "Could not initialize settings: $($_.Exception.Message). Using defaults."
            }
        }

        Microsoft.PowerShell.Utility\Write-Verbose 'PowerShell formatter initialized with settings.'
    }


    process {
        try {
            # Handle Path parameter
            $filePath = $Path

            # Expand path if it's relative
            $filePaths = GenXdev.FileSystem\Find-Item $FilePath -PassThru  | Microsoft.PowerShell.Core\ForEach-Object FullName

            foreach ($filePath in $filePaths) {

                # Skip non-PowerShell files
                $extension = [IO.Path]::GetExtension($filePath).ToLower()
                if ($extension -notin @('.ps1', '.psm1', '.psd1')) {
                    Microsoft.PowerShell.Utility\Write-Verbose "Skipping non-PowerShell file: $filePath"
                    continue
                }

                Microsoft.PowerShell.Utility\Write-Verbose "Processing file: $filePath"

                # Read the file content
                $ScriptDefinition = $null
                try {
                    $ScriptDefinition = [IO.File]::ReadAllText($filePath, [Text.Encoding]::UTF8)
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning "Could not read file: $filePath - $($_.Exception.Message)"
                    continue
                }

                # Skip empty files
                if ([string]::IsNullOrWhiteSpace($ScriptDefinition)) {
                    Microsoft.PowerShell.Utility\Write-Verbose "Skipping empty file: $filePath"
                    continue
                }

                $formattedScript = $null
                # Prepare formatter parameters
                try {
                    $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                        -BoundParameters $PSBoundParameters `
                        -FunctionName 'PSScriptAnalyzer\Invoke-Formatter' `
                        -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

                    $formattedScript = PSScriptAnalyzer\Invoke-Formatter @invocationParams
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning "Formatter error: $($_.Exception.Message)"
                    continue;
                }

                if ([string]::IsNullOrWhiteSpace($formattedScript)) {
                    Microsoft.PowerShell.Utility\Write-Verbose "No formatting changes needed for: $filePath"
                    continue;
                }

                # Check if formatting changed anything
                if ($formattedScript -eq $ScriptDefinition) {
                    Microsoft.PowerShell.Utility\Write-Verbose "No formatting changes needed for: $filePath"
                    continue
                }

                # Write the formatted content back to the file
                try {
                    [IO.File]::WriteAllText($filePath, $formattedScript, [Text.Encoding]::UTF8)
                    Microsoft.PowerShell.Utility\Write-Output "Formatted file: $filePath"
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning "Could not write formatted content to file: $filePath - $($_.Exception.Message)"
                }
            }
        }
        catch {
            Microsoft.PowerShell.Utility\Write-Warning "Error processing file $filePath`: $($_.Exception.Message)"
        }
    }

    end {
        Microsoft.PowerShell.Utility\Write-Verbose 'PowerShell formatter processing completed'
    }
}
