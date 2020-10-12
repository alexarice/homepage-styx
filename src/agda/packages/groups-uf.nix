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
    # Change this
    rev = "master";
    sha256 = "sha256-FCyxfNJTU83ZJaM8s04JszkRRcesualaLvaFnSx67AQ=";
  };
}
