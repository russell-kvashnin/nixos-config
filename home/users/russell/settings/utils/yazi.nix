{...}: {
  programs.yazi = {
    settings = {
      manager = {
        opener = "nvim {file}";
      };
    };
  };
}
