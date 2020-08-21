{ stdenv, texlive, inverses-agda }:

stdenv.mkDerivation {
  pname = "inverses-pdf";

  inherit (inverses-agda) src version;

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf inverses.tex
    cd talk
    latexmk -pdf inverses_talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub
    mkdir -p $out/talks
    cp inverses.pdf $out/pub/
    cp talk/inverses_talk.pdf $out/talks/inverses.pdf
  '';
}
