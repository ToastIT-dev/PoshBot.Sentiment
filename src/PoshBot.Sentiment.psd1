@{
    RootModule        = 'PoshBot.Sentiment.psm1'
    ModuleVersion     = '0.0.1'
    GUID              = '6f452415-198d-462f-b328-406af5bb21ff'
    Author            = 'Josh (Windos) King'
    CompanyName       = 'ToastIT.dev'
    Copyright         = '(c) 2019 Josh (Windos) King. All rights reserved.'
    Description       = 'PoshBot plugin to query Azure Cognitive Services Text Analytics.'
    PowerShellVersion = '5.0.0'
    RequiredModules   = @('PoshBot')
    FunctionsToExport = 'Get-Sentiment'
    CmdletsToExport   = @()
    AliasesToExport   = @()
    PrivateData       = @{
        Permissions = @(
            Name        = 'api-use'
            Description = 'Run commands that require use of APIs protected by keys'
        )
        PSData = @{
            Tags         = @('TextAnalysis', 'PoshBot', 'ChatOps')
            LicenseUri   = 'https://github.com/ToastIT-dev/PoshBot.Sentiment/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/ToastIT-dev/PoshBot.Sentiment'
            ReleaseNotes = '# 0.0.1

* Initial release
'
        }
    }
}