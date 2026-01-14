let
  palette = import ../palette.nix;
in {
  text = {
    main = palette.nord6;
    highlighted = palette.nord8;
    emergency = palette.nord11;
  };

  character = {
    success = palette.nord14;
    error = palette.nord11;
    vicmd = palette.nord7;
  };

  yellow = palette.nord13;
  purple = palette.nord15;
  cyan = palette.nord8;
  blue = palette.nord10;
  red = palette.nord11;
}
