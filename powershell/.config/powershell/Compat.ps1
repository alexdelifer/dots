if ($PSVersionTable.PSVersion -lt [version]'6.0.0') {
    Write-Host 'Please use PowerShell Core (6.0.0 or higher)'
    Read-Host "Press enter to exit"
    exit
}

# PSReadLine needs to be at least 2.2.2 for most stuff to work
if ((Get-Module PSReadLine).Version -lt [version]'2.2.2') {
    Write-Output 'PSReadLine too old, upgrading...'
    Install-Module -Name 'PSReadLine' -AllowPrerelease -Force
    Remove-Module PSReadLine -Force
    Import-Module PSReadLine
    Read-Host "Press enter to exit"
    exit
}