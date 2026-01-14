{...}: {
  users.users.russell = {
    isNormalUser = true;
    description = "Russell";
    group = "russell";
    extraGroups = [
      "audio"
      "docker"
      "input"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  users.groups.russell = {};
}
