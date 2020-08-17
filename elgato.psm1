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