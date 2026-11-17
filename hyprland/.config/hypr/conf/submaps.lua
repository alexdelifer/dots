-- Modal keymaps (was config.d/submaps.conf). Escape/Return always leave the mode.
local P   = require("conf.programs")
local dsp = hl.dsp

local function leave_keys()
    hl.bind("escape", dsp.submap("reset"))
    hl.bind("Return", dsp.submap("reset"))
end
-- run a dispatcher, then drop back to the normal keymap
local function once(d)
    return function() hl.dispatch(d); hl.dispatch(dsp.submap("reset")) end
end
local function exec(cmd) return dsp.exec_cmd(cmd) end

hl.define_submap("mode_resize", function()
    hl.bind("H", dsp.window.resize({ x = -20, y = 0,   relative = true }), { repeating = true })
    hl.bind("L", dsp.window.resize({ x = 20,  y = 0,   relative = true }), { repeating = true })
    hl.bind("K", dsp.window.resize({ x = 0,   y = -20, relative = true }), { repeating = true })
    hl.bind("J", dsp.window.resize({ x = 0,   y = 20,  relative = true }), { repeating = true })
    leave_keys()
end)

hl.define_submap("mode_move", function()
    hl.bind("H", dsp.window.move({ monitor = "l" }))
    hl.bind("L", dsp.window.move({ monitor = "r" }))
    hl.bind("K", dsp.window.move({ monitor = "u" }))
    hl.bind("J", dsp.window.move({ monitor = "d" }))
    leave_keys()
end)

hl.define_submap("mode_screenshot", function()
    hl.bind("a", once(exec("grimblast copy area")))
    hl.bind("s", once(exec("grimblast copy screen")))
    hl.bind("w", once(exec("grimblast copy active")))
    hl.bind("escape", dsp.submap("reset"))
end)

hl.define_submap("mode_shutdown", function()
    hl.bind("l", once(exec(P.locking)))
    hl.bind("s", once(exec("systemctl suspend")))
    hl.bind("e", dsp.exit())
    hl.bind("r", exec("systemctl reboot"))
    hl.bind("p", exec("systemctl poweroff"))
    hl.bind("escape", dsp.submap("reset"))
end)

hl.define_submap("mode_displays", function()
    hl.bind("H", dsp.workspace.move({ monitor = "l" }))
    hl.bind("L", dsp.workspace.move({ monitor = "r" }))
    hl.bind("K", dsp.workspace.move({ monitor = "u" }))
    hl.bind("J", dsp.workspace.move({ monitor = "d" }))
    for i = 1, 5 do hl.bind(tostring(i), dsp.focus({ monitor = i - 1 })) end
    leave_keys()
end)

-- "clean": swallow nothing, only SUPER+F12 gets you out (for VMs / remote desktops)
hl.define_submap("clean", function()
    hl.bind("SUPER + F12", dsp.submap("reset"))
end)
