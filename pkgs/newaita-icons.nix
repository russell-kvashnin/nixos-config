{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "newaita-icons";
  version = "git";

  src = fetchFromGitHub {
    owner = "cbrnix";
    repo = "Newaita-reborn";
    rev = "5b19f46a4ca918585038547b27810502a5997401";
    hash = "sha256-nA0l+xH9BlxID0lsXkojKvQRZgkJulSWsRinDre0oW8=";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/* $out/share/icons/
  '';

  dontFixup = true;
  dontCheck = true;
  doInstallCheck = false;
}
