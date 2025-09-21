CheckConfig pipewire || return 0


AddPackage alsa-card-profiles # Low-latency audio/video router and processor - ALSA card profiles
AddPackage alsa-utils # Advanced Linux Sound Architecture - Utilities

AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-jack # Low-latency audio/video router and processor - JACK replacement
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement

AddPackage lib32-pipewire-jack # Low-latency audio/video router and processor - 32-bit - JACK support

AddPackage pasystray # PulseAudio system tray (a replacement for padevchooser)
AddPackage pamixer # Pulseaudio command-line mixer like amixer
AddPackage libpulse # A featureful, general-purpose sound server (client library)
AddPackage gst-plugin-pipewire # Multimedia graph framework - pipewire plugin
AddPackage wireplumber # Session / policy manager implementation for PipeWire

AddPackage projectm # Music visualizer which uses 3D accelerated iterative image based rendering
AddPackage projectm-pulseaudio # Music visualizer which uses 3D accelerated iterative image based rendering (pulseaudio)
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
AddPackage helvum # GTK patchbay for PipeWire
AddPackage pavucontrol # PulseAudio Volume Control

CopyFile /etc/pipewire/media-session.d/alsa-monitor.conf
CopyFile /etc/pipewire/media-session.d/bluez-monitor.conf
CopyFile /etc/pipewire/media-session.d/media-session.conf