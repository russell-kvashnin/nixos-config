{...}: {
  imports = [
    ../../system/modules/base/services.nix
  ];

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
  };
}
