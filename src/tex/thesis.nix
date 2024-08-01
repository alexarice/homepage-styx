{ stdenv, texlive, fetchFromGitHub, lib, nerdfonts, makeFontsConf, libfaketime }:

stdenv.mkDerivation {
  pname = "thesis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "thesis";
    rev = "master";
    hash = "sha256-IpJh5BRbQpxupic7bEk2J12cZ6ovdlY9wfK0jTtNG3U=";
  };

  FONTCONFIG_FILE = makeFontsConf {
    fontDirectories = [ (nerdfonts.override { fonts = [ "Hack" ]; }) ];
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
