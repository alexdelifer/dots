# modules to be loaded
$MODULES = (
    @{Name = "Microsoft.PowerShell.UnixCompleters"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.UnixCompleters"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.SecretManagement"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.ConsoleGuiTools"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.Archive"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.TextUtility"; AutoLoad = $True },
    @{Name = "PSReadLine"; AutoLoad = $True },
    @{Name = "CompletionPredictor"; AutoLoad = $True },
    @{Name = "ThreadJob"; AutoLoad = $False },
    @{Name = "Pode"; AutoLoad = $False },
    @{Name = "JoinModule"; AutoLoad = $True },
    # work
    @{Name = "Az.Accounts"; AutoLoad = $False },
    @{Name = "Az.Tools.Predictor"; AutoLoad = $False },
    @{Name = "AWSPowerShell"; AutoLoad = $False },
    @{Name = "SecretManagement.BitWarden"; AutoLoad = $True },
    @{Name = "VMware.PowerCLI"; AutoLoad = $False },
    @{Name = "GlpiTools"; AutoLoad = $False },
    @{Name = "Graphical"; AutoLoad = $False },
    @{Name = "InvokeBuild"; AutoLoad = $False },
    @{Name = "Pester"; AutoLoad = $False },
    @{Name = "PSScriptAnalyzer"; AutoLoad = $False },
    @{Name = "JiraPS"; AutoLoad = $False },
    @{Name = "MicrosoftTeams"; AutoLoad = $False },
    @{Name = "PSEventViewer"; AutoLoad = $False },
    @{Name = "PSWinReportingV2"; AutoLoad = $False },
    @{Name = "PSWriteExcel"; AutoLoad = $False },
    @{Name = "PSWriteWord"; AutoLoad = $False },
    @{Name = "PSWriteHTML"; AutoLoad = $False },
    @{Name = "PSWritePDF"; AutoLoad = $False },
    @{Name = "ImportExcel"; AutoLoad = $False },
    @{Name = "powershell-yaml"; AutoLoad = $False },
    @{Name = "Posh-SSH"; AutoLoad = $False },
    @{Name = "RunAs"; AutoLoad = $False },
    @{Name = "posh-git"; AutoLoad = $True },
    # personal
    @{Name = "Terminal-Icons"; AutoLoad = $True },
    @{Name = "Poke"; AutoLoad = $False },
    @{Name = "ZeroTierController"; AutoLoad = $True }
)

# find my PS config folder (cross platform compatible)
[string]$MYPSHOME = (Get-ChildItem $PROFILE).Directory
if (!(Test-Path $MYPSHOME)) { New-Item -ItemType Directory -Name $MYPSHOME }

# OS Specific settings
if ($IsLinux -or $IsMacOS) { & "$MYPSHOME/Unix.ps1" }
else { & "$MYPSHOME/Windows.ps1" }

# load other scripts
& "$MYPSHOME/Compat.ps1"
& "$MYPSHOME/PSPackageManager.ps1" $MODULES
& "$MYPSHOME/Settings.ps1"
& "$MYPSHOME/Theme.ps1"
. "$MYPSHOME/Alias.ps1"

$message = "
**Get-Module -ListAvailable** to show available modules to **Import-Module**\
**Get-PSReadLineKeyHandler** to show configured keybindings\
\
**Installed Modules:** $((get-module -listAvailable | Measure-Object).Count) \
**Loaded Modules:** $((get-module | Measure-Object).Count) \
**MYPSHOME:** $MYPSHOME
"

#pClear-Host
Write-Host -ForegroundColor "Cyan" "Welcome!"
($message | ConvertFrom-Markdown -AsVT100EncodedString).VT100EncodedString


