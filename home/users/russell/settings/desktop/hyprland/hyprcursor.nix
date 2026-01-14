{pkgs, ...}: {
  home.packages = with pkgs; [
    bibata-cursors
  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  xdg.configFile."hypr/hyprcursor.conf".text = ''
    [General]
    theme=Bibata-Modern-Classic
    size=24
  '';

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    GTK_USE_PORTAL = "1";
  };
}
