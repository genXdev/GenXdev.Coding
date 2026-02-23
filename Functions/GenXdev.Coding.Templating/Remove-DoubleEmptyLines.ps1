<##############################################################################
Part of PowerShell module : GenXdev.Coding.Templating
Original cmdlet filename  : Remove-DoubleEmptyLines.ps1
Original author           : René Vaessen / GenXdev
Version                   : 2.3.2026
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
function Remove-DoubleEmptyLines {

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([string])]

    param(
        ###########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $false
        )]
        [string] $code,

        ###########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline = $false
        )]
        [switch] $Reformat
    )

    begin {

        $sb = [System.Text.StringBuilder]::new()
    }

    process {

        $lines = $code.Replace("`r", "`n").Split("`n", [System.StringSplitOptions]::RemoveEmptyEntries);
        $lastNonEmptyLine = [string]::Empty
        $previousLastNonEmptyLine = [string]::Empty
        $lastLineWasEmpty = $false
        $hadSameLineStart = $false

        for ($i = 0; $i -lt $lines.Count; $i++) {

            $line = $lines[$i].TrimEnd()
            $isEmptyLine = [string]::IsNullOrWhiteSpace($line)
            $isOpeningBrace = $line.Trim().EndsWith("{")
            $isClosingBrace = $line.Trim().EndsWith("}")
            $isLastLine = ($i -eq $lines.Count - 1)

            # determine if next line is empty or closing brace
            $nextLineIsEmpty = $false
            $nextLineIsClosingBrace = $false

            if ($i + 1 -lt $lines.Count) {

                $nextLine = $lines[$i + 1].TrimEnd()
                $nextLineIsEmpty = [string]::IsNullOrWhiteSpace($nextLine)
                $nextLineIsClosingBrace = $nextLine.Trim().StartsWith("}")
            }

            $previousLastNonEmptyLine = $lastNonEmptyLine
            $lastNonEmptyLine = if (-not $isEmptyLine) { $line } else { $lastNonEmptyLine }

            # handle empty lines
            if ($isEmptyLine) {

                # skip empty lines at the end of the file
                if ($isLastLine) {

                    continue
                }

                # rule 2: never output empty line before closing brace
                if ($nextLineIsClosingBrace) {

                    # skip this empty line
                    continue
                }

                # rule 3: never output two empty lines in a row
                if ($lastLineWasEmpty) {

                    # skip this empty line
                    continue
                }

                # output single empty line
                $null = $sb.Append("`r`n")
                $lastLineWasEmpty = $true
            }
            else {

                if ($Reformat) {

                    $hadSameLineStart = $false

                    if ($previousLastNonEmptyLine.Trim().Length -gt 4 -and $lastNonEmptyLine.Trim().Length -gt 4) {

                        if ($previousLastNonEmptyLine.Trim().Substring(0, 4) -eq $lastNonEmptyLine.Trim().Substring(0, 4)) {

                            while ($sb.Length -ge 0 -and ("`r`n `t".IndexOf($sb[$sb.Length - 1]) -ge 0)) {

                                $null = $sb.Remove($sb.Length - 1, 1)
                            }

                            $null = $sb.Append("`r`n")
                            $hadSameLineStart = $true
                        }
                    }

                    if ((-not $lastLineWasEmpty) -and (-not $hadSameLineStart) -and (-not $isOpeningBrace) -and (-not $isLastLine) -and (-not $isClosingBrace)) {

                        $null = $sb.Append("`r`n")
                    }
                }


                if ($isOpeningBrace -and ((-not $nextLineIsEmpty) -or ($nextLine.Trim().EndsWith("{"))) -and (-not $isLastLine)) {

                    $null = $sb.Append("`r`n")
                }
                # output non-empty line
                if ($isLastLine) {

                    $null = $sb.Append($line)
                }
                else {

                    $null = $sb.Append($line).Append("`r`n")
                }
                $lastLineWasEmpty = $false


                if ($isOpeningBrace -and (-not $nextLineIsEmpty) -and -not $isLastLine) {

                    $null = $sb.Append("`r`n")
                    $lastLineWasEmpty = $true
                }

            }
        }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Output ($sb.ToString())
    }
}
################################################################################