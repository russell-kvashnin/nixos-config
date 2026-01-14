{...}: {
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;

      bezier = [
        "smooth, 0.4, 0.8, 0.2, 1"
      ];

      animation = [
        "windowsIn, 1, 3.5, smooth, gnomed"
        "windowsOut, 1, 3.5, smooth, gnomed"
        "windows, 1, 2, smooth"

        "fade, 0.75, 3.5, smooth"

        "border, 1, 5, smooth"

        "workspaces, 1, 5, default, slide"
      ];
    };
  };
}
