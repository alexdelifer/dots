AddPackage ark # Archiving Tool
AddPackage plasma-desktop # KDE Plasma Desktop
AddPackage plasma-meta # Meta package to install KDE Plasma
AddPackage plasma-wayland-protocols # Plasma Specific Protocols for Wayland
AddPackage polkit-kde-agent # Daemon providing a polkit authentication UI for KDE
AddPackage colord-kde # Interfaces and session daemon to colord for KDE
AddPackage dolphin # KDE File Manager
AddPackage qdirstat # Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)
AddPackage spectacle # KDE screenshot capture utility

CopyFile /etc/pam.d/kde
CopyFile /etc/sddm.conf.d/kde_settings.conf