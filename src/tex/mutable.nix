{ stdenv, texlive, libfaketime, planqc }:

stdenv.mkDerivation {
  name = "mutable-abstract";

  src = planqc;

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf mutable.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp mutable.pdf $out/pub/mutable.pdf
  '';
}
