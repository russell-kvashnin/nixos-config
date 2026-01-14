{pkgs, ...}: {
  environment.systemPackages = [pkgs.polkit];

  users.users.root = {
    hashedPassword = "!";
    shell = pkgs.shadow;
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };

    polkit.enable = true;

    pam.services = {
      hyprlock = {
        fprintAuth = true;
      };
      login = {
        fprintAuth = true;
      };
      sudo = {
        fprintAuth = true;
      };
    };
  };

  security.tpm2 = {
    enable = true;

    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };
}
