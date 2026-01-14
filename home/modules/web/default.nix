{pkgs, ...}: {
  home.packages = with pkgs; [
    google-chrome
    telegram-desktop
  ];
}
