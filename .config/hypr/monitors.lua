-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Left: 1080x1920 logical size after a 270-degree rotation. Its vertical
-- midpoint matches the center display.
hl.monitor({ output = "DP-2", mode = "1920x1080@74.97", position = "0x0", scale = 1, transform = 3 })

-- Center/main display.
hl.monitor({ output = "DP-3", mode = "2560x1440@144", position = "1080x240", scale = 1 })

-- Right display, top-aligned with DP-3.
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@74.97", position = "3640x240", scale = 1 })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
