
<#
 # Implicit remoting module
 # generated on 12/16/2020 7:59:25 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\Implicit\Exchange" -Session (get-pssession -Name WinRM1) -Force
 #>
        
@{
    GUID = '96bf9b9b-1330-4ac5-86a3-b7f21b1879d7'
    Description = "Implicit remoting for http://$ImplicitExchange/PowerShell/?SerializationLevel=Full"
    ModuleToProcess = @('Implicit.Exchange.psm1')
    FormatsToProcess = @('Implicit.Exchange.format.ps1xml')

    ModuleVersion = '1.0'

    PrivateData = @{
        ImplicitRemoting = $true
    }
}
        