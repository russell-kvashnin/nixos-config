{...}: let
  colorScheme = import ../../../../modules/desktop/themes/nordic/apps/starship.nix;
in {
  programs.starship = {
    enable = true;

    settings = {
      format =
        "$username$hostname $directory($style) "
        + "$git_branch"
        + "$git_status"
        + "$nix_shell"
        + "$\{custom.nix_dots}"
        + "$\{custom.nix_config}"
        + "$golang"
        + "$php"
        + "$java"
        + "$kotlin"
        + "$kubernetes"
        + "$helm\n"
        + " $character $\{custom.test}";
      right_format = "$cmd_duration";

      username = {
        style_user = "${colorScheme.text.main} bold";
        style_root = "${colorScheme.text.emergency} bold";
        format = "[$user]($style)";
        disabled = false;
        show_always = true;
      };

      hostname = {
        format = "@[$hostname](bold ${colorScheme.text.main})";
        ssh_only = false;
        disabled = false;
      };

      directory = {
        read_only = " ";
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "bold ${colorScheme.text.highlighted}";
        truncation_length = 0;
        truncate_to_repo = true;
        fish_style_pwd_dir_length = 0;
      };

      character = {
        success_symbol = "[➜](bold ${colorScheme.character.success})";
        error_symbol = "[✗](bold ${colorScheme.character.error})";
        vicmd_symbol = "[V](bold ${colorScheme.character.success})";
      };

      git_branch = {
        format = "on [$symbol$branch ]($style)";
        symbol = "󰊢 ";
        style = "bold ${colorScheme.purple}";
      };

      git_status = {
        format = "[$all_status $ahead_behind]($style)";
        style = "bold ${colorScheme.yellow}";
        conflicted = "  ";
        ahead = " $\{count} ";
        behind = " $\{count} ";
        diverged = " $\{ahead_count}  $\{behind_count} ";
        untracked = " $\{count} ";
        modified = "  $\{count} ";
        staged = " $\{count} ";
        renamed = "󰁔 $\{count} ";
        deleted = "󰆴 $\{count} ";
      };

      golang = {
        symbol = " ";
        style = "bold ${colorScheme.cyan}";
      };

      php = {
        symbol = " ";
        style = "bold ${colorScheme.blue}";
      };

      java = {
        symbol = " ";
        style = "bold ${colorScheme.red}";
      };

      kotlin = {
        symbol = " ";
        style = "bold ${colorScheme.purple}";
      };

      kubernetes = {
        symbol = " ";
        style = "bold ${colorScheme.blue}";
      };

      helm = {
        symbol = " ";
        style = "bold ${colorScheme.blue}";
      };

      nix_shell = {
        symbol = " ";
        style = "bold ${colorScheme.blue}";
        format = "[$symbol$name]($style)";
        heuristic = false;
        disabled = false;
      };

      cmd_duration = {
        min_time = 1000;
        format = "[$duration](bold ${colorScheme.yellow})";
        disabled = false;
      };

      custom.nix_dots = {
        format = "[$output]($style)";
        command = ''
          let nixos_version = (open /etc/os-release | lines | where $it =~ "PRETTY_NAME" | first | split column "=" | get column1 | str trim -c '"')
          echo $"via  ($nixos_version)"
        '';
        style = "bold ${colorScheme.blue}";
        detect_files = ["flake.nix"];
        disabled = false;
      };
    };
  };
}
