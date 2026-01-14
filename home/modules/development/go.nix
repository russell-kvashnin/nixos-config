{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    go
    delve
    golangci-lint
    go-tools
  ];

  home.sessionVariables = lib.mkDefault {
    GO111MODULE = "on";
    GOBIN = "$HOME/.local/bin";
  };
}
