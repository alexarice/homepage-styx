{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  pname = "strict-assoc-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/alexarice/strict-assoc.git";
    rev = "67dc9305332024755c67eb4d0b19a1d79fd1676c";
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf strict-assoc.tex
    cd talk
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub
    mkdir -p $out/talks
    cp strict-assoc.pdf $out/pub
    cp talk/talk.pdf $out/talks/strict-assoc.pdf
  '';
}
