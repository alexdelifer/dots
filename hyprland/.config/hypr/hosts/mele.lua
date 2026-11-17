-- mele: desktop, AMD RX 7900 XTX (card1, primary) + Intel UHD 770 (card0, drives nothing).
-- card0/card1 are symlinks dots-sync creates (/dev/dri/by-path/...; colons break the env list).
-- RDNA3 has 4 display pipes: DP-2, DP-3, DP-4, HDMI-A-3 (HDMI goes through a hardware splitter to the TV).
local cfg = os.getenv("HOME") .. "/.config/hypr"
hl.env("AQ_DRM_DEVICES",  cfg .. "/card1")
hl.env("WLR_DRM_DEVICES", cfg .. "/card1:" .. cfg .. "/card0")

--                                       [BenQ HDMI-A-3 -> splitter -> BenQ + TV]
--   [Acer DP-4 ][Asus DP-3 ][Dell DP-2 ]
hl.monitor({ output = "DP-4",     mode = "2560x1440@144", position = "0x720",    scale = 1 })  -- Acer XG270HU
hl.monitor({ output = "DP-3",     mode = "2560x1440@144", position = "2560x720", scale = 1 })  -- ROG PG279Q
hl.monitor({ output = "DP-2",     mode = "preferred",     position = "5120x1080", scale = 1 }) -- Dell P2419H
hl.monitor({ output = "HDMI-A-3", mode = "1920x1080@60",  position = "5120x0",   scale = 1 })  -- BenQ + TV
hl.monitor({ output = "DP-1",     disabled = true })

hl.on("hyprland.start", function()
    hl.exec_cmd("xrandr --output DP-3 --primary")  -- X11 games pick the right screen
    hl.exec_cmd("corectrl")
end)
