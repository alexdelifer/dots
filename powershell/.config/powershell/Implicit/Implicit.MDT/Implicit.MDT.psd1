
<#
 # Implicit remoting module
 # generated on 12/16/2020 8:06:11 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\MDT" -Session (get-pssession -Name WinRM10) -CommandName "*-MDT*" -AllowClobber -Force
 #>
        
@{
    GUID = '3250c49c-b9dc-4505-b400-581fe07b4fe6'
    Description = "Implicit remoting for http://$ImplicitMDT/wsman"
    ModuleToProcess = @('Implicit.MDT.psm1')
    FormatsToProcess = @('Implicit.MDT.format.ps1xml')

    ModuleVersion = '1.0'

    PrivateData = @{
        ImplicitRemoting = $true
    }
}
        