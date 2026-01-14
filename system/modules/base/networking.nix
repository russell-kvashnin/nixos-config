{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    networkmanager
  ];

  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
    rejectPackets = true;
  };
}
