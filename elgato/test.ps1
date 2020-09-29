Import-Module -Name $PSScriptRoot/elgato.psd1 -Force

# Run through a sequence
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 143
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 50 -Temperature 143
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 75 -Temperature 143
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 344
Start-Sleep -Milliseconds 2000
Set-ElgatoKeyLight -Host 10.0.0.231 -Brightness 50 -Temperature 143
Start-Sleep -Milliseconds 600
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 10 -Temperature 143
Start-Sleep -Milliseconds 300
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 143

# This should switch off both lights, as the -On parameter has not been specified
Set-ElgatoKeyLight -Host 10.0.0.231
Set-ElgatoKeyLight -Host 10.0.0.232
