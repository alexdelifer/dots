-- Window rules (was config.d/window-rules.conf). Workspaces are names/ids as strings.
local function rule(name, match, props)
    props.name  = name
    props.match = match
    hl.window_rule(props)
end

-- app -> workspace
local ws = {
    ["^(firefox)$"] = "2", ["^(google-chrome)$"] = "11", ["^(thunderbird)$"] = "4",
    ["^(Signal)$"] = "5", ["^(Element)$"] = "5", ["^(WebCord)$"] = "5", ["^(ferdium)$"] = "5", ["^(discord)$"] = "5",
    ["^(steam)$"] = "7", ["^(steam_app.*)$"] = "7",
    ["^(tidal-hifi)$"] = "8", ["^(com.github.wwmm.easyeffects)$"] = "8",
    ["^(com.obsproject.Studio)$"] = "9", ["^(ch.proton.bridge-gui)$"] = "10",
}
local i = 0
for class, w in pairs(ws) do
    i = i + 1
    rule("ws-" .. i, { class = class }, { workspace = w })
end
rule("ws-vscode",      { title = "^(Visual Studio Code)$" }, { workspace = "3" })
rule("steamwebhelper", { class = "^(steamwebhelper)$" }, { workspace = "7", tile = true })
rule("gamescope",      { class = "^(gamescope)$" }, { workspace = "7", fullscreen = true })
rule("skyrimse",       { class = "^(steam_app_489830)$" }, { workspace = "7", float = true })
rule("steam-menus",    { class = "^(steam)$", title = "^()$" }, { min_size = "1 1" })

rule("xwaylandvideobridge", { class = "^(xwaylandvideobridge)$" },
    { opacity = "0.0 override 0.0 override", no_anim = true, no_focus = true, no_initial_focus = true })

-- floating
for _, class in ipairs({ "scratchpad", "floatterm", "pcmanfm", "pcmanfm-qt", "pamac-manager", "thunar",
                         "pulsemixer", "pavucontrol", "calamares", "blueman-manager" }) do
    rule("float-" .. class, { class = "^(" .. class .. ")$" }, { float = true })
end
for _, title in ipairs({ "^(File Transfer*)$", "^(Firefox — Sharing Indicator)$", "^(Save File)$" }) do
    rule("float-title-" .. title, { title = title }, { float = true })
end
rule("ff-library",     { class = "^(firefox)$", title = "^(library)" }, { float = true })
rule("tb-reminder",    { class = "^(thunderbird)$", title = "^(.*Reminder)" }, { float = true })
rule("roller-tile",    { class = "^(file-roller)$", title = "^(Archive manager)" }, { tile = true })
rule("roller-extract", { class = "^(file-roller)$", title = "^(Extract archive)" }, { float = true })
rule("clipse",         { class = "(clipse)" }, { float = true, size = "622 652" })
