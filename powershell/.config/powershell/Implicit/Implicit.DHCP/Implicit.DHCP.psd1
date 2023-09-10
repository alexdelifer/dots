
<#
 # Implicit remoting module
 # generated on 12/16/2020 7:52:26 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\DHCP" -Session (get-pssession -Name WinRM5) -CommandName "*-DHCPServer*" -AllowClobber -Force
 #>
        
@{
    GUID = 'e4415e1f-6d0b-4bd6-83c4-c4db43487602'
    Description = "Implicit remoting for http://$ImplicitDHCP/wsman"
    ModuleToProcess = @('Implicit.DHCP.psm1')
    FormatsToProcess = @('Implicit.DHCP.format.ps1xml')

    ModuleVersion = '1.0'

    PrivateData = @{
        ImplicitRemoting = $true
    }
}
        