{utilsLib, ...}: let
  colorScheme = import ../../../../modules/desktop/themes/nordic/apps/tofi.nix {
    inherit utilsLib;
  };
in {
  programs.tofi = {
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      font = "Terminess Nerd Font Mono";
      background-color = colorScheme.background;
      text-color = colorScheme.text.main;
      default-result-color = colorScheme.text.defaultResult;
      selection-color = colorScheme.text.selectionResult;
    };
  };
}
