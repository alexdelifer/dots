-- Keybinds (was config.d/keybindings.conf)
local P   = require("conf.programs")
local dsp = hl.dsp
local mod = "SUPER"

local function key(mods, k) return (mods ~= "" and (mods .. " + ") or "") .. k end
local function bind(mods, k, d, opts) hl.bind(key(mods, k), d, opts) end
local function exec(cmd) return dsp.exec_cmd(cmd) end
local R = { repeating = true }

-- mouse
bind(mod, "mouse:272", dsp.window.drag(),   { mouse = true })
bind(mod, "mouse:273", dsp.window.resize(), { mouse = true })

-- window / session
bind(mod .. " + SHIFT", "q", dsp.window.close())
bind(mod .. " + SHIFT", "r", exec("pkill -9 waybar; waybar & pkill -9 hyprpaper; hyprpaper & hyprctl reload"))
bind(mod, "t",               exec(P.term_scratch))
bind(mod .. " + SHIFT", "t", exec(P.tmux))
bind(mod, "d",               exec(P.launcher))
bind(mod, "Return",          exec(P.term))
bind(mod .. " + SHIFT", "Return", exec(P.term_float))
bind(mod .. " + SHIFT", "V", exec("kitty --class clipse --title clipse clipse"))

-- media keys (-> wob)
bind("", "XF86AudioRaiseVolume", exec("pactl set-sink-volume @DEFAULT_SINK@ +5% && " .. P.sink_volume .. " > " .. P.wob_socket), R)
bind("", "XF86AudioLowerVolume", exec("pactl set-sink-volume @DEFAULT_SINK@ -5% && " .. P.sink_volume .. " > " .. P.wob_socket), R)
bind("", "XF86AudioMute",        exec("pactl set-sink-mute @DEFAULT_SINK@ toggle && " .. P.sink_mute .. " > " .. P.wob_socket))
bind("", "XF86AudioMicMute",     exec("pactl set-source-mute @DEFAULT_SOURCE@ toggle && " .. P.source_mute .. " > " .. P.wob_socket))
bind("", "XF86MonBrightnessUp",   exec("brightnessctl set +5% && " .. P.onscreen_bar .. " $(brightnessctl get)"), R)
bind("", "XF86MonBrightnessDown", exec("brightnessctl set 5%- && " .. P.onscreen_bar .. " $(brightnessctl get)"), R)
bind("", "XF86AudioPlay", exec("playerctl play-pause"))
bind("", "XF86AudioNext", exec("playerctl next"))
bind("", "XF86AudioPrev", exec("playerctl previous"))
bind("", "XF86Search",    exec(P.menu))
bind("", "XF86PowerOff",  exec(P.shutdown))

-- workspaces: summon to the focused monitor; SHIFT moves the window silently
for i = 1, 10 do
    local k = tostring(i % 10)
    bind(mod, k,               dsp.focus({ workspace = i, on_current_monitor = true }))
    bind(mod .. " + SHIFT", k, dsp.window.move({ workspace = i, follow = false }))
end
bind(mod, "code:34",    dsp.focus({ workspace = "-1",  on_current_monitor = true }))   -- [
bind(mod, "code:35",    dsp.focus({ workspace = "+1",  on_current_monitor = true }))   -- ]
bind(mod, "mouse_down", dsp.focus({ workspace = "e+1", on_current_monitor = true }))
bind(mod, "mouse_up",   dsp.focus({ workspace = "e-1", on_current_monitor = true }))

-- apps
bind(mod, "F1",  exec(P.tui_file_browser))
bind(mod, "F2",  exec(P.gui_file_browser))
bind(mod, "F4",  exec(P.clipboard_open))
bind(mod, "F6",  exec(P.nvim))
bind(mod, "F7",  exec(P.nvim_backlog))
bind(mod, "F8",  exec(P.calc))
bind(mod, "F10", exec(P.nvim))
bind(mod .. " + CTRL", "e", exec("rofimoji"))
bind(mod .. " + CTRL", "b", exec(P.update_packages))
bind(mod .. " + CTRL", "l", exec(P.locking))
bind(mod .. " + SHIFT", "C", exec("hyprpicker | wl-copy -n"))
bind(mod .. " + SHIFT", "x", exec(P.task_manager))
bind(mod, "tab",             exec(P.task_manager))
bind(mod .. " + SHIFT", "g", exec("pkill -x steam; sleep 2 && gamescope -W 1920 -H 1080 -r 60 -f -e -- steam -gamepadui"))

-- modes (conf/submaps.lua)
bind(mod .. " + SHIFT", "d", dsp.submap("mode_displays"))
bind(mod .. " + SHIFT", "a", dsp.submap("mode_move"))
bind(mod,               "r", dsp.submap("mode_resize"))
bind(mod .. " + SHIFT", "s", dsp.submap("mode_screenshot"))
bind(mod .. " + SHIFT", "e", dsp.submap("mode_shutdown"))
bind(mod,               "F12", dsp.submap("clean"))

-- special workspace / floating / fullscreen
bind(mod .. " + SHIFT", "minus", exec("hypr-fix-special"))
bind(mod, "minus", dsp.workspace.toggle_special())
bind(mod .. " + SHIFT", "space", function()
    hl.dispatch(dsp.window.float({ action = "toggle" }))
    hl.dispatch(dsp.window.center())
end)
bind(mod, "V", dsp.window.float({ action = "toggle" }))
bind(mod, "f", dsp.window.fullscreen())

-- screenshots
bind("",                 "Print", exec("grimblast copy area"))
bind("SHIFT",            "Print", exec("grimblast copy output"))
bind(mod .. " + SHIFT",  "Print", exec("grimblast copy active"))

-- focus / move / resize (vim keys)
local dirs = { H = "left", J = "down", K = "up", L = "right" }
for k, d in pairs(dirs) do
    bind(mod, k,               dsp.focus({ direction = d }))
    bind(mod .. " + SHIFT", k, dsp.window.move({ direction = d }))
end
bind(mod .. " + CTRL", "H", dsp.window.resize({ x = -20, y = 0,   relative = true }), R)
bind(mod .. " + CTRL", "J", dsp.window.resize({ x = 0,   y = 20,  relative = true }), R)
bind(mod .. " + CTRL", "K", dsp.window.resize({ x = 0,   y = -20, relative = true }), R)
bind(mod .. " + CTRL", "L", dsp.window.resize({ x = 20,  y = 0,   relative = true }), R)

-- OBS global hotkeys
bind("CTRL + SHIFT", "r", dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
bind("CTRL + SHIFT", "b", dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
