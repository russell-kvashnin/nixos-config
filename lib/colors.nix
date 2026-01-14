# Color utils
{...}: let
  decToHexMap = [
    "0"
    "1"
    "2"
    "3"
    "4"
    "5"
    "6"
    "7"
    "8"
    "9"
    "A"
    "B"
    "C"
    "D"
    "E"
    "F"
  ];

  hexToDecMap = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "A" = 10;
    "B" = 11;
    "C" = 12;
    "D" = 13;
    "E" = 14;
    "F" = 15;
    "a" = 10;
    "b" = 11;
    "c" = 12;
    "d" = 13;
    "e" = 14;
    "f" = 15;
  };

  decToHex = dec: let
    firstIndex = dec / 16;
    firstDigit = builtins.elemAt decToHexMap firstIndex;
    remainder = dec - (firstIndex * 16);
    secondDigit = builtins.elemAt decToHexMap remainder;
  in
    firstDigit + secondDigit;

  withAlpha = hex: alpha: let
    alphaInt = builtins.floor (alpha * 255);
    alphaHex = decToHex alphaInt;
  in "${hex}${alphaHex}";

  hexToRgb = hex: let
    clean = builtins.replaceStrings ["#"] [""] hex;
    full =
      if builtins.stringLength clean == 3
      then builtins.concatStringsSep (map (c: c + c) (builtins.split "" clean))
      else clean;

    hexDigit = c: hexToDecMap.${c};

    hexPair = s:
      (hexDigit (builtins.substring 0 1 s))
      * 16
      + (hexDigit (builtins.substring 1 1 s));

    r = hexPair (builtins.substring 0 2 full);
    g = hexPair (builtins.substring 2 2 full);
    b = hexPair (builtins.substring 4 2 full);
  in "rgb(${toString r}, ${toString g}, ${toString b})";

  hexToHyprRgba = hex: alpha: let
    clean = builtins.replaceStrings ["#"] [""] hex;
    alphaHex = decToHex (builtins.floor (alpha * 255));
  in "rgba(${clean}${alphaHex})";
in {
  inherit withAlpha hexToRgb hexToHyprRgba;
}
