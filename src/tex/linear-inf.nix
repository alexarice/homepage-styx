{ stdenv, texlive, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "linear-inf-pdf";
  version = "preprint";

  src = ./linear-inf;

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf linear-inf
  '';

  installPhase = ''
    mkdir -p $out/pub/
    cp linear-inf.pdf $out/pub
  '';
}
