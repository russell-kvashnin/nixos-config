{...}: {
  programs.helix = {
    defaultEditor = true;

    settings = {
      theme = "nord";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}
