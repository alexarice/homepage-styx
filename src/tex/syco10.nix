{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "syco10-pdf";
  version = "main";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/SYCO-10-talk.git";
    rev = "4823139965439049ffe096e4406b8ac61167d2bb";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf talk.tex
  '';

  installPhase = ''
    mkdir -p $out/talks/
    cp talk.pdf $out/talks/syco10.pdf
  '';
}
