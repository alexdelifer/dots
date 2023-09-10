
<#
 # Implicit remoting module
 # generated on 12/16/2020 8:10:03 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\ZCASRemoteAccess" -Session (get-pssession -Name WinRM1) -AllowClobber -Force -Module RemoteAccess
 #>
        
@{
    GUID = '39111c92-6e07-4317-8eb6-d2f5b602b890'
    Description = "Implicit remoting for http://$ImplicitRA/wsman"
    ModuleToProcess = @('Implicit.RemoteAccess.psm1')
    FormatsToProcess = @('Implicit.RemoteAccess.format.ps1xml')

    ModuleVersion = '1.0'

    PrivateData = @{
        ImplicitRemoting = $true
    }
}
        