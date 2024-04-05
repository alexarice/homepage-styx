{ stdenv, texlive, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "thesis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "thesis";
    rev = "master";
    hash = "sha256-W3W9M2+B/Oy8BX2HeCkRkYGWbVJMt4NSIdDwjD9jgBo=";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    xelatex thesis.tex
    biber thesis
    xelatex thesis.tex
    xelatex thesis.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp thesis.pdf $out/pub/
  '';
}
