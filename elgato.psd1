@{
    RootModule = 'elgato.psm1'
    Author = 'Trevor Sullivan <trevor@trevorsullivan.net>'
    CompanyName = 'Trevor Sullivan'
    ModuleVersion = '0.3'
    PowerShellVersion = '7.0'
    GUID = 'c8f9dcde-4eaf-4ab4-a7b6-71e2a19f9f02'
    Copyright = '2020 Trevor Sullivan'
    Description = 'Provides a PowerShell-friendly interface to manage Elgato devices, such as the Key Light Air.'
    FunctionsToExport = @('Set-ElgatoKeyLight')
    AliasesToExport = @('')
    VariablesToExport = @('')
    PrivateData = @{
        PSData = @{
            Tags = @('Elgato', 'KeyLight', 'streaming', 'studio')
            LicenseUri = ''
            ProjectUri = 'https://trevorsullivan.net'
            IconUri = ''
            ReleaseNotes = @'
'@
        }
    }
}