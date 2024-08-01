{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  pname = "inf-cat-talk-pdf";
  version = "master";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/inf-category-equivs.git";
    rev = "a6b8775326e8bd4cfff5ee714d26eb3743a7817b";
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf talk.tex
  '';

  installPhase = ''
    mkdir -p $out/talks/
    cp talk.pdf $out/talks/inf-category-equiv-talk.pdf
  '';
}
