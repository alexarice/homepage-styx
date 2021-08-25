{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-assoc-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/alexarice/strict-assoc.git";
    rev = "9003f87a5010bc1eebbdd3cf3163b797a73cadba";
  };


  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf strict-assoc.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp strict-assoc.pdf $out/pub
  '';
}
