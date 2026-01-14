{lib, ...}: {
  services.timesyncd.enable = true;

  services.journald = {
    extraConfig = ''
      Storage=persistent
      SystemMaxUse=1G
    '';
  };

  system.autoUpgrade = {
    enable = false;
  };

  services.dbus.enable = lib.mkDefault true;

  # Flash drives
  services.udisks2.enable = lib.mkDefault true;

  # Thunderbolt
  services.hardware.bolt.enable = true;

  services.upower.enable = true;
}
