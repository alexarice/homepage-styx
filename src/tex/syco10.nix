{ stdenv, texlive, libfaketime }:

stdenv.mkDerivation {
  pname = "syco10-pdf";
  version = "main";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/SYCO-10-talk.git";
    rev = "5d0fd14b0e64be36a91cb92cfcd9d4832dac6d5f";
    ref = "main";
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' latexmk -pdf talk.tex
  '';

  installPhase = ''
    mkdir -p $out/talks/
    cp talk.pdf $out/talks/syco10.pdf
  '';
}
