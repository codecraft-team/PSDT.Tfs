@{
    RootModule = '.\PSDT.Tfs.psm1'
    ModuleVersion = '1.0.0.0'
    GUID = 'cbe91616-ac8f-4c06-aad4-73599f05bffe'
    Author = 'Tauri-Code'
    CompanyName = 'Tauri-Code'
    Copyright = '(c) 2017 Tauri-Code. All rights reserved.'
    Description = 'A collection of Team Foundation Server related PowerShell developer tools.'
    RequiredModules = @("PSDT.App")
    FunctionsToExport = @("Get-TfsLatest")
}