###############################################################################
<#
.SYNOPSIS
Creates a new GenXdev PowerShell cmdlet with proper structure and validation.

.DESCRIPTION
Creates a new PowerShell cmdlet following GenXdev standards, including parameter
validation, help documentation, and proper verb-noun naming convention. Validates
the verb against approved PowerShell verbs and ensures proper casing of both verb
and noun components. Can integrate new cmdlets into existing module structures.

.PARAMETER CmdletName
The name of the cmdlet to create. Must follow the Verb-Noun format using an
approved PowerShell verb.

.PARAMETER Synopsis
A brief description of the cmdlet's purpose for help documentation.

.PARAMETER Description
A detailed description of what the cmdlet does for help documentation.

.PARAMETER ModuleName
The name of the base GenXdev module to integrate the cmdlet into.
Must match pattern GenXdev or GenXdev.SubModule.

.PARAMETER ModuleName
The name of the specific GenXdev submodule to integrate the cmdlet into.
Must match pattern GenXdev.SubModule.Component.

.PARAMETER CmdletAliases
One or more aliases for the cmdlet. Accepts an array of strings.

.PARAMETER PromptKey
The AI prompt key used to select a template for generating the cmdlet content.
Defaults to "NewGenXdevCmdLet".

.PARAMETER Prompt
Custom AI prompt text to guide the generation of the cmdlet content.

.PARAMETER EditPrompt
When specified, only opens the AI prompt for editing without creating the cmdlet.

.EXAMPLE
New-GenXdevCmdlet -CmdletName "Get-SystemInfo" -Synopsis "Gets system information" `
    -Description "Retrieves detailed system information" -ModuleName "GenXdev.System"

.EXAMPLE
gcmd Get-SystemInfo -EditPrompt
#>
function New-GenXdevCmdlet {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('newcmd')]
    param (
        ########################################################################
        [Alias('cmd')]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The name of the cmdlet to create (must use approved verb)'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $CmdletName,
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "A brief description of the cmdlet's purpose"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Synopsis = "todo: A brief description of the cmdlet's purpose",
        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'A detailed description of what the cmdlet does'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Description = 'todo: [A detailed description of what the cmdlet does]',
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = 'Integrate the new cmdlet into an existing GenXdev module'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^(GenXdev|GenXdev(\.\w+)+)+$')]
        [string] $BaseModuleName,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 4,
            HelpMessage = 'Integrate the new cmdlet into an existing GenXdev sub module'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^(GenXdev(\.\w+)+)+$')]
        [string] $ModuleName,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 5,
            HelpMessage = 'One or more aliases for the cmdlet. Accepts an array of strings.'
        )]
        [string[]] $CmdletAliases,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 6,
            HelpMessage = 'The AI prompt key to use for template selection'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PromptKey = 'NewGenXdevCmdLet',
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 7,
            HelpMessage = 'Custom AI prompt text to use for cmdlet generation'
        )]
        [AllowEmptyString()]
        [string] $Prompt = "Create a boilerplate GenXdev cmdlet that does what it's name suggests",
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Only edit the AI prompt without creating the cmdlet'
        )]
        [switch] $EditPrompt
        ########################################################################
    )

    begin {

        # if no base module specified, use module name
        if ([string]::IsNullOrWhiteSpace($BaseModuleName)) {
            $BaseModuleName = $ModuleName
        }

        # if no module name specified, use base module name
        if ([string]::IsNullOrWhiteSpace($ModuleName)) {
            $ModuleName = $BaseModuleName
        }

        # parse the cmdlet name into verb and noun components
        $verbNounSplit = $CmdletName.IndexOf('-')
        $verb = $null
        $noun = $null

        if ($verbNounSplit -eq -1) {
            $verb = $CmdletName
            $noun = ''
        }
        else {
            $verb = $CmdletName.Substring(0, $verbNounSplit)
            $noun = $CmdletName.Substring($verbNounSplit + 1)
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Processing cmdlet name: Verb='$verb', Noun='$noun'"
    }


    process {

        # validate the verb against the official powershell approved verbs list
        $verbs = @(Microsoft.PowerShell.Utility\Get-Verb | Microsoft.PowerShell.Core\ForEach-Object { $_.Verb.ToLowerInvariant() })
        if (-not ($verbs -contains $verb.ToLowerInvariant())) {
            throw "Invalid verb: $verb"
            return
        }

        # ensure the cmdlet doesn't already exist in the current session
        if ($null -ne (Microsoft.PowerShell.Core\Get-Command -Name $CmdletName -ErrorAction SilentlyContinue)) {
            throw "Cmdlet $CmdletName already exists"
            return
        }

        if (-not [string]::IsNullOrWhiteSpace($BaseModuleName)) {

            if (-not (Microsoft.PowerShell.Core\Get-Module -Name $BaseModuleName -ErrorAction SilentlyContinue)) {

                $modulesPath = GenXdev.FileSystem\Expand-Path  "$PSScriptRoot\..\..\..\..\Modules\"
                $moduleRootDirectory = GenXdev.FileSystem\Expand-Path `
                    "$modulesPath\$BaseModuleName\"

                if (-not [IO.directory]::Exists($moduleRootDirectory)) {

                    throw "Module '$BaseModuleName' not found under directory: $moduleRootDirectory`r`nSee 'New-GenXdevModule -?' on how to create a new module"
                }

                throw "Module $BaseModuleName is not loaded"
                return
            }
        }

        # ensure proper casing for verb (first letter capital, rest lowercase)
        $verb = $verb.Substring(0, 1).ToUpper() + $verb.Substring(1).ToLower()

        # handle noun casing and reconstruct cmdlet name
        if (-not [string]::IsNullOrWhiteSpace($noun)) {
            $noun = $noun.Substring(0, 1).ToUpper() + $noun.Substring(1)
            $CmdletName = $verb + '-' + $noun
        }
        else {
            $CmdletName = $verb
        }

        Microsoft.PowerShell.Utility\Write-Verbose "Creating cmdlet with normalized name: $CmdletName"

        # ensure required parameters are present
        if (-not ($PSBoundParameters.ContainsKey('PromptKey'))) {
            $null = $PSBoundParameters.Add('PromptKey', $PromptKey)
        }

        if (-not ($PSBoundParameters.ContainsKey('Prompt'))) {
            $null = $PSBoundParameters.Add('Prompt', $Prompt)
        }

        # check if we should proceed with cmdlet creation
        $target = "PowerShell Cmdlet '$CmdletName'"
        $action = 'Create new cmdlet file and validate structure'

        [string] $filePath

        if ($PSCmdlet.ShouldProcess($target, $action)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Creating cmdlet file at: $PSScriptRoot\$CmdletName.ps1"

            if (-not [string]::IsNullOrWhiteSpace($BaseModuleName)) {

                $filePath = GenXdev.FileSystem\Expand-Path `
                    "$PSScriptRoot\..\..\..\..\$BaseModuleName\1.260.2025\Functions\$ModuleName\$CmdletName.ps1" `
                    -DeleteExistingFile -CreateDirectory

                $testFilePath = GenXdev.FileSystem\Expand-Path `
                    "$PSScriptRoot\..\..\..\..\$BaseModuleName\1.260.2025\Tests\$ModuleName\$CmdletName.Tests.ps1" `
                    -DeleteExistingFile -CreateDirectory

                @"
    ################################################################################
    Pester\Describe `"$CmdletName`" {

        Pester\It `"should $Description`" {

            `$result = $BaseModuleName\$CmdletName

            `$result | Pester\Should -BeExactly `"defined in the future`" -Because @`"
    This unit tests is a placeholder and should be replaced with actual tests
`"@
        }
    }
}
    ################################################################################
"@ | Microsoft.PowerShell.Utility\Out-File  $testFilePath;

                @"
    ################################################################################
    <#
    .SYNOPSIS
    $Synopsis

    .DESCRIPTION
    $Description
    #>
    ################################################################################
    function $CmdletName {

        ############################################################################
        [CmdletBinding()]
        [Alias($(($CmdletAliases | Microsoft.PowerShell.Core\ForEach-Object { "`"$_`"" }) -join ', '))]
        param (
        ############################################################################
        ############################################################################
        )

        ############################################################################
        begin {
        }

        ############################################################################

process {
        }

        ############################################################################
        end {
        }
    }
"@ | Microsoft.PowerShell.Utility\Out-File  $filePath

                $ModuleManifestPath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\$BaseModuleName\1.260.2025\$BaseModuleName.psd1"
                $ModuleManifest = Microsoft.PowerShell.Utility\Import-PowerShellDataFile -LiteralPath $ModuleManifestPath
                if ($BaseModuleName -ne $ModuleName) {

                    if (@($ModuleManifest.NestedModules | Microsoft.PowerShell.Core\Where-Object { $_ -like "$ModuleName.psm1" }).Count -eq 0) {

                        $ModuleManifest.NestedModules += "$ModuleName.psm1"
                    }
                }

                $ModuleManifest.FunctionsToExport += $CmdletName
                $ModuleManifest.FileList += (GenXdev.FileSystem\Find-Item $filePath -RelativeBasePath (GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\$BaseModuleName\1.260.2025\")).Substring(2)
                $ModuleManifest.FileList += (GenXdev.FileSystem\Find-Item $testFilePath -RelativeBasePath (GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\$BaseModuleName\1.260.2025\")).Substring(2)
                $ModuleManifest.AliasesToExport += $CmdletAliases

                Microsoft.PowerShell.PSResourceGet\Update-PSModuleManifest `
                    -Path $ModuleManifestPath `
                    -FunctionsToExport ($ModuleManifest.FunctionsToExport) `
                    -FileList ($ModuleManifest.FileList) `
                    -AliasesToExport ($ModuleManifest.AliasesToExport) `
                    -NestedModules ($ModuleManifest.NestedModules) `
                    -Author ($ModuleManifest.Author ?? 'GenXdev')

                $PsmFilePath = GenXdev.FileSystem\Expand-Path "$PSScriptRoot\..\..\..\..\$BaseModuleName\1.260.2025\$ModuleName.psm1"

                "`r`n. `"`$PSScriptRoot\Functions\$ModuleName\$CmdletName.ps1`"" | Microsoft.PowerShell.Utility\Out-File  $PsmFilePath -Append
            }
            else {

                $filePath = GenXdev.FileSystem\Expand-Path `
                    "$PSScriptRoot\..\..\..\..\..\Scripts\$CmdletName.ps1" `
                    -DeleteExistingFile -CreateDirectory

                @"
    ################################################################################
    <#
    .SYNOPSIS
    $Synopsis

    .DESCRIPTION
    $Description
    #>
    ################################################################################
    [CmdletBinding()]
    [Alias($(($CmdletAliases | Microsoft.PowerShell.Core\ForEach-Object { "`"$_`"" }) -join ', '))]
    param (
        ############################################################################
        ############################################################################
    )

    ################################################################################
    begin {
    }

    ################################################################################

process {
    }

    ################################################################################
    end {
    }
"@ | Microsoft.PowerShell.Utility\Out-File  $filePath

                $testFilePath = GenXdev.FileSystem\Expand-Path `
                    "$PSScriptRoot\..\..\..\..\..\Scripts\$CmdletName.Tests.ps1" `
                    -DeleteExistingFile -CreateDirectory
                @"
    ################################################################################
    Pester\Describe `"$CmdletName`" {

        Pester\It `"should $Description`" {

            `$result = & `"`$PSScriptRoot\$CmdletName.ps1`"

            `$result | Pester\Should -BeExactly `"defined in the future`" -Because @`"

    This unit tests is a placeholder and should be replaced with actual tests
`"@
        }
    }
}
    ################################################################################
"@ | Microsoft.PowerShell.Utility\Out-File  $testFilePath

            }

            if (-not [string]::IsNullOrWhiteSpace($BaseModuleName)) {

                try {
                    $null = Microsoft.PowerShell.Core\Import-Module -Name $BaseModuleName -Force
                }
                catch {

                $null = GenXdev.Coding\Assert-ModuleDefinition -ModuleName $BaseModuleName
                }
            }

            # setup and execute the cmdlet assertion
            $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Coding\Assert-GenXdevCmdletTests' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -Name * `
                    -ErrorAction SilentlyContinue)

            $invocationParams.CmdletName =  $CmdletName
            $invocationParams.PromptKey = $PromptKey
            $invocationParams.Prompt = $Prompt
            $invocationParams.FromScripts = ([string]::IsNullOrWhiteSpace($BaseModuleName))

            $null = GenXdev.Coding\Assert-GenXdevCmdletTests @invocationParams

            if ([string]::IsNullOrWhiteSpace($BaseModuleName)) {

                Microsoft.PowerShell.Utility\Write-Information "Use 'Assert-GenXdevCmdlet -CmdletName $CmdletName -FromScripts -Integrate' to integrate the cmdlet into a module"
            }
        }
    } # Close process block

    end {
    }
} # Close function block