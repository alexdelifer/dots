CheckConfig firewall || return 0

CopyFile /etc/firewalld/zones/docker.xml
CopyFile /etc/firewalld/services/chromecast-ssdp.xml
CopyFile /etc/firewalld/services/chromecast-ssdp.xml.old
CopyFile /etc/firewalld/services/chromecast.xml
CopyFile /etc/firewalld/services/chromecast.xml.old
CopyFile /etc/firewalld/zones/home.xml
CopyFile /etc/firewalld/zones/home.xml.old

#RemoveFile /etc/systemd/system/multi-user.target.wants/firewalld.service
#RemoveFile /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service
