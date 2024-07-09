{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-unit-assoc-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "git@github.com:alexarice/strict-unit-assoc.git";
    rev = "9839293a4157f66d684cab2db51b2e36d031ba4f";
    ref = "master";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    export HOME=$(pwd)
    latexmk -pdf arxiv.tex
    cd talk
    latexmk -pdf talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub
    mkdir -p $out/talks
    cp arxiv.pdf $out/pub/sua.pdf
    cp talk/talk.pdf $out/talks/sua.pdf
  '';
}
