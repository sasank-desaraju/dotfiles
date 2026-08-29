-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- cua-driver native Wayland (Hyprland). X11 path cannot see native Chromium.
hl.env("CUA_DRIVER_RS_ENABLE_WAYLAND", "1")
