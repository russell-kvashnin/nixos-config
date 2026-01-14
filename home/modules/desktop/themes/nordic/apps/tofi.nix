{utilsLib}: let
  palette = import ../palette.nix;
in {
  text = {
    main = palette.nord6;
    defaultResult = palette.nord4;
    selectionResult = palette.nord11;
  };

  background = utilsLib.colors.withAlpha palette.nord0 0.75;
}
