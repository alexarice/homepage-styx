{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-units-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/jamievicary/strict_units.git";
    rev = "eefedfab3a7a79c36d91d9d504df3e278d789e43";
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
