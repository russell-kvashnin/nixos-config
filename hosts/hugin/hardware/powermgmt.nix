{...}: {
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
    powertop.enable = true;
  };

  services = {
    tlp.enable = false;

    auto-cpufreq = {
      enable = true;
      settings = {
        battery.governor = "powersave";
        charger.governor = "performance";
      };
    };
  };
}
