local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local noctCall = "noctalia msg "

-- Window manipulation
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Change Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move Windows and Workspace
hl.bind(mainMod .. " + CONTROL + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + G", hl.dsp.focus({ workspace = "name:gaming" }))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.move({ workspace = "name:gaming" }))

-- Resize windows with Keyboard
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 25, y = 0, relative = true }), { repeating = true})
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { repeating = true})
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { repeating = true})
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 25, relative = true }), { repeating = true})

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(APPS.TERMINAL))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd(APPS.TERMINAL .. " -D ~/.config/hypr/ nvim ."))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(APPS.FILE_MANAGER))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(APPS.TEXT_EDITOR))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(APPS.BROWSER))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(APPS.CALCULATOR))

-- Noctalia Shortcuts
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctCall .. "session lock"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))

-- Special Copy
hl.bind(mainMod.. " + Y", hl.dsp.exec_cmd("wl-paste --type \"text/html;charset=UTF-16\" | wl-copy --type text/html"))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "screenshot-region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(noctCall .. "volume-mute"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(noctCall .. "mic-mute"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(noctCall .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(noctCall .. "media next"),       { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(noctCall .. "media previous"),   { locked = true })
