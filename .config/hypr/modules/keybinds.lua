local mod = "SUPER"

-- Apps
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("nautilus"))

-- Window
-- hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
--     { description = "Window: Maximize" }) -- disabled by scrolling mode
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
    { description = "Window: Fullscreen" })
hl.bind(mod .. " + Q", hl.dsp.window.close(), { description = "Window: Close" })
-- Move/resize floating windows
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Window: Move" })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Window: Resize" })
hl.bind(mod .. " + mouse:274", hl.dsp.window.drag(), { mouse = true, drag = true })
-- Scrolling layout
hl.bind(mod .. " + H", hl.dsp.layout("focus l"))
hl.bind(mod .. " + L", hl.dsp.layout("focus r"))
hl.bind(mod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
hl.bind(mod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))
hl.bind(mod .. " + R", hl.dsp.layout("colresize +conf"))
hl.bind(mod .. " + F", hl.dsp.layout("fit active"))


-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))
--hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("hyprshot -m output"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Media
local mediaNextCommand =
"playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(mediaNextCommand), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
    { locked = true, repeating = true })
hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })

hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"),
    { locked = true, description = "Media: Previous track" })
hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd(mediaNextCommand), { locked = true, description = "Media: Next track" })
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true, description = "Media: Play/pause media" })
hl.bind(mod .. " + SHIFT + ALT + mouse:275", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mod .. " + SHIFT + ALT + mouse:276", hl.dsp.exec_cmd(mediaNextCommand))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"),
    { locked = true, description = "Media: Toggle mute" })
hl.bind(mod .. " + ALT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),
    { locked = true, description = "Media: Toggle mic" })

-- Session
hl.bind(mod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    { description = "Exit Session" })

---

-- Switcher
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"), { description = "Snappy Switcher" })
hl.bind(mod .. " + TAB", hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"),
    { description = "Snappy Switcher (Workspace)" })


--WORKSPACES--
-- SUPER + numero -> enfocar workspace en grupo
for i = 1, 10 do
    hl.bind(mod .. " + " .. (i % 10), function()
        hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
    end)
end

-- Raw keycodes (fallback para layouts raros)
local numkeys = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
for i = 1, 10 do
    hl.bind(mod .. " + code:" .. numkeys[i], function()
        hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
    end)
end

-- Numpad
local numpadkeys = { 87, 88, 89, 83, 84, 85, 79, 80, 81, 90 }
for i = 1, 10 do
    hl.bind(mod .. " + code:" .. numpadkeys[i], function()
        hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
    end)
end

-- SUPER + SHIFT + numero -> mover ventana al workspace
for i = 1, 10 do
    hl.bind(mod .. " + SHIFT + " .. (i % 10), function()
        hl.dispatch(hl.dsp.window.move({
            workspace = workspace_in_group(i),
            follow = true
        }))
    end)
end

-- SUPER + ALT + numero -> enviar ventana al workspace (sin follow)
for i = 1, 10 do
    hl.bind(mod .. " + ALT + " .. (i % 10), function()
        hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = false }))
    end)
end

-- Special workspace
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("special"))
hl.bind(mod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:special", follow = false }))


-- hl.bind(mod .. " + E", hl.dsp.exec_cmd("dolphin"))

-- hl.bind(mod .. " + Tab", hl.dsp.window.cycle_next())
-- hl.bind("ALT + Tab", hl.dsp.window.cycle_next({ hist = true }))
-- hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ prev = true, hist = true }))


--VICINAE--
hl.bind(mod .. " + Space", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))

hl.bind(mod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }), { description = "Window: Float/Tile" })

-- Wallpaper toggle pause
-- hl.bind(mod .. " + ALT + P", hl.dsp.exec_cmd("echo 'cycle pause' | socat - /tmp/mpvsocket"),
--     { description = "Wallpaper: Toggle pause" })
hl.bind("ALT + P", hl.dsp.exec_cmd("echo 'cycle pause' | socat - /tmp/mpvsocket"),
    { description = "Wallpaper: Toggle pause" })


-- RUST
-- hl.bind("SUPER, R", "exec", "/ruta/a/tu/proyecto/target/release/tu_programa")
hl.bind(mod .. " + Z",
    hl.dsp.exec_cmd("sh -c 'pkill fondito; /home/styv/work/RustProjects/fondito/target/release/fondito'"))
hl.bind(mod .. " + X",
    hl.dsp.exec_cmd("sh -c 'pkill barrita; /home/styv/work/RustProjects/barrita/target/release/barrita'"))
