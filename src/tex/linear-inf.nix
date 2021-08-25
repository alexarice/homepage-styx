{ stdenv, texlive }:

stdenv.mkDerivation {
  pname = "linear-inf-pdf";
  version = "preprint";

  src = fetchGit {
    url = "ssh://git@github.com/alexarice/linear-inference-7.git";
    rev = "29416b5bfd122b1cc8e92ea78e7bc1ff5853f8ca";
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    latexmk -pdf linear-inf
    cd talk
    latexmk -pdf talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir -p $out/pub/
    mkdir -p $out/talks/
    cp linear-inf.pdf $out/pub
    cp talk/talk.pdf $out/talks/linear-inf-talk.pdf
  '';
}
