{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "strict-assoc-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/alexarice/strict-assoc.git";
    rev = "15a4206cfb6cbd935e417f7b3d49cbf82b290f4a";
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
