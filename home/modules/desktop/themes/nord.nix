let
  nord = import ./palette/nord.nix;
in {
  hover = nord.snowStorm.nord6;
  occupied = nord.snowStorm.nord4;
  active = nord.frost.nord8;
  puck = nord.frost.nord10;

  default = {
    background = nord.polarNight.nord0;
  };

  background = {
    dark = nord.polarNight.nord0;
    light = nord.polarNight.nord3;
  };

  icon = {
    main = nord.frost.nord8;
    error = nord.aurora.nord11;
  };
  text = {
    dark = nord.snowStorm.nord4;
    light = nord.snowStorm.nord6;
    main = nord.snowStorm.nord6;
  };
}
