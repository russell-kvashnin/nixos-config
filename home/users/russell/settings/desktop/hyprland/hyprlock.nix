{
  utilsLib,
  config,
  ...
}: let
  colorScheme = import ../../../../../modules/desktop/themes/nordic/apps/hyprlock.nix {
    inherit utilsLib;
  };

  paths = import ../../../paths.nix {inherit config;};
in {
  programs.hyprlock.settings = {
    auth = {
      pam.enabled = true;

      fingerprint = {
        enabled = true;
      };
    };

    animations.enabled = true;

    general = {
      hide_cursor = true;
      ignore_empty_input = true;
      immediate_render = true;
      fractional_scaling = 2;
      fail_timeout = 1000;
    };

    background = [
      {
        # monitor =
        # path = $BACKGROUND_PATH
        color = colorScheme.background.primary;
        blur_passes = 0;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.8916;
        vibrancy_darkness = 0.0;
      }
    ];

    # Date
    label = [
      {
        # KB Layout
        #
        # monitor =
        color = colorScheme.text.primary;
        font_size = 36;
        font_family = "Terminess Nerd Font";
        text = "$LAYOUT[en,ru]";
        valign = "top";
        halign = "right";
        position = "-20, 0";
      }
      {
        # Date
        #
        # monitor =
        color = colorScheme.text.primary;
        font_size = 36;
        font_family = "Terminess Nerd Font";
        text = ''cmd[update:1000] echo -e "$(LC_TIME=C date +"%A, %d %B")"'';
        valign = "center";
        halign = "center";
        position = "0, 600";
      }
      {
        # Time
        #
        # monitor =
        color = colorScheme.text.primary;
        font_size = 72;
        font_family = "Terminess Nerd Font";
        text = "$TIME";
        halign = "center";
        valign = "center";
        position = "0, 500";
      }
      {
        # Banner
        #
        # monitor =
        color = colorScheme.text.primary;
        font_size = 12;
        # font_family = Terminess Nerd Font
        text = "cmd[] cat ${paths.pictures.asciiArts}/oni.txt";
        halign = "center";
        valign = "center";
      }
    ];

    input-field = [
      {
        # Password input
        #
        # monitor =
        dots_center = true;
        size = "600,200";
        dots_text_format = "*";
        font_color = colorScheme.text.primary;
        font_family = "Terminess Nerd Font";
        font_size = 92;
        fade_on_empty = false;
        hide_input = false;
        rounding = 0;
        inner_color = colorScheme.background.primary;
        outer_color = colorScheme.background.primary;
        outline_thickness = -1;
        swap_font_color = false;
        capslock_color = colorScheme.text.error;
        placeholder_text = "Who are you, warior?";
        fail_text = "<b>GTFO</b>";
        fail_color = colorScheme.text.error;
        valign = "center";
        halign = "center";
        position = "0,-500";
      }
    ];
  };
}
