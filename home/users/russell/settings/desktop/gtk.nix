{pkgs, ...}: {
  gtk = {
    theme = {
      name = "Nordic";
      package = pkgs.nordic-theme;
    };

    iconTheme = {
      name = "Newaita-reborn-nord-dark";
      package = pkgs.newaita-icons;
    };
  };
}
