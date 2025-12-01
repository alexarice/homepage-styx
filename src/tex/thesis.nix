{ stdenv, texlive, fetchFromGitHub, lib, nerd-fonts, makeFontsConf, libfaketime }:

stdenv.mkDerivation {
  pname = "thesis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "thesis";
    rev = "5d2e6154e92b60d0db9a29f4be8451a386301677";
    hash = "sha256-GzOH4h1e0VQ9ky05HB63vP97pR83DzOa93netq+WZs4=";
  };

  FONTCONFIG_FILE = makeFontsConf {
    fontDirectories = [ nerd-fonts.hack ];
  };

  buildInputs = [ texlive.combined.scheme-full libfaketime ];

  buildPhase = ''
    faketime -f '@1980-01-01 00:00:00 x0.001' xelatex thesis.tex
    faketime -f '@1980-01-01 00:00:00 x0.001' biber thesis
    faketime -f '@1980-01-01 00:00:00 x0.001' xelatex thesis.tex
    faketime -f '@1980-01-01 00:00:00 x0.001' xelatex thesis.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp thesis.pdf $out/pub/
  '';
}
