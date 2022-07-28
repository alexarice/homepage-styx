{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-units-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/jamievicary/strict_units.git";
    rev = "4289c26380e1d0266af5bc1b7b7cde6b7729be6e";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf arxiv.tex
    cd talk
    latexmk -pdf talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub
    mkdir -p $out/talks
    cp arxiv.pdf $out/pub/strict-units.pdf
    cp talk/talk.pdf $out/talks/strict-units.pdf
  '';
}
