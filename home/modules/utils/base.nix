{pkgs, ...}: {
  home.packages = with pkgs; [
    # Files, search, etc...
    fd
    ripgrep

    # Sys mon/mgmt
    duf
    dust
    fastfetch
    procs
    ncdu

    # Network
    httpie
    dog

    # Archives
    unar
    zip
    unzip

    # Media
    ffmpegthumbnailer
    imagemagick
    viu
    chafa

    # Json, YAML, etc
    jq
    yq
    dasel
    jc

    # Text editing
    neovim
    delta

    # Wayland tools
    wev
  ];

  # Files, search, etc...
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  # Text editing
  programs.helix.enable = true;

  # Terminal, shell, prompt, etc...
  programs.wezterm.enable = true;
  programs.nushell.enable = true;
  programs.starship.enable = true;
  programs.carapace.enable = true;
}
