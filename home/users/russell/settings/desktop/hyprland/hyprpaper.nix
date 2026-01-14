{
  pkgs,
  config,
  ...
}: let
  paths = import ../../../paths.nix {inherit config;};
in {
  systemd.user.services.hyprpaper = {
    Unit = {
      After = ["hyprland-session.target"];
      PartOf = ["graphical-session.target"];
      Requires = ["hyprland-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["hyprland-session.target"];
    };
  };

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    wallpaper {
      monitor =
      path = ${paths.pictures.wallpapers}/default.jpg
      fit_mode = cover
    }

    splash = false
  '';
}
