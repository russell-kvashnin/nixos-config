{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Utils
    grim
    slurp
    wl-clipboard

    # Hyprland ecosystem
    hyprland-qt-support
    hyprpolkitagent
    hyprcursor
    hypridle
    hyprpaper

    # Multi-display setup tool
    inputs.hyprmon.packages.${pkgs.stdenv.hostPlatform.system}.hyprmon

    # QT
    qt5.qtwayland
    qt6.qtwayland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };

  programs.hyprlock.enable = true;

  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
  };
}
