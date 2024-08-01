{ stdenv, texlive, inverses-agda, libfaketime }:

stdenv.mkDerivation {
  pname = "inverses-pdf";

  inherit (inverses-agda) src version;

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf inverses.tex
    cd talk
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf inverses_talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub
    mkdir -p $out/talks
    cp inverses.pdf $out/pub/
    cp talk/inverses_talk.pdf $out/talks/inverses.pdf
  '';
}
