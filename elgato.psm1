function Set-ElgatoKeyLight {
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