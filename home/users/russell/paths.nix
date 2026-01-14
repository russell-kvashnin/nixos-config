{config, ...}: {
  pictures = {
    asciiArts = "${config.home.homeDirectory}/Pictures/ASCIIArts";
    wallpapers = "${config.home.homeDirectory}/Pictures/Wallpapers";
    screenshots = "${config.home.homeDirectory}/Pictures/Screenshots";
  };

  config = "${config.home.homeDirectory}/.config";
}
