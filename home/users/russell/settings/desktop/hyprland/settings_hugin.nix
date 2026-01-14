{utilsLib, ...}: let
  colorScheme = import ../../../../../modules/desktop/themes/nordic/apps/hyprland.nix {
    inherit utilsLib;
  };
in {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1, 3840x2400@59.99, 0x0, 2.0"
        "DP-6, 3440x1440@59.99, 3840x0, 1.0"
      ];

      env = [
        "XCURSOR_SIZE,24"

        # GTK Scaling
        "GDK_BACKEND,wayland"
        "GDK_SCALE,2"
        "GDK_DPI_SCALE,1"

        "QT_QPA_PLATFORM,wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"

        # Java
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "_JAVA_OPTIONS,-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.uiScale=2"

        # Apps
        "ELECTRON_OZONE_PLATFORM_HINT,auto"

        # Intel graphics
        "GALLIUM_DRIVER,iris"
        "LIBVA_DRIVER_NAME,iHD"
      ];

      debug = {
        disable_logs = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
          middle_button_emulation = true;
          tap-to-click = true;
          drag_lock = true;
          scroll_factor = 0.8;
          disable_while_typing = true;
        };
        sensitivity = 0.2;
        follow_mouse = 0;
        float_switch_override_focus = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;

        "col.active_border" = colorScheme.borders.active;
        "col.inactive_border" = colorScheme.borders.inactive;
      };

      gestures = {
        gesture = "3, horizontal, workspace";
        workspace_swipe_distance = 400;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 15;
        workspace_swipe_cancel_ratio = 0.15;
        workspace_swipe_create_new = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        vfr = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
