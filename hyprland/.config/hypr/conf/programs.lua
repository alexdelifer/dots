-- Program shortcuts (was aliases.d/system.conf + programs.conf)
local P = {}

-- kitty is the terminal everywhere; foot server stays up for footclient users (ranger TERMCMD)
P.term          = "kitty"
P.term_scratch  = "kitty --class scratchpad"
P.term_float    = "kitty --class floatterm"
P.tmux          = "kitty --title tmux tmux new-session -A -s main"
P.foot_server   = "foot --server"
local function titled(title, cmd) return "kitty --title '" .. title .. "' " .. cmd end

P.launcher      = "rofi -show drun"
P.menu          = "rofi -show drun"
P.shutdown      = "~/.config/rofi/powermenu/powermenu.sh"
P.task_manager  = "pkill -9 fkill; " .. P.term_scratch .. " --title 'Task Killer - fkill' ~/bin/fzf-kill"
P.notifications = "mako"
P.locking       = "hyprlock"
P.idle          = "hypridle"

P.tui_file_browser = "TERMCMD='kitty --class scratchpad' " .. P.term_scratch .. " --title 'Ranger - File Manager' ranger"
P.gui_file_browser = "thunar"
P.nvim             = titled("NVIM - Editor", "nvim")
P.nvim_backlog     = titled("NVIM - Backlog", "nvim ~/Documents/backlog.md")
P.calc             = "qalculate-gtk"
P.update_packages  = titled("Update Packages", "yay")

-- Volume / brightness -> wob overlay
P.wob_socket   = "$XDG_RUNTIME_DIR/wob.sock"
P.sink_volume  = "pactl get-sink-volume @DEFAULT_SINK@ | grep '^Volume:' | cut -d / -f 2 | tr -d ' ' | sed 's/%//'"
P.sink_mute    = "pactl get-sink-mute @DEFAULT_SINK@ | sed -En \"/no/ s/.*/$(" .. P.sink_volume .. ")/p; /yes/ s/.*/0/p\""
P.source_volume = "pactl get-source-volume @DEFAULT_SOURCE@ | grep '^Volume:' | cut -d / -f 2 | tr -d ' ' | sed 's/%//'"
P.source_mute  = "pactl get-source-mute @DEFAULT_SOURCE@ | sed -En \"/no/ s/.*/$(" .. P.source_volume .. ")/p; /yes/ s/.*/0/p\""
P.onscreen_bar = "wob-show"

P.clipboard_open = "cliphist list | rofi -dmenu -p clipboard | cliphist decode | wl-copy; pkill -RTMIN+9 waybar"
P.wallpaper      = "swaybg -i ~/.config/hypr/skull.jpg -m fill"
P.gnome_polkit   = "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

-- Theming
P.gtk_theme    = "Kali-Dark"
P.icon_theme   = "Sweet-Blue-Filled"
P.cursor_theme = "Posy's Cursor Black"
P.cursor_size  = 24

return P
