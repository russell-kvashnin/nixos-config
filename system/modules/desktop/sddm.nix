{...}: {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "hyprland";
    };
    desktopManager.plasma5.enable = false;
  };
}
