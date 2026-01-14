{...}: let
  mod = "SUPER";
  term = "wezterm";
in {
  wayland.windowManager.hyprland.settings.bind = [
    # Main
    "${mod}, Return, exec, ${term}"
    "${mod} SHIFT, Q, killactive"
    "${mod}, D, exec, tofi-drun | xargs hyprctl dispatch exec --"
    "${mod} SHIFT, D, exec, tofi-run | xargs hyprctl dispatch exec --"
    "${mod}, X, exit"
    "${mod}, F, fullscreen"
    "${mod}, Space, togglefloating"
    "${mod} CTRL, L, exec, hyprlock"

    # Display select
    "${mod}, period, focusmonitor, +1"
    "${mod}, comma, focusmonitor, -1"

    # Windows control
    "${mod}, H, movefocus, l"
    "${mod}, J, movefocus, d"
    "${mod}, K, movefocus, u"
    "${mod}, L, movefocus, r"

    "${mod} SHIFT, H, movewindow, l"
    "${mod} SHIFT, L, movewindow, r"
    "${mod} SHIFT, K, movewindow, u"
    "${mod} SHIFT, J, movewindow, d"
    "${mod} SHIFT, left, movewindow, l"
    "${mod} SHIFT, right, movewindow, r"
    "${mod} SHIFT, up, movewindow, u"
    "${mod} SHIFT, down, movewindow, d"

    "${mod} SHIFT, period, movewindow, mon:+1"
    "${mod} SHIFT, comma, movewindow, mon:-1"

    "${mod} CTRL, left, resizeactive, -50 0"
    "${mod} CTRL, right, resizeactive, 50 0"
    "${mod} CTRL, up, resizeactive, 0 -50"
    "${mod} CTRL, down, resizeactive, 0 50"

    # Workspaces default binds
    "${mod}, 1, workspace, 1"
    "${mod}, 2, workspace, 2"
    "${mod}, 3, workspace, 3"
    "${mod}, 4, workspace, 4"
    "${mod}, 5, workspace, 5"
    "${mod}, 6, workspace, 6"
    "${mod}, 7, workspace, 7"
    "${mod}, 8, workspace, 8"
    "${mod}, 9, workspace, 9"
    "${mod}, 0, workspace, 10"

    "${mod}, Insert, workspace, 5"
    "${mod}, Home, workspace, 6"
    "${mod}, Prior, workspace, 7"
    "${mod}, Delete, workspace, 8"
    "${mod}, End, workspace, 9"
    "${mod}, Next, workspace, 10"

    "${mod} SHIFT, 1, movetoworkspace, 1"
    "${mod} SHIFT, 2, movetoworkspace, 2"
    "${mod} SHIFT, 3, movetoworkspace, 3"
    "${mod} SHIFT, 4, movetoworkspace, 4"
    "${mod} SHIFT, 5, movetoworkspace, 5"
    "${mod} SHIFT, 6, movetoworkspace, 6"
    "${mod} SHIFT, 7, movetoworkspace, 7"
    "${mod} SHIFT, 8, movetoworkspace, 8"
    "${mod} SHIFT, 9, movetoworkspace, 9"
    "${mod} SHIFT, 0, movetoworkspace, 10"

    "${mod} SHIFT, Insert, movetoworkspace, 5"
    "${mod} SHIFT, Home, movetoworkspace, 6"
    "${mod} SHIFT, Prior, movetoworkspace, 7"
    "${mod} SHIFT, Delete, movetoworkspace, 8"
    "${mod} SHIFT, End, movetoworkspace, 9"
    "${mod} SHIFT, Next, movetoworkspace, 10"

    ", Print, exec, grim - | swappy -f -"
    "${mod} SHIFT, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"

    # Audio stuff
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioPlay, exec, playerctl play-pause"

    # Brightness
    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
  ];
}
