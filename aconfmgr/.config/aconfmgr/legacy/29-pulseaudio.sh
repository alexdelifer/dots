CheckConfig pulseaudio || return 0

AddPackage alsa-card-profiles # Low-latency audio/video router and processor - ALSA card profiles
AddPackage alsa-utils # Advanced Linux Sound Architecture - Utilities
AddPackage pamixer # Pulseaudio command-line mixer like amixer

