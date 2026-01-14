{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./boot.nix
    ./graphics.nix
    ./powermgmt.nix
    ./storage.nix

    ../../../system/modules/hardware/audio.nix
    ../../../system/modules/hardware/bluetooth.nix
    ../../../system/modules/hardware/fingerprint.nix

    inputs.nixos-hardware.nixosModules.dell-xps-13-9300
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    firmware = [pkgs.sof-firmware pkgs.linux-firmware];
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    wirelessRegulatoryDatabase = true;
    sensor.iio.enable = true;
    enableAllFirmware = lib.mkDefault false;
    i2c.enable = true;
  };

  services = {
    fwupd.enable = true;

    thermald.enable = true;

    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };
}
