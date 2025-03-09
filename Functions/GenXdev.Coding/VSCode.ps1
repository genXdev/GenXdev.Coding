################################################################################
<#
.SYNOPSIS
Opens one or more files in Visual Studio Code.

.DESCRIPTION
This function takes file paths and opens them in Visual Studio Code. It expands
paths and validates file existence before attempting to open them.
Ideal for in the terminal of Visual Studio Code, to quickly open a selection
of files.

.PARAMETER FilePath
Array of file paths to open in Visual Studio Code.

.EXAMPLE
VSCode -FilePath "C:\path\to\file.txt"

.EXAMPLE
"C:\path\to\file.txt" | VSCode

.EXAMPLE
ls *.js -file -rec | VSCode

.EXAMPLE
l *.js -file -rec | VSCode

#>
function VSCode {

    [CmdletBinding()]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            HelpMessage = "The path to the file to open in VSCode."
        )]
        [string[]]$FilePath,
        ########################################################################
        [switch] $Copilot
    )

    begin {

        Write-Verbose "Starting VSCode function to open files"

        if ($Copilot) {

            $null = AssureCopilotKeyboardShortCut
        }
    }

    process {


        $FilePath | ForEach-Object {

            try {
                # expand the provided path to full path
                $path = GenXdev.FileSystem\Expand-Path $_

                Write-Verbose "Processing file: $path"

                # verify file exists before attempting to open
                if (-not [System.IO.File]::Exists($path)) {
                    Write-Warning "File not found: $path"
                    return
                }

                # open file in vscode
                Write-Verbose "Opening file in VSCode: $path"
                if ($Copilot) {

                    $null = Open-SourceFileInIde -Path $path -Code -KeysToSend @("^{F12}")
                }
                else {
                    $null = Open-SourceFileInIde -Path $path -Code
                }
            }
            catch {
                Write-Warning "Error processing file '$path': $_"
            }
        }
    }

    end {
    }
}
################################################################################