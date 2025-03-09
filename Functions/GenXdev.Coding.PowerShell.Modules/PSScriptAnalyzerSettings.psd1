@{
    Severity              = @('Error')
    IncludeRules          = @(
        "UseFullyQualifiedCmdletNames", # Changed to match actual function name
        "PSAvoidDefaultValueSwitchParameter",
        "PSAvoidUsingCmdletAliases",
        "PSAvoidAssignmentToAutomaticVariable",
        "PSAvoidDefaultValueForMandatoryParameter",
        "PSAvoidExclaimOperator",
        "PSAvoidGlobalAliases",
        "PSAvoidGlobalFunctions",
        "PSAvoidGlobalVars",
        "PSAvoidLongLines",
        "PSAvoidNullOrEmptyHelpMessageAttribute",
        "PSAvoidOverwritingBuiltInCmdlets",
        "PSReservedCmdletChar",
        "PSReservedParams",
        "PSAvoidSemicolonsAsLineTerminators",
        "PSAvoidShouldContinueWithoutForce",
        "PSAvoidTrailingWhitespace",
        "PSAvoidUsingDeprecatedManifestFields",
        "PSAvoidUsingDoubleQuotesForConstantString",
        "PSMisleadingBacktick",
        "PSMissingModuleManifestField",
        "PSPlaceOpenBrace",
        "PSPossibleIncorrectComparisonWithNull",
        "PSPossibleIncorrectUsageOfAssignmentOperator",
        "PSPossibleIncorrectUsageOfRedirectionOperator",
        "PSUseApprovedVerbs",
        "PSUseCmdletCorrectly",
        "PSUseCompatibleCmdlets",
        "PSUseConsistentIndentation",
        "PSUseConsistentWhitespace",
        "PSUseCorrectCasing",
        "PSUseDeclaredVarsMoreThanAssignments",
        "PSUseLiteralInitializerForHashtable",
        "PSUseOutputTypeCorrectly",
        "PSUseProcessBlockForPipelineCommand",
        "PSShouldProcess",
        "PSUseShouldProcessForStateChangingFunctions",
        "PSUseSingularNouns",
        "PSUseSupportsShouldProcess",
        "PSUseToExportFieldsInManifest",
        "PSUseUsingScopeModifierInNewRunspaces"
    )
    ExcludeRules          = @(
        "PSUseCompatibleCommands",
        "PSAlignAssignmentStatement",
        "PSAvoidUsingEmptyCatchBlock",
        "PSReviewUnusedParameter",
        "PSAvoidInvokingEmptyMembers",
        "PSAvoidMultipleTypeAttributes",
        "PSAvoidUsingPositionalParameters",
        "PSUseBOMForUnicodeEncodedFile",
        "PSAvoidUsingUsernameAndPasswordParams",
        "PSAvoidUsingAllowUnencryptedAuthentication",
        "PSAvoidUsingBrokenHashAlgorithms",
        "PSAvoidUsingComputerNameHardcoded",
        "PSAvoidUsingConvertToSecureStringWithPlainText",
        "PSAvoidUsingInvokeExpression",
        "PSAvoidUsingPlainTextForPassword",
        "PSAvoidUsingWMICmdlet",
        "PSAvoidUsingWriteHost",
        "PSUseCompatibleSyntax",
        "PSUseCompatibleTypes",
        "PSPlaceCloseBrace",
        "PSProvideCommentHelp",
        "PSUsePSCredentialType",
        "PSUseUTF8EncodingForHelpFile",
        "PSDSCDscExamplesPresent",
        "PSDSCDscTestsPresent",
        "PSDSCReturnCorrectTypesForDSCFunctions",
        "PSDSCUseIdenticalMandatoryParametersForDSC",
        "PSDSCUseIdenticalParametersForDSC",
        "PSDSCStandardDSCFunctionsInResource",
        "PSDSCUseVerboseMessageInDSCResource"
    )
    IncludeDefaultRules   = $true
    RecurseCustomRulePath = $true
    CustomRulePath        = @(
        "~\Documents\Powershell\Modules\GenXdev.Coding\1.118.2025\Functions\GenXdev.Coding.PowerShell.Modules\Measure-UseFullyQualifiedCmdletNames.psm1"
    )
}