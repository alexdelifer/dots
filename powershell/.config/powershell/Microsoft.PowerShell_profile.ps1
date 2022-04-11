$PSDefaultParameterValues=@{ 
    "Invoke-Command:Authentication"='Negotiate'
    "*-PSSession:Authentication"='Negotiate'
}

# add default registry
try {
    Get-PSRepository -Name PSGallery -ErrorAction Stop | Out-Null
} catch {
    Register-PSRepository -Default -InstallationPolicy Trusted
}

# list modules to be loaded here
$MODULES = (
    "Microsoft.PowerShell.UnixCompleters",
    "PSReadLine",
    "oh-my-posh",
    "Az.Accounts",
    "Az.Tools.Predictor",
    "Microsoft.PowerShell.SecretManagement",
    "SecretManagement.BitWarden",
    "VMware.PowerCLI"
)

$AUTOLOAD = (
    "Microsoft.PowerShell.UnixCompleters",
    "PSReadLine",
    "oh-my-posh",
    "Az.Accounts",
    "Az.Tools.Predictor",
    "Microsoft.PowerShell.SecretManagement",
    "SecretManagement.BitWarden"
)

$MODULES | ForEach-Object {
    if (Get-Module -ListAvailable -Name $_) {
        if ($_ -in $AUTOLOAD) {
            Import-Module $_ 
        }
        Write-Host "Loaded: $_"
    } 
    else {
        Write-Host "Missing: $_"
        Install-Module -AllowPrerelease $_
        if ($_ -in $AUTOLOAD) {
            Import-Module $_ 
        }
        Write-Host "Loaded: $_"
    }
}

# obviously we want windows on linux...
Set-PSReadlineOption -EditMode Windows

# vmware go away
#Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false

# Sane defaults
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
#Set-PSReadLineKeyHandler -Key 'Ctrl+Spacebar' -Function MenuComplete

# Theme
#
#oh-my-posh init pwsh --config /home/alex/.cache/oh-my-posh/themes/tonybaloney.omp.json | Invoke-Expression
oh-my-posh init pwsh --config /home/alex/.cache/oh-my-posh/themes/pure.omp.json | Invoke-Expression
#oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/dracula.omp.json" | Invoke-Expression
