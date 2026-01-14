{pkgs, ...}: {
  programs.nushell = {
    envFile.text = ''
      # Create cache dir
      mkdir $"($nu.cache-dir)"

      # Initialize utils cache
      ${pkgs.carapace}/bin/carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
    '';

    extraConfig = ''
      # Load carapace completer
      source $"($nu.cache-dir)/carapace.nu"

      $env.config = {
        show_banner: false,
        edit_mode: vi,
        cursor_shape: {
          vi_insert: line,
          vi_normal: block
        },
        completions: {
          case_sensitive: false,
          quick: true,
          partial: true,
          algorithm: "fuzzy",
          external: {
            enable: true,
            max_results: 100,
            completer: $carapace_completer
          }
        },
        keybindings: [
          {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
              until: [
                { send: menu name: completion_menu }
                { send: menupagenext }
              ]
            }
          }
        ]
      }

      #========== Extra funcs ==========#

      # search pid by name
      def pfind [name: string] {
        ps | where name =~ $name
      }

      # mkdir & cd
      def mkcd [dir: string] {
        mkdir $dir
        cd $dir
      }
    '';

    shellAliases = {
      c = "clear";
      find = "fd";
      grep = "rg";

      # Interactive mode for rewrite/remove
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";
      ln = "ln -i";

      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "-" = "cd -";

      # Disk usage
      df = "duf";
      du = "dust";

      # Systemctl
      start = "sudo systemctl start";
      stop = "sudo systemctl stop";
      restart = "sudo systemctl restart";
      status = "sudo systemctl status";
      enable = "sudo systemctl enable";
      disable = "sudo systemctl disable";

      ustart = "systemctl --user start";
      ustop = "systemctl --user stop";
      urestart = "systemctl --user restart";
      ustatus = "systemctl --user status";
      uenable = "systemctl --user enable";
      udisable = "systemctl --user disable";

      # One-liners
      cheat = "curl cheat.sh";
      myip = "curl ifconfig.me";
    };
  };
}
