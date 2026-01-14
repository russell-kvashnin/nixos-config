let
  palette = import ../palette.nix;
in {
  background = {
    primary = palette.nord0;
    secondary = palette.nord1;
    alternate = palette.nord2;
    light = palette.nord3;
  };

  border = {
    primary = palette.nord2;
    secondary = palette.nord1;
    light = palette.nord8;
  };

  buttons = {
    primary = palette.nord8;
    active = palette.nord7;
    disabled = palette.nord2;
    passive = palette.nord4;

    background = palette.nord7;
  };

  labels = {
    primary = palette.nord8;
    secondary = palette.nord9;
    dark = palette.nord2;
  };

  icons = {
    primary = palette.nord8;
    active = palette.nord9;
    passive = palette.nord10;
    highlight = palette.nord6;
    disabled = palette.nord2;
  };

  text = {
    primary = palette.nord6;
    secondary = palette.nord4;
    highlight = palette.nord7;
    dim = palette.nord9;
    dark = palette.nord2;
    passive = palette.nord3;
    darkest = palette.nord0;
    debug = "#FF0000";
  };
}
