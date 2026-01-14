{...}: {
  programs.git.settings = {
    user = {
      name = "Russell Kvashnin";
      email = "russell.kvashnin@gmail.com";
    };

    init.defaultBranch = "main";
  };
}
