{ stdenv, texlive, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "inf-cat-talk-pdf";
  version = "master";

  src = ./inf-category-equivs;

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf talk.tex
  '';

  installPhase = ''
    mkdir -p $out/talks/
    cp talk.pdf $out/talks/inf-category-equiv-talk.pdf
  '';
}
