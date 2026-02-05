{...}: {
  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
      lock_cmd = playerctl pause && hyprlock
      before_sleep_cmd = hyprlock
      ignore_dbus_inhibit = true
    }

    listener {
      timeout = 300
      on-timeout = hyprlock
    }

    listener {
      timeout = 600
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }

    listener {
      timeout = 900
      on-timeout = systemctl suspend
    }
  '';
}
