-- p14s (laptop): internal panel native + auto scale; externals auto-place to the right.
-- Hyprland renders on the iGPU (boot GPU); NVIDIA sleeps until `prime-run <app>`.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = "auto" })

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")   -- lock / dpms / suspend on idle (hypridle.conf)
end)
