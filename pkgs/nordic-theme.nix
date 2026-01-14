{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "nordic-theme";
  version = "git";

  src = fetchFromGitHub {
    owner = "EliverLara";
    repo = "Nordic";
    rev = "v2.2.0";
    hash = "sha256-wTWHdao/1RLqUmqh/9gEyhERGymFWHqiC97JD28LSgk=";
  };

  installPhase = ''
    mkdir -p $out/share/themes/Nordic
    tar -cf - -C $src . | tar -xf - -C $out/share/themes/Nordic
  '';

  dontFixup = true;
  dontCheck = true;
  doInstallCheck = false;
}
