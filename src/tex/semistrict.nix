{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "semistrict-pdf";
  version = "master";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/semistrict-talk.git";
    rev = "d243b429af9dd36f16a579f0fdcad2434d39537a";
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
