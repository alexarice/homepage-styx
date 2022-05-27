{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "semistrict-pdf";
  version = "master";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/semistrict-talk.git";
    rev = "07b4e911a8d7c1db5acfbdb2e334209dd0f79c66";
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
