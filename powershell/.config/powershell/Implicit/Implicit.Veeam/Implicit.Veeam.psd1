
<#
 # Implicit remoting module
 # generated on 12/16/2020 8:12:56 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\Veeam" -Session (get-pssession -Name WinRM3) -Force
 #>
        
@{
    GUID             = '1c92a018-e56b-43c1-9354-ee9076c55130'
    Description      = "Implicit remoting for http://$ImplicitVeeam/wsman"
    ModuleToProcess  = @('Implicit.Veeam.psm1')
    FormatsToProcess = @('Implicit.Veeam.format.ps1xml')

    ModuleVersion    = '1.0'

    PrivateData      = @{
        ImplicitRemoting = $true
    }
}
        