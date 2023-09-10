
<#
 # Implicit remoting module
 # generated on 12/16/2020 7:53:45 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\DNS" -Session (get-pssession -Name WinRM6) -CommandName "*-DNSServer*" -AllowClobber -Force
 #>
        
@{
    GUID = 'f815c11a-5030-43cd-9774-b09c35a55df3'
    Description = "Implicit remoting for http://$ImplicitDNS/wsman"
    ModuleToProcess = @('Implicit.DNS.psm1')
    FormatsToProcess = @('Implicit.DNS.format.ps1xml')

    ModuleVersion = '1.0'

    PrivateData = @{
        ImplicitRemoting = $true
    }
}
        