{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "semistrict-pdf";
  version = "master";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/semistrict-talk.git";
    rev = "cd199158037305a965dd8c201af711a200cf3d4d";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf talk.tex
  '';

  installPhase = ''
    mkdir -p $out/talks/
    cp talk.pdf $out/talks/semistrict.pdf
  '';
}
