$script = "$(Get-Location)\toggle_network_adapters.ps1 $(Get-Location)"
start-process -ArgumentList "-Command",$script powershell -Verb runAs