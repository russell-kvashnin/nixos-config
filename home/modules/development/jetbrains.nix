{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains-toolbox
  ];

  home.sessionVariables = {
    JETBRAINS_TELEMETRY = "0";
    JETBRAINS_TELEMETRY_ALLOW = "0";

    JB_DISABLE_INTERNAL_BROWSER = "1";

    JETBRAINS_USE_WAYLAND = "1";
  };
}
