let
  palette = import ../palette.nix;
in {
  foreground = palette.nord4;
  background = palette.nord0;
  cursor_bg = palette.nord4;
  cursor_fg = palette.nord0;
  selection_bg = palette.nord2;
  selection_fg = palette.nord4;

  ansi = [
    palette.nord1 # Black
    palette.nord11 # Red
    palette.nord14 # Green
    palette.nord13 # Yellow
    palette.nord9 # Blue
    palette.nord15 # Magenta
    palette.nord8 # Cyan
    palette.nord5 # White
  ];

  brights = [
    palette.nord3 # Bright black
    palette.nord11 # Bright red
    palette.nord14 # Bright green
    palette.nord13 # Bright yellow
    palette.nord9 # Bright blue
    palette.nord15 # Bright magenta
    palette.nord7 # Bright cyan
    palette.nord6 # Bright white
  ];
}
