@{
    Severity              = @('Warning')
    IncludeRules          = @(
        'PSUseFullyQualifiedCmdletNames',
        'PSAvoidDefaultValueSwitchParameter',
        'PSAvoidUsingCmdletAliases',
        'PSAvoidAssignmentToAutomaticVariable',
        'PSAvoidDefaultValueForMandatoryParameter',
        'PSAvoidExclaimOperator',
        'PSAvoidGlobalAliases',
        'PSAvoidGlobalFunctions',
        'PSAvoidGlobalVars',
        'PSAvoidLongLines',
        'PSAvoidNullOrEmptyHelpMessageAttribute',
        'PSAvoidOverwritingBuiltInCmdlets',
        'PSReservedCmdletChar',
        'PSReservedParams',
        'PSAvoidSemicolonsAsLineTerminators',
        'PSAvoidShouldContinueWithoutForce',
        'PSAvoidTrailingWhitespace',
        'PSAvoidUsingDeprecatedManifestFields',
        'PSAvoidUsingDoubleQuotesForConstantString',
        'PSMisleadingBacktick',
        'PSMissingModuleManifestField',
        'PSPlaceOpenBrace',
        'PSPossibleIncorrectComparisonWithNull',
        'PSPossibleIncorrectUsageOfAssignmentOperator',
        'PSPossibleIncorrectUsageOfRedirectionOperator',
        'PSUseApprovedVerbs',
        'PSUseCmdletCorrectly',
        'PSUseCompatibleCmdlets',
        'PSUseConsistentIndentation',
        'PSUseConsistentWhitespace',
        'PSUseDeclaredVarsMoreThanAssignments',
        'PSUseLiteralInitializerForHashtable',
        'PSUseOutputTypeCorrectly',
        'PSUseProcessBlockForPipelineCommand',
        'PSShouldProcess',
        'PSUseShouldProcessForStateChangingFunctions',
        'PSUseSingularNouns',
        'PSUseSupportsShouldProcess',
        'PSUseToExportFieldsInManifest',
        'PSUseUsingScopeModifierInNewRunspaces'
    )
    ExcludeRules          = @(
        'PSUseCorrectCasing',
        'PSUseCompatibleCommands',
        'PSAlignAssignmentStatement',
        'PSAvoidUsingEmptyCatchBlock',
        'PSReviewUnusedParameter',
        'PSAvoidInvokingEmptyMembers',
        'PSAvoidMultipleTypeAttributes',
        'PSAvoidUsingPositionalParameters',
        'PSUseBOMForUnicodeEncodedFile',
        'PSAvoidUsingUsernameAndPasswordParams',
        'PSAvoidUsingAllowUnencryptedAuthentication',
        'PSAvoidUsingBrokenHashAlgorithms',
        'PSAvoidUsingComputerNameHardcoded',
        'PSAvoidUsingConvertToSecureStringWithPlainText',
        'PSAvoidUsingInvokeExpression',
        'PSAvoidUsingPlainTextForPassword',
        'PSAvoidUsingWMICmdlet',
        'PSAvoidUsingWriteHost',
        'PSUseCompatibleSyntax',
        'PSUseCompatibleTypes',
        'PSPlaceCloseBrace',
        'PSProvideCommentHelp',
        'PSUsePSCredentialType',
        'PSUseUTF8EncodingForHelpFile',
        'PSDSCDscExamplesPresent',
        'PSDSCDscTestsPresent',
        'PSDSCReturnCorrectTypesForDSCFunctions',
        'PSDSCUseIdenticalMandatoryParametersForDSC',
        'PSDSCUseIdenticalParametersForDSC',
        'PSDSCStandardDSCFunctionsInResource',
        'PSDSCUseVerboseMessageInDSCResource'
    )
    IncludeDefaultRules   = $true
    RecurseCustomRulePath = $false
    CustomRulePath        = @(
        # "~\Documents\PowerShell\Modules\GenXdev.Coding\1.290.2025\Assets\Modules\PSScriptAnalyzer\1.24.0\PSv7\GenXdev.Coding.PowerShell.Modules.ScriptAnalyzer.dll"
    )
    Rules = @{
        PSUseFullyQualifiedCmdletNames = @{
            Enabled  = $true
        }
    }
}