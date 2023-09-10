
<#
 # Implicit remoting module
 # generated on 12/16/2020 7:47:57 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\UpdateServices" -Session (get-pssession -Name WinRM3) -CommandType Cmdlet -CommandName "*-WSUS*" -AllowClobber -Force
 #>
        
@{
    GUID             = 'ac446d37-6ff5-450f-9ee5-a9afdfa2b163'
    Description      = "Implicit remoting for http://$ImplicitWSUS/wsman"
    ModuleToProcess  = @('Implicit.UpdateServices.psm1')
    FormatsToProcess = @('Implicit.UpdateServices.format.ps1xml')

    ModuleVersion    = '1.0'

    PrivateData      = @{
        ImplicitRemoting = $true
    }
}
        