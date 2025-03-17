{ stdenv, texlive, fetchFromGitHub, lib, nerd-fonts, makeFontsConf, libfaketime }:

stdenv.mkDerivation {
  pname = "thesis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "thesis";
    rev = "48d4528a17da592610d10002eefe570a4d12aab2";
    hash = "sha256-ixJkqacxXNhriNNl+zm1gC7cfvAj8fxyeja7X2tKbUE=";
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
