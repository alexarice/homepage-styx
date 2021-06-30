{ mkDerivation, cubical, fetchFromGitHub }:

mkDerivation {
  pname = "groups-uf";
  version = "master";

  buildInputs = [ cubical ];

  installPhase = ''
    mkdir $out
    cp -r * $out
  '';

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "GroupsUF";
    rev = "451e85462658d4daeeccf041f7a369fb0101acd9";
    sha256 = "sha256-FCyxfNJTU83ZJaM8s04JszkRRcesualaLvaFnSx67AQ=";
  };
}
