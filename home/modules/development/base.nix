{pkgs, ...}: {
  home.packages = with pkgs; [
    # Git
    gh
    git-lfs
    gitkraken

    # Tools
    just

    # Code analysis
    tokei
  ];

  programs.git.enable = true;
}
