{utilsLib, ...}: let
  palette = import ../palette.nix;
in {
  text = {
    primary = utilsLib.colors.hexToRgb palette.nord6;

    # TODO: integrate default colors?
    error = "rgb(204, 34, 34)";
  };
  background = {
    primary = "rgb(0, 0, 0)";
  };
}
