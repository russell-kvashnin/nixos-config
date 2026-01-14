{...}: {
  boot.initrd.luks.devices."luks-0d90e4e5-3214-423b-bb68-8d11a8d53b4e".device = "/dev/disk/by-uuid/0d90e4e5-3214-423b-bb68-8d11a8d53b4e";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/41AD-0278";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/aae4be35-a337-415a-b088-110024a359cc";
    fsType = "btrfs";
    options = ["subvol=@" "noatime" "discard"];
  };

  # No swap
  swapDevices = [];
}
