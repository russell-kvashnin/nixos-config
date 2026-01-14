{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
    alejandra
  ];

  programs.vscode = {
    enable = true;
  };
}
