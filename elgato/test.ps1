Import-Module -Name $PSScriptRoot/elgato.psd1 -Force

# This should get the current settings of both lights
Get-ElgatoKeyLight -Host 10.0.0.231, 10.0.0.232

# Run through a sequence
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 7000
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 50 -Temperature 7000
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 75 -Temperature 7000
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 2900
Start-Sleep -Milliseconds 2000
Set-ElgatoKeyLight -Host 10.0.0.231 -Brightness 50 -Temperature 7000
Start-Sleep -Milliseconds 600
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 10 -Temperature 7000
Start-Sleep -Milliseconds 300
Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 7000

# This should switch off both lights
Stop-ElgatoKeyLight -Host 10.0.0.231, 10.0.0.232

# This should switch on both lights
Start-ElgatoKeyLight -Host 10.0.0.231, 10.0.0.232
