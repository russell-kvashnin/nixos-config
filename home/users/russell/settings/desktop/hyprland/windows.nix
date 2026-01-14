{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # File manager
      "float,title:^(Open File)$"

      "float,class:^(org.pulseaudio.pavucontrol)$"

      # JetBrains
      "rounding 0,class:^(jetbrains-goland)$,title:^(Settings)$"
    ];
    windowrule = [
    ];
  };
}
