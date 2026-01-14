{
  lib,
  pkgs,
  ...
} @ args: let
  hostName = args.hostName or "unknown";
  isHugin = hostName == "hugin";
  # isKraken = hostName == "kraken";
in {
  imports =
    [
      ./animations.nix
      ./binds.nix
      ./hyprcursor.nix
      ./hypridle.nix
      ./hyprpanel.nix
      ./hyprpaper.nix
      ./hyprlock.nix
      ./startup.nix
      ./windows.nix
    ]
    ++ (lib.optional isHugin ./settings_hugin.nix);
}
