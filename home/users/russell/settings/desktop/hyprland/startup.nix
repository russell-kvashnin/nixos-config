{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    # Network management
    "nm-applet --indicator"

    # Bluetooth management
    "blueman-applet"

    # Polkit
    "systemctl --user start hyprpolkitagent"

    # Lid switch bug
    "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    # Hypr stuff
    "hypridle"
    "hyprpanel"
  ];
}
