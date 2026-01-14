{pkgs, ...}: {
  home.packages = with pkgs; [
    libnotify
    mako
  ];

  # TODO: disabled while using hyprpanel
  services.mako = {
    enable = false;
  };
}
