@{
    GUID                  = '8d643b9e-5a50-4aab-9b5d-e11c9c3c7775'
    Description           = 'Custom PSScriptAnalyzer rules for GenXdev PowerShell modules'
    PowerShellVersion     = '5.1'

    # Version number of this module.
    ModuleVersion         = '1.130.2025'

    # Supported PSEditions
    CompatiblePSEditions  = 'Core'

    # Author of this module
    Author                = 'genXdev'

    # Company or vendor of this module
    CompanyName           = 'GenXdev'

    # Copyright statement for this module
    Copyright             = 'Copyright 2021-2025 GenXdev'

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    ClrVersion            = '9.0.1'

    # Processor architecture (None, X86, Amd64) required by this module
    ProcessorArchitecture = 'Amd64'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules       = @(@{ModuleName = 'PSScriptAnalyzer'; ModuleVersion = '1.23.0'; })

    # List of all modules packaged with this module
    ModuleList            = @('GenXdev.Coding.ScriptAnalyzer.CustomRules')

    FileList              = @('Measure-UseFullyQualifiedCmdletNames.psm1', 'Measure-UseFullyQualifiedCmdletNames.psd1')

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry
    FunctionsToExport     = @('Measure-UseFullyQualifiedCmdletNames')

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData           = @{
        PSData = @{
            Tags = @('PSScriptAnalyzer', 'Rule')
        }
    }
}
