{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  pname = "strict-units-pdf";
  version = "master";

  src = builtins.fetchGit {
    url = "ssh://git@github.com/jamievicary/strict_units.git";
    rev = "b15a8f6425d7773fa7713bd2901c9287e0de3ac7";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf arxiv.tex
    cd talk
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub
    mkdir -p $out/talks
    cp arxiv.pdf $out/pub/strict-units.pdf
    cp talk/talk.pdf $out/talks/strict-units.pdf
  '';
}
