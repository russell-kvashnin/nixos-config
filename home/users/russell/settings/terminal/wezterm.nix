{pkgs, ...}: let
  colorScheme = import ../../../../modules/desktop/themes/nordic/apps/wezterm.nix;
in {
  xdg.configFile."wezterm/wezterm.lua".text = ''
    local wezterm = require 'wezterm'

    return {
      colors = {
        foreground = "${colorScheme.foreground}",
        background = "${colorScheme.background}",
        cursor_bg = "${colorScheme.cursor_bg}",
        cursor_fg = "${colorScheme.cursor_fg}",
        selection_bg = "${colorScheme.selection_bg}",
        selection_fg = "${colorScheme.selection_fg}",
        ansi = {
          "${builtins.elemAt colorScheme.ansi 0}",
          "${builtins.elemAt colorScheme.ansi 1}",
          "${builtins.elemAt colorScheme.ansi 2}",
          "${builtins.elemAt colorScheme.ansi 3}",
          "${builtins.elemAt colorScheme.ansi 4}",
          "${builtins.elemAt colorScheme.ansi 5}",
          "${builtins.elemAt colorScheme.ansi 6}",
          "${builtins.elemAt colorScheme.ansi 7}",
        },
        brights = {
          "${builtins.elemAt colorScheme.brights 0}",
          "${builtins.elemAt colorScheme.brights 1}",
          "${builtins.elemAt colorScheme.brights 2}",
          "${builtins.elemAt colorScheme.brights 3}",
          "${builtins.elemAt colorScheme.brights 4}",
          "${builtins.elemAt colorScheme.brights 5}",
          "${builtins.elemAt colorScheme.brights 6}",
          "${builtins.elemAt colorScheme.brights 7}",
        },
      },

      enable_wayland = true,

      color_scheme = "Nord",

      font = wezterm.font_with_fallback({
        'JetBrains Mono',
        'Noto Color Emoji',
      }),
      font_size = 14.0,
      line_height = 1.2,
      enable_tab_bar = false,
      window_decorations = "NONE",
      window_padding = {
        left = 15,
        right = 15,
        top = 15,
        bottom = 15,
      },
      keys = {
        {
          key = 'p',
          mods = 'SUPER',
          action = wezterm.action.ToggleFullScreen,
        },
      },

      default_prog = { '${pkgs.nushell}/bin/nu' },

      set_environment_variables = {
        SHELL = '${pkgs.nushell}/bin/nu',
      },
    }
  '';
}
