{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-units-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/jamievicary/strict_units.git";
    rev = "c152f6a558e7178ff2af7744b9c20693b5d07c38";
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
