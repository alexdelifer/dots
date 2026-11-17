local P = require("conf.programs")

hl.config({
    general = {
        layout      = "dwindle",
        gaps_in     = 5,
        gaps_out    = 15,
        border_size = 4,
        col = {
            active_border   = "rgba(4477ffff)",
            inactive_border = "rgba(2f343fff)",
        },
    },
    cursor = {
        no_warps         = true,
        inactive_timeout = 900,
    },
    misc = {
        focus_on_activate     = false,
        disable_hyprland_logo = true,
    },
    dwindle   = { preserve_split = true },
    render    = { direct_scanout = true },
    ecosystem = { no_update_news = true, no_donation_nag = true },
    animations = { enabled = true },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows",    enabled = true, speed = 2, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fadeIn",     enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "fadeOut",    enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default" })

-- GTK / cursor theme (re-applied on every config load)
local schema = "org.gnome.desktop.interface"
hl.exec_cmd("gsettings set " .. schema .. " gtk-theme '" .. P.gtk_theme .. "'")
hl.exec_cmd("gsettings set " .. schema .. " icon-theme '" .. P.icon_theme .. "'")
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl setcursor \"" .. P.cursor_theme .. "\" " .. P.cursor_size)
end)
