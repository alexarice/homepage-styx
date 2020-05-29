{ mkDerivation, cubical, fetchFromGitHub }:

mkDerivation {
  pname = "groups-uf";
  version = "master";

  buildInputs = [ cubical ];

  src = ../../../../GroupsUF;

  installPhase = ''
    mkdir $out
    cp -r * $out
  '';
  # src = fetchFromGitHub {
  #   owner = "alexarice";
  #   repo = "GroupsUF";
  #   # Change this
  #   rev = "master";
  #   sha256 = "0000000000000000000000000000000000000000000000000000";
  # };
}
