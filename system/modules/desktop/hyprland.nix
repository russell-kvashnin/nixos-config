{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_DRM_NO_MODIFIERS = "1";
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      XWAYLAND_NO_GLAMOR = "0";
    };

    pathsToLink = ["/share/icons"];
  };

  services = {
    dbus.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  xdg.portal = {
    enable = true;

    wlr.enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
