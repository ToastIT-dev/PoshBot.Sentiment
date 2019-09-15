Set-StrictMode -Off

if (Get-Module -Name 'PoshBot.Sentiment') {
    Remove-Module -Name 'PoshBot.Sentiment'
}

if (Test-Path -Path "$PSScriptRoot/../PoshBot.Sentiment") {
    Import-Module "$PSScriptRoot/../PoshBot.Sentiment/PoshBot.Sentiment.psd1" -Force
} else {
    Import-Module "$PSScriptRoot/../src/PoshBot.Sentiment.psd1" -Force
}

Describe 'PoshBot.Sentiment Module' {
    Context 'Import Correctly' {
        It 'should be a script module' {
            (Get-Module PoshBot.Sentiment).ModuleType | Should -Be 'Script'
        }

        It 'should export one function' {
            (Get-Command -Module PoshBot.Sentiment).Count | Should -Be 1
        }
    }
}
