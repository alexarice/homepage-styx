{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-unit-assoc-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "git@github.com:alexarice/strict-unit-assoc.git";
    rev = "14c5d3136dd891244a29c5142ad8c255e2e3c109";
    ref = "master";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf arxiv.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp arxiv.pdf $out/pub/strict-unit-assoc.pdf
  '';
}
