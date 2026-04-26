{...}: {
  powerManagement = {
    enable = false;
    powertop.enable = false;
  };

  services = {
    tlp.enable = false;

    auto-cpufreq = {
      enable = false;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
