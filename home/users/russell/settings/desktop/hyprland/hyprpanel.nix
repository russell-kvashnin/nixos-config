{...}: let
  colorScheme = import ../../../../../modules/desktop/themes/nordic/apps/hyprpanel.nix;
in {
  programs.hyprpanel.settings = {
    scalingPriority = "hyprland";

    tear = false;

    bar = {
      layouts = {
        "0" = {
          left = ["dashboard" "media" "volume" "windowtitle"];
          middle = ["workspaces"];
          right = ["battery" "clock" "systray" "kbinput" "notifications"];
        };
        "1" = {
          left = ["dashboard" "media" "volume" "windowtitle"];
          middle = ["workspaces"];
          right = ["battery" "clock" "systray" "kbinput" "notifications"];
        };
        "2" = {
          left = ["dashboard" "media" "volume" "windowtitle"];
          middle = ["workspaces"];
          right = ["battery" "clock" "systray" "kbinput" "notifications"];
        };
      };

      launcher = {
        autoDetectIcon = false;
        icon = "";
      };

      systray = {
        customIcons = {};
        "nm-applet" = {
          "icon" = "󰖩";
          "size" = "1.2em";
        };
        "hiddify" = {
          "icon" = "";
          "size" = "1.2em";
        };
      };

      workspaces = {
        applicationIconOncePerWorkspace = false;
        show_icons = false;
        showWsIcons = true;
        spacing = 1.5;
        numbered_active_indicator = "highlight";

        workspaceIconMap = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "󰘦";
          "6" = "󰘦";
          "7" = "󰘦";
          "8" = "󰘦";
          "9" = "";
          "10" = "";
        };
      };
    };

    theme = {
      bar = {
        layer = "top";

        transparent = true;

        buttons = {
          battery = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          bluetooth = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          clock = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          dashboard = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          media = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          modules = {
            kbLayout = {
              background = colorScheme.background.secondary;
              text = colorScheme.text.primary;
              icon = colorScheme.icons.active;
            };
          };

          notifications = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
            total = colorScheme.text.highlight;
          };

          separator = {
            width = "0.1em";

            margin = "0.15em";
          };

          style = "default";

          systray = {
            enableBorder = false;
            background = colorScheme.background.secondary;
          };

          volume = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          windowtitle = {
            background = colorScheme.background.secondary;
            text = colorScheme.text.primary;
            icon = colorScheme.icons.active;
          };

          workspaces = {
            background = colorScheme.background.secondary;
            icon = colorScheme.icons.active;

            hover = colorScheme.icons.highlight;
            occupied = colorScheme.icons.highlight;
            active = colorScheme.icons.primary;

            numbered_active_highlight_border = "0.2em";
            numbered_inactive_padding = "0.15em";
            numbered_active_highlight_padding = "0.5em";

            smartHighlight = true;
          };
        };

        menus = {
          background0 = colorScheme.background.primary;
          cards = colorScheme.background.secondary;
          dimtext = colorScheme.text.dim;
          feinttext = colorScheme.text.debug;
          label = colorScheme.labels.primary;
          text = colorScheme.text.primary;

          border = {
            color = colorScheme.background.alternate;
            width = "0.1em";
            radius = "0.75em";
          };

          buttons = {
            active = colorScheme.buttons.active;
            default = colorScheme.buttons.primary;
            disabled = colorScheme.buttons.disabled;
            text = colorScheme.text.dark;
          };

          check_radio_button = {
            active = colorScheme.buttons.active;
            background = colorScheme.background.primary;
          };

          dropdownmenu = {
            background = colorScheme.background.primary;
            divider = colorScheme.background.secondary;
            text = colorScheme.text.secondary;
          };

          icons = {
            active = colorScheme.icons.primary;
            passive = colorScheme.buttons.passive;
          };

          iconbuttons = {
            active = colorScheme.buttons.primary;
            passive = colorScheme.buttons.passive;
          };

          listitems = {
            active = colorScheme.buttons.primary;
            passive = colorScheme.buttons.passive;
          };

          menu = {
            battery = {
              background.color = colorScheme.background.primary;
              border.color = colorScheme.border.primary;
              card.color = colorScheme.background.secondary;
              label.color = colorScheme.labels.secondary;

              icons = {
                active = colorScheme.icons.active;
                passive = colorScheme.icons.passive;
              };

              slider = {
                background = colorScheme.background.alternate;
                backgroundhover = colorScheme.background.alternate;
                primary = colorScheme.icons.active;
              };

              text = colorScheme.text.secondary;
            };

            bluetooth = {
              background.color = colorScheme.background.primary;
              border.color = colorScheme.border.primary;
              card.color = colorScheme.background.secondary;
              label.color = colorScheme.labels.primary;
              status = colorScheme.text.passive;

              icons = {
                active = colorScheme.icons.primary;
                passive = colorScheme.icons.passive;
              };

              iconbutton = {
                active = colorScheme.buttons.primary;
                passive = colorScheme.buttons.active;
              };

              listitems = {
                active = colorScheme.buttons.primary;
                passive = colorScheme.buttons.active;
              };

              switch = {
                disabled = colorScheme.buttons.disabled;
                enabled = colorScheme.buttons.primary;
                puck = colorScheme.buttons.disabled;
              };

              text = colorScheme.text.secondary;
            };

            clock = {
              background.color = colorScheme.background.primary;
              border.color = colorScheme.border.primary;
              card.color = colorScheme.background.secondary;

              calendar = {
                yearmonth = colorScheme.text.highlight;
                weekdays = colorScheme.text.highlight;
                currentday = colorScheme.text.highlight;
                contextdays = colorScheme.text.dark;
                days = colorScheme.text.secondary;
                paginator = colorScheme.text.highlight;
              };

              text = colorScheme.text.secondary;

              time = {
                time = colorScheme.text.primary;
                timeperiod = colorScheme.text.primary;
              };
            };

            dashboard = {
              background.color = colorScheme.background.primary;
              border.color = colorScheme.border.primary;
              card.color = colorScheme.background.secondary;
            };

            media = {
              album = colorScheme.text.primary;
              artist = colorScheme.text.primary;
              song = colorScheme.text.highlight;
              timestamp = colorScheme.text.primary;

              background.color = colorScheme.background.primary;
              border.color = colorScheme.border.primary;
              card.color = colorScheme.background.secondary;

              slider = {
                primary = colorScheme.buttons.primary;
                background = colorScheme.background.alternate;
                backgroundhover = colorScheme.background.alternate;
                puck = colorScheme.buttons.disabled;
              };

              buttons = {
                background = colorScheme.buttons.background;
                enabled = colorScheme.buttons.background;
                inactive = colorScheme.buttons.disabled;
                text = colorScheme.text.primary;
              };
            };

            notifications = {
              background = colorScheme.background.primary;
              border = colorScheme.border.primary;
              card = colorScheme.background.secondary;
              clear = colorScheme.buttons.active;
              label = colorScheme.labels.primary;

              scrolbar.color = colorScheme.buttons.primary;

              switch_divider = colorScheme.buttons.disabled;

              switch = {
                disabled = colorScheme.buttons.disabled;
                enabled = colorScheme.buttons.primary;
                puck = colorScheme.buttons.disabled;
              };

              pager = {
                background = colorScheme.background.primary;
                label = colorScheme.labels.secondary;
              };
            };

            volume = {
              background.color = colorScheme.background.primary;
              border.color = colorScheme.border.primary;
              card.color = colorScheme.background.secondary;

              text = colorScheme.text.secondary;

              audio_slider = {
                primary = colorScheme.buttons.primary;
                background = colorScheme.background.alternate;
                backgroundhover = colorScheme.background.alternate;
                puck = colorScheme.buttons.disabled;
              };

              iconbutton = {
                active = colorScheme.buttons.primary;
                passive = colorScheme.buttons.active;
              };

              input_slider = {
                primary = colorScheme.buttons.primary;
                background = colorScheme.background.alternate;
                backgroundhover = colorScheme.background.alternate;
                puck = colorScheme.buttons.disabled;
              };

              label.color = colorScheme.labels.secondary;

              listitems = {
                active = colorScheme.buttons.primary;
                passive = colorScheme.buttons.active;
              };
            };
          };

          popover = {
            background = colorScheme.background.primary;
            border = colorScheme.background.primary;
            text = colorScheme.text.primary;
          };

          tooltip = {
            background = colorScheme.background.primary;
            text = colorScheme.text.secondary;
          };
        };
      };

      font = {
        name = "JetBrainsMono Nerd Font";
        label = "JetBrainsMono Nerd Font";
        size = "1.2rem";
        weight = 400;
      };

      notification = {
        background = colorScheme.background.light;
        text = colorScheme.text.secondary;
        time = colorScheme.text.passive;
        label = colorScheme.labels.primary;

        action = {
          background = colorScheme.background.light;
          text = colorScheme.text.darkest;
        };

        close_button = {
          background = colorScheme.buttons.background;
          label = colorScheme.text.darkest;
        };
      };

      osd = {
        bar_background = colorScheme.background.alternate;
        bar_container = colorScheme.background.secondary;
        bar_color = colorScheme.icons.active;

        icon = colorScheme.text.darkest;
        icon_container = colorScheme.buttons.background;

        value_text = colorScheme.text.primary;
      };
    };

    menus = {
      clock = {
        dashboard = {
          controls = {
            enabled = false;
          };
          shortcuts = {
            enabled = true;
          };
        };
        weather = {
          enabled = false;
        };
      };
    };
  };
}
