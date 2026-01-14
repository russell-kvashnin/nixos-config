{utilsLib, ...}: let
  palette = import ../palette.nix;
in {
  borders = {
    active = utilsLib.colors.hexToHyprRgba palette.nord8 1;
    inactive = utilsLib.colors.hexToHyprRgba palette.nord3 1;
  };
}
