{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../modules/utils/base.nix
    ../../modules/utils/filemgmt.nix

    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/gtk.nix
    ../../modules/desktop/notifications.nix
    ../../modules/desktop/tofi.nix

    ../../modules/development/base.nix
    ../../modules/development/git_kraken.nix
    ../../modules/development/go.nix
    ../../modules/development/jetbrains.nix
    ../../modules/development/net_tools.nix
    ../../modules/development/vscode.nix

    ../../modules/web

    ./settings
  ];

  home.username = "russell";
  home.homeDirectory = "/home/russell";

  home.packages = with pkgs; [
    # Useful utils
    playerctl
    brightnessctl

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.terminess-ttf
    nerd-fonts._3270
    nerd-fonts._0xproto
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    pictures = "${config.home.homeDirectory}/Pictures";

    extraConfig = {
      XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/Screenshots";
    };
  };

  home.file."Pictures/Wallpapers" = {
    source = ./pictures/wallpapers;
    recursive = true;
  };

  home.file."Pictures/ASCIIArts" = {
    source = ./pictures/ascii_arts;
    recursive = true;
  };

  home.stateVersion = "26.05";
}
