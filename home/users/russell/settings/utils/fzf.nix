{...}: {
  programs.fzf = {
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--color=fg:#d8dee9,bg:#2e3440,hl:#81a1c1"
    ];
  };
}
