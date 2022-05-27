{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-units-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/jamievicary/strict_units.git";
    rev = "4e27bdd3264fcd8cb246ab8616785e1919ca707d";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf arxiv.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp arxiv.pdf $out/pub/strict-units.pdf
  '';
}
