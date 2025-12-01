{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  pname = "dynamic-gate-pdf";
  version = "master";

  src = fetchGit {
    url = "git@github.com:alexarice/dyn-gate-paper.git";
    rev = "52e9819c86d3df646332ca94eca37e5d6be5b413";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    DIR=$(mktemp -d)
    cp ${./config} $DIR/.latexminted_config
    HOME=$DIR faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf submission.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp submission.pdf $out/pub/dyn-gate.pdf
  '';
}
