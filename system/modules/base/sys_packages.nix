{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Hardware
    dmidecode
    lm_sensors
    usbutils

    # System monitoring
    btop
    iotop

    # Network tools
    curl
    wget
    openssh
    nethogs

    # Base devel
    git
    gnumake
    gcc
    cmake

    # Files, search utils
    file
    tree

    libnotify

    # FHS
    steam-run
  ];
}
