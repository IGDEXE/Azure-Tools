# Verificar qual instrumentationKey corresponde a um App Insigh
# Ivo Dias

# Conecta no Azure
Connect-AzureRMAccount

# Recebe os dados
$nomeSubscricao = Read-Host "Informe o nome da subscricao"
$idInstrumentationKey = Read-Host "Informe o ID do Instrumentation Key"

# Faz a pesquisa
Select-AzureRmSubscription -SubscriptionName "$nomeSubscricao"
$appName = (Get-AzureRmApplicationInsights | Select-Object Name, InstrumentationKey | Where-Object {$_.InstrumentationKey -eq "$idInstrumentationKey"}).name

# Exibe a informacao
Write-Host "O App Insights correspondente é o $appName"