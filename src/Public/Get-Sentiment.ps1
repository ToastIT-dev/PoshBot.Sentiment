function Get-Sentiment {
    [PoshBot.BotCommand(CommandName = 'Sentiment',
                        Aliases     = 'Analyze',
                        Permissions = 'api-use')]
    param (
        [Parameter(Mandatory)]
        [string] $Text,

        [Alias('Language')]
        [switch] $DetectLanguage,

        [PoshBot.FromConfig()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string] $ApiKey,

        [PoshBot.FromConfig()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string] $Endpoint
    )

    $ApiPath = '/text/analytics/{0}/{1}'

    $Headers = @{
        'Ocp-Apim-Subscription-Key' = $ApiKey
    }

    $Body = @{
        documents = @(@{
            id   = 1
            text = $Text
        })
    } | ConvertTo-Json

    $RestSplat = @{
        Method      = 'Post'
        ContentType = 'application/json'
        Headers     = $Headers
        Body        = $Body
    }

    if ($DetectLanguage) {
        $LanguageUri = [Uri]::new([Uri]::new($Endpoint), ($ApiPath -f 'v2.1', 'languages')).ToString()

        $Language = (Invoke-RestMethod -Uri $LanguageUri @RestSplat).documents[0].detectedLanguages

        $LanguageOutput = "That text was {1}... I'm {0}% sure of it",
                          "I'm {0}% sure that text is {1}",
                          "Huh, I'm approximatly {0}% certain that was {1}" | Get-Random
        $LanguageOutput -f [math]::Round($Language.score * 100, 0), $Language.name

        Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 5)
    }

    $SentimentUri = [Uri]::new([Uri]::new($Endpoint), ($ApiPath -f 'v3.0-preview', 'sentiment')).ToString()

    $Sentiment = (Invoke-RestMethod -Uri $SentimentUri @RestSplat).documents[0].sentiment

    $SentimentOutput = "That text sounds {0} to me",
                       "I'm fairly certain that was {0}",
                       "I'd say that sounds {0}" | Get-Random
    $SentimentOutput -f $Sentiment
}
