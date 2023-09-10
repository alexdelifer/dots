
<#
 # Implicit remoting module
 # generated on 12/16/2020 8:04:25 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\GPO" -Session (get-pssession -Name WinRM8) -CommandName "*-GP*" -AllowClobber -Force
 #>
        
@{
    GUID = 'e2fda023-e9ad-4f3f-9eec-55aadbc30847'
    Description = "Implicit remoting for http://$ImplicitGPO/wsman"
    ModuleToProcess = @('Implicit.GPO.psm1')
    FormatsToProcess = @('Implicit.GPO.format.ps1xml')

    ModuleVersion = '1.0'

    PrivateData = @{
        ImplicitRemoting = $true
    }
}
        