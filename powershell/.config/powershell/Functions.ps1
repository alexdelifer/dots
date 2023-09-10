function Set-ImplicitModuleCreds {

    [cmdletbinding()]
    param (
        [parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName)]
        [string]$Path
        
    )

    $file = Get-Content $Path

    [string]$line = $file | Select-String '-Credential' | Select-Object -ExpandProperty Line
    [string]$patch = '                    -Credential $creds `'

    $file | ForEach-Object { $_.replace($line, $patch) } | Set-Content $Path

}

function Export-MyImplicitSessionModule {
    [cmdletbinding()]
    param (
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName)]
        [string]$SessionName,
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName)]
        [string]$ModuleName
        
    )

    $session = Get-PSSession -Name $SessionName

    $export = Export-PSSession -OutputModule "$($MYPSHOME)/Implicit/$($ModuleName)" -Session $session -CommandType Cmdlet

    Set-ImplicitModuleCreds -Path $export[2].FullName

}

function ConvertFrom-SecureStringPlainText {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName)]
        [SecureString]
        $Password
    )

    # Decrypt Password
    (New-Object PSCredential "user", $Password).GetNetworkCredential().Password
}

