# modules to be loaded
$MODULES = (
    @{Name = "Microsoft.PowerShell.UnixCompleters"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.UnixCompleters"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.SecretManagement"; AutoLoad = $True },
    @{Name = "Microsoft.PowerShell.ConsoleGuiTools"; AutoLoad = $True },
    @{Name = "PSReadLine"; AutoLoad = $True },
    @{Name = "Az.Accounts"; AutoLoad = $True },
    @{Name = "Az.Tools.Predictor"; AutoLoad = $True },
    @{Name = "SecretManagement.BitWarden"; AutoLoad = $True },
    @{Name = "VMware.PowerCLI"; AutoLoad = $False },
    @{Name = "ZeroTierController"; AutoLoad = $True }
)

# find my PS config folder (cross platform compatible)
[string]$MYPSHOME = (Get-ChildItem $PROFILE).Directory

# OS Specific settings
if ($IsLinux -or $IsMacOS) { & "$MYPSHOME/Unix.ps1" }
else { & "$MYPSHOME/Windows.ps1" }

# load other scripts
& "$MYPSHOME/Compat.ps1"
& "$MYPSHOME/PSPackageManager.ps1" $MODULES
& "$MYPSHOME/Settings.ps1"
& "$MYPSHOME/Alias.ps1"
& "$MYPSHOME/Theme.ps1"




