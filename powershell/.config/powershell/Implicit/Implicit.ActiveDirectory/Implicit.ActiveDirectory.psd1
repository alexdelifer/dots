
<#
 # Implicit remoting module
 # generated on 12/16/2020 6:59:07 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\Implicit\ActiveDirectory" -Session (get-pssession -Name WinRM1) -CommandType Cmdlet -CommandName "*-AD*" -AllowClobber -Force
 #>
        
@{
    GUID             = '9371f56d-31c8-40f6-b526-53a062bbd325'
    Description      = "Implicit remoting for http://$ImplicitAD/wsman"
    ModuleToProcess  = @('Implicit.ActiveDirectory.psm1')
    FormatsToProcess = @('Implicit.ActiveDirectory.format.ps1xml')

    ModuleVersion    = '1.0'

    PrivateData      = @{
        ImplicitRemoting = $true
    }
}
        