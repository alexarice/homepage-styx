{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  pname = "dynamic-gate-pdf";
  version = "master";

  src = fetchGit {
    url = "git@github.com:alexarice/dyn-gate-paper.git";
    rev = "22cdffcf52fe04d2359e74e69efb9a3c2e51efae";
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
