# This file defines overlays
{...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {...});
  };
}
