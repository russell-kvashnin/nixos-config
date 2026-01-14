{pkgs, ...}: {
  home.packages = with pkgs; [
    pcmanfm
    thunar
  ];

  programs.yazi.enable = true;
}
