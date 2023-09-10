function Install-Chocolatey {

    $testchoco = choco -v 2>&1 $null
    if (-not($testchoco)) {
        Write-Output "Seems Chocolatey is not installed, installing now"
        Set-ExecutionPolicy Bypass -Scope Process -Force #Devskim: Ignore DS113853
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) #Devskim: Ignore DS104456
    }
}

Install-Chocolatey