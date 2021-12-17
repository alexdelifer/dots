CheckConfig pipewire || return 0

AddPackage alsa-card-profiles # Low-latency audio/video router and processor - ALSA card profiles
AddPackage alsa-utils # Advanced Linux Sound Architecture - Utilities
AddPackage pamixer # Pulseaudio command-line mixer like amixer

AddPackage helvum # GTK patchbay for PipeWire
AddPackage libpipewire02 # Low-latency audio/video router and processor - legacy client library
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-media-session # Example session manager for PipeWire
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/pipewire-media-session.service
CreateLink /etc/systemd/user/pipewire.service.wants/pipewire-media-session.service /usr/lib/systemd/user/pipewire-media-session.service
