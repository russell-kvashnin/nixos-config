{
  description = "Russell's multi-device NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nordic-theme.url = "github:EliverLara/Nordic";
    nordic-theme.flake = false;

    newaita-icons.url = "github:cbrnix/Newaita-reborn";
    newaita-icons.flake = false;

    hyprmon.url = "github:erans/hyprmon";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    hyprland,
    nordic-theme,
    newaita-icons,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    overlays = import ./overlays {inherit inputs;};

    overlayedPkgs = import nixpkgs {
      inherit system;

      overlays = [
        overlays.additions
        overlays.modifications
      ];

      config.allowUnfree = true;
    };

    utilsLib = import ./lib {inherit (nixpkgs) lib;};

    mkHostProfile = {
      hostName,
      profileName ? "unstable",
      extraModules ? [],
      extraSpecialArgs ? {},
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs =
          {
            inherit inputs;
            hostName = hostName;
            profileName = profileName;
            utilsLib = utilsLib;
          }
          // extraSpecialArgs;

        modules =
          [
            {
              nixpkgs.pkgs = overlayedPkgs;

              environment.systemPackages = [
                inputs.home-manager.packages.${system}.home-manager
              ];
            }

            ./hosts/${hostName}

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                extraSpecialArgs = {
                  inherit inputs system;
                  hostName = hostName;
                  profileName = profileName;
                  pkgs = overlayedPkgs;
                  utilsLib = utilsLib;
                  isNixOs = true;
                };

                backupFileExtension = "backup";

                users.russell = import ./home/users/russell/home.nix;
              };
            }

            {
              system.nixos = {
                label = "${hostName}-${profileName}";
              };
            }
          ]
          ++ extraModules;
      };

    mkHuginProfile = profileName: extraModules:
      mkHostProfile {
        hostName = "hugin";
        profileName = profileName;
        extraModules = extraModules;
      };
  in {
    lib = utilsLib;

    overlays = overlays;

    formatter.${system} = overlayedPkgs.alejandra;

    nixosConfigurations = {
      "hugin-unstable" = mkHuginProfile "unstable" [];

      "hugin-stable" = mkHuginProfile "stable" [];

      "hugin-fallback" = mkHuginProfile "fallback" [];
    };

    homeConfigurations = {
      "russell@hugin" = home-manager.lib.homeManagerConfiguration {
        pkgs = overlayedPkgs;

        modules = [./home/users/russell/home.nix];

        extraSpecialArgs = {
          inherit inputs;
          inherit system;

          hostName = "hugin";
          utilsLib = utilsLib;
          pkgs = overlayedPkgs;
        };
      };
    };
  };
}
