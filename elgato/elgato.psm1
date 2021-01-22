function Set-ElgatoKeyLight {
    <#
    .Synopsis
    Configures an Elgato Key Light Air that's connected to the local network. Control Center and Stream Deck software not required.

    .Parameter Hostname
    DNS Hostname or IP address of the target light.

    .Parameter Brightness
    The brightness of the light that you are configuring. Valid values: 3 to 100.

    .Parameter Temperature
    The color temperature (7000K to 2900K) to set the light to. Valid values: 143 to 344.

    .Parameter On
    If not specified, the light will be shut off. If specified, the light will be turned on.

    .Example
    Set a key light air to full brightness, and coolest color temperature.

    PS > Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 100 -Temperature 143

    .Example
    Set a key light air to half brightness with warmest color temperature (2)

    PS > Set-ElgatoKeyLight -On -Host 10.0.0.231 -Brightness 50 -Temperature 344
    #>
    [CmdletBinding()]
    param (
      [Parameter(Mandatory = $true)]
      [string] $Hostname
    , [ValidateRange(3,100)]
      [int] $Brightness
    , [ValidateRange(143, 344)]
      [int] $Temperature
    , [switch] $On
    )

    $Body = @{
        NumberOfLights = 1
        Lights = @(
            @{
                Brightness = $Brightness
                Temperature = $Temperature
                On = $On ? 1 : 0
            }
        )
    } | ConvertTo-Json
    Invoke-RestMethod -Method Put -Uri http://$Hostname`:9123/elgato/lights -Body $Body

}

function Get-ElgatoKeyLight {
<#
    .Synopsis
    Gets information about an Elgato Key Light Air that's connected to the local network. Control Center and Stream Deck software not required.

    .Parameter Hostname
    DNS Hostname or IP address of the target light, supports multiple objects

    .Example
    Get the current key light air settings

    PS > Get-ElgatoKeyLight -Host 10.0.0.231

    .Example
    Get the current key light air settings of both key light airs

    PS > Get-ElgatoKeyLight -Host 10.0.0.231, 10.0.0.232
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string[]] $Hostname
    )

    $HostName | ForEach-Object {
        Invoke-RestMethod -Method Get -Uri http://$_`:9123/elgato/lights
    }
  
}

function Start-ElgatoKeyLight {
<#
    .Synopsis
    Turns on an Elgato Key Light Air that's connected to the local network. Control Center and Stream Deck software not required.

    .Parameter Hostname
    DNS Hostname or IP address of the target light, supports multiple objects

    .Example
    Turn on a key light air

    PS > Start-ElgatoKeyLight -Host 10.0.0.231

    .Example
    Turn on both key light airs

    PS > Start-ElgatoKeyLight -Host 10.0.0.231, 10.0.0.232
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string[]] $Hostname
    )

    $Body = @{
        NumberOfLights = 1
        Lights = @(
            @{
                On = 1
            }
        )
    } | ConvertTo-Json
  

    $HostName | ForEach-Object {
      Invoke-RestMethod -Method Put -Uri http://$_`:9123/elgato/lights -Body $Body
    }
    
}

function Stop-ElgatoKeyLight {
<#
    .Synopsis
    Turns off an Elgato Key Light Air that's connected to the local network. Control Center and Stream Deck software not required.

    .Parameter Hostname
    DNS Hostname or IP address of the target light, supports multiple objects

    .Example
    Turn off a key light air

    PS > Stop-ElgatoKeyLight -Host 10.0.0.231

    .Example
    Turn off both key light airs

    PS > Stop-ElgatoKeyLight -Host 10.0.0.231, 10.0.0.232
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string[]] $Hostname
    )

    $Body = @{
        NumberOfLights = 1
        Lights = @(
            @{
                On = 0
            }
        )
    } | ConvertTo-Json
  

    $HostName | ForEach-Object {
      Invoke-RestMethod -Method Put -Uri http://$_`:9123/elgato/lights -Body $Body
    }
    
}