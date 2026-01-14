{...}: {
  programs.zoxide = {
    enableNushellIntegration = true;
  };

  home.sessionVariables = {
    _ZO_EXCLUDE_DIRS = "/tmp:/proc:/dev:/sys:/var/tmp:/run/user:/snap:/nix/var/nix/gcroots";
    _ZO_EXCLUDE_PATTERNS = "*.git/*:node_modules:__pycache__:*.cache:target:dist:build:.DS_Store:*.log:*.tmp:result:./result:*.drv";
    _ZO_MAXAGE = "20000";
    _ZO_RESOLVE_SYMLINKS = "1";
    _ZO_ECHO = "1";
  };
}
