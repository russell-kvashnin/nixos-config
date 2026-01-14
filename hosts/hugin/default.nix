{...}: {
  imports = [
    ./hardware
    ./services.nix

    ../../system/modules/base/locale.nix
    ../../system/modules/base/networking.nix
    ../../system/modules/base/nix.nix
    ../../system/modules/base/security.nix
    ../../system/modules/base/services.nix
    ../../system/modules/base/sys_packages.nix

    ../../system/modules/desktop/hyprland.nix
    ../../system/modules/desktop/greetd.nix

    ../../system/modules/development/docker.nix

    # must be installed as system module
    # @see https://github.com/NixOS/nixpkgs/issues/338380
    ../../system/modules/network/amnezia.nix

    ../../home/users/russell/user.nix
  ];

  networking.hostName = "hugin";

  system.stateVersion = "26.05";
}
