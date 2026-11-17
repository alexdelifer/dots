-- Hyprland (0.57+, Lua config). Shared by mele, p14s and degen via ~/dots.
--   conf/*.lua   shared pieces (programs, theme, autostart, rules, binds, submaps)
--   hosts/<hostname>.lua   per-machine monitors / GPU env / input / extras
-- Docs: https://wiki.hypr.land/configuring/   API stubs: /usr/share/hypr/stubs/hl.meta.lua

local function hostname()
    local f = io.open("/etc/hostname", "r")
    if not f then return "" end
    local h = f:read("*l") or ""
    f:close()
    return (h:gsub("%s+", ""))
end
HOST = hostname()

-- Fallback for any output a host file doesn't name
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

require("conf.env")
require("conf.theme")
require("conf.input")
require("conf.autostart")
require("conf.rules")
require("conf.binds")
require("conf.submaps")

local ok, err = pcall(require, "hosts." .. HOST)
if not ok and not tostring(err):find("not found") then
    hl.notification.create({ text = "hosts/" .. HOST .. ".lua: " .. tostring(err), timeout = 10000, color = "rgba(ef5350ff)" })
end
