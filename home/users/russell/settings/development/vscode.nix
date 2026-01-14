{pkgs, ...}: {
  programs.vscode = {
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          # NixOS
          jnoortheen.nix-ide
          kamadorueda.alejandra

          # Git
          eamodio.gitlens
          codezombiech.gitignore
        ];

        userSettings = {
          # Common settings
          "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace'";
          "editor.fontSize" = 14;
          "editor.formatOnSave" = true;

          # codezombiech.gitignore
          "ignore.enableAutoComplete" = true;
          "gitignore.enableSyntaxHighlight" = true;
          "gitignore.showStartMessages" = false;

          # Nix settings
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
          "nix.formatterPath" = "${pkgs.alejandra}/bin/alejandra";
          "[nix]"."editor.defaultFormatter" = "kamadorueda.alejandra";

          # Nix-IDE settings
          "nix-ide.settings".nil.formatting.command = ["alejandra"];
        };
      };
    };
  };
}
