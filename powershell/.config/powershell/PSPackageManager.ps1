[CmdletBinding()]
param (
    [Parameter()]
    [array]
    $Modules
)

# add default registry
try {
    Get-PSRepository -Name PSGallery -ErrorAction Stop | Out-Null
}
catch {
    Register-PSRepository -Default -InstallationPolicy Trusted
}

# PowerShellGet needs to be at least 2.0.0 for most stuff to work
if ((Get-Module PowerShellGet).Version -lt [version]'2.0.0') {
    Write-Output 'PowerShellGet too old, upgrading...'
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name 'PowerShellGet' -Force
    Remove-Module PowerShellGet -Force
    Write-Host "Please restart the shell"
    Read-Host "Press enter to exit"
    exit
}

# convert to array of objects
$Modules = $Modules | ForEach-Object { [PSCustomObject]$_ }

$Modules | ForEach-Object {
    # install module if missing
    if (!(Get-Module -ListAvailable -Name $_.Name )) {
        Write-Host -ForegroundColor Red -NoNewLine "Missing: "
        Write-Host $_.Name
        Install-Module -AllowPrerelease -Force $_.Name
    }
    # load module if autoload = true
    if ($_.AutoLoad) {
        Import-Module $_.Name
    }
    Write-Host -ForegroundColor Green -NoNewLine "Loaded: "
    Write-Host $_.Name
}