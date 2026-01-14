{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alsa-utils
    pavucontrol
  ];

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.pulseaudio.extraConfig = "load-module module-native-protocol-tcp";
}
