{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  name = "phase-pdf";

  src = fetchGit {
    url = "git@github.com:chrisheunen/itsjustaphase.git";
    rev = "89c7be9e0a944cadc97a9ffd5a2fc215a29d3748";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf itsjustaphase.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp itsjustaphase.pdf $out/pub/phase.pdf
  '';
}
