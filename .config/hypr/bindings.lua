-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Voyager-friendly Vim navigation, matching the directional arrow bindings.
-- These replace Omarchy defaults on SUPER+J/K/L.
hl.unbind("SUPER + J") -- was: Toggle window split
hl.unbind("SUPER + K") -- was: Keybindings
hl.unbind("SUPER + L") -- was: Toggle workspace layout

o.bind("SUPER + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))

o.bind("SUPER + SHIFT + H", "Move window to the left", hl.dsp.window.move({ direction = "l" }))
o.bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.move({ direction = "d" }))
o.bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind("SUPER + SHIFT + L", "Move window to the right", hl.dsp.window.move({ direction = "r" }))

-- Match Omarchy's group-insertion arrow bindings with Vim directions.
-- When a window is already grouped, H/L cycle within that group instead.
-- SUPER+ALT+J/K/L previously held the re-homed actions below.
hl.unbind("SUPER + ALT + H")
hl.unbind("SUPER + ALT + J")
hl.unbind("SUPER + ALT + K")
hl.unbind("SUPER + ALT + L")

local function group_focus_or_insert(direction)
  return function()
    local active_window = hl.get_active_window()
    if active_window and active_window.group then
      if direction == "l" then
        hl.dispatch(hl.dsp.group.prev())
      else
        hl.dispatch(hl.dsp.group.next())
      end
      return
    end

    hl.dispatch(hl.dsp.window.move({ into_group = direction }))
  end
end

o.bind("SUPER + ALT + H", "Previous group window / group left", group_focus_or_insert("l"))
o.bind("SUPER + ALT + J", "Move window into group on the bottom", hl.dsp.window.move({ into_group = "d" }))
o.bind("SUPER + ALT + K", "Move window into group on top", hl.dsp.window.move({ into_group = "u" }))
o.bind("SUPER + ALT + L", "Next group window / group right", group_focus_or_insert("r"))

-- Match Omarchy's grouped-focus arrow bindings with Vim keys.
-- These displace Omarchy's Hardware menu and Lock system bindings.
hl.unbind("SUPER + CTRL + H") -- was: Hardware menu
hl.unbind("SUPER + CTRL + L") -- was: Lock system
o.bind("SUPER + CTRL + H", "Previous window in group", hl.dsp.group.prev())
o.bind("SUPER + CTRL + L", "Next window in group", hl.dsp.group.next())

-- Re-home the Omarchy actions displaced by Vim navigation.
hl.unbind("SUPER + CTRL + ALT + K")
o.bind("SUPER + CTRL + ALT + K", "Keybindings", "omarchy-menu-keybindings")
hl.unbind("SUPER + CTRL + ALT + L")
o.bind("SUPER + Y", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
hl.unbind("SUPER + CTRL + ALT + J")
o.bind("SUPER + CTRL + ALT + J", "Toggle window split", hl.dsp.layout("togglesplit"))

-- Display scaling breaks the explicit three-monitor geometry; keep scale at 1.
hl.unbind("SUPER + SLASH") -- was: Monitor scaling up
hl.unbind("SUPER + ALT + SLASH") -- was: Monitor scaling down

-- Use keyboard-first Yazi as the primary file manager.
-- SUPER+ALT+SHIFT+F keeps Omarchy's Nautilus-in-current-directory fallback.
hl.unbind("SUPER + SHIFT + F") -- was: Nautilus file manager
o.bind("SUPER + SHIFT + F", "File manager (Yazi)", { tui = "yazi" })

-- Signal's shared Pop!_OS profile stores its database key in GNOME Keyring.
hl.unbind("SUPER + SHIFT + G") -- was: Signal via Omarchy's generic launcher
o.bind("SUPER + SHIFT + G", "Signal", { launch = "/home/sasank/.local/bin/signal-gnome-keyring", focus = "signal" })

-- Use the installed Obsidian package and match its actual window class.
hl.unbind("SUPER + SHIFT + O") -- was: Obsidian via the default PATH launcher
o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "/usr/bin/obsidian", focus = "Obsidian" })

-- Pop-style window actions.
hl.unbind("SUPER + W") -- was: Close window; restoring the original binding
o.bind("SUPER + W", "Close window", hl.dsp.window.close())
hl.unbind("SUPER + T") -- was: Terminal; restoring Omarchy's default
o.bind("SUPER + T", "Toggle window floating/tiling", hl.dsp.window.float({ action = "toggle" }))
hl.unbind("SUPER + ALT + T") -- was: Temporary duplicate floating/tiling toggle
o.bind("SUPER + M", "Maximize window", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.unbind("SUPER + ALT + Q") -- was: Close window (temporary custom binding)

-- Move windows rather than merely swapping them, including across monitors.
hl.unbind("SUPER + SHIFT + LEFT")
hl.unbind("SUPER + SHIFT + RIGHT")
hl.unbind("SUPER + SHIFT + UP")
hl.unbind("SUPER + SHIFT + DOWN")
o.bind("SUPER + SHIFT + LEFT", "Move window to the left", hl.dsp.window.move({ direction = "l" }))
o.bind("SUPER + SHIFT + RIGHT", "Move window to the right", hl.dsp.window.move({ direction = "r" }))
o.bind("SUPER + SHIFT + UP", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind("SUPER + SHIFT + DOWN", "Move window down", hl.dsp.window.move({ direction = "d" }))

-- Mirror SUPER+SHIFT+ALT+arrow (move workspace to another monitor) onto hjkl.
-- The arrow versions stay bound; these are additions, not replacements.
-- Note: all three monitors sit side by side, so "u"/"d" have no target today.
-- J is bound anyway so it works if a monitor is ever stacked above/below.
-- K is a no-op today for the same reason; the Tmux keybindings menu that used
-- to sit here was dropped to free the key.
o.bind("SUPER + SHIFT + ALT + H", "Move workspace to left monitor", hl.dsp.workspace.move({ monitor = "l" }))
o.bind("SUPER + SHIFT + ALT + J", "Move workspace to down monitor", hl.dsp.workspace.move({ monitor = "d" }))
o.bind("SUPER + SHIFT + ALT + K", "Move workspace to up monitor", hl.dsp.workspace.move({ monitor = "u" }))
o.bind("SUPER + SHIFT + ALT + L", "Move workspace to right monitor", hl.dsp.workspace.move({ monitor = "r" }))

-- Cycle workspaces on the CURRENT monitor only ("m+1"/"m-1"), skipping
-- workspaces that live on the other two screens. SUPER+TAB stays global.
-- code:34/35 are [ and ]; plain SUPER on them is free (SUPER+ALT+[ / ] are
-- the webcam overlay resize bindings).
o.bind("SUPER + code:35", "Next workspace on this monitor", hl.dsp.focus({ workspace = "m+1" }))
o.bind("SUPER + code:34", "Previous workspace on this monitor", hl.dsp.focus({ workspace = "m-1" }))
