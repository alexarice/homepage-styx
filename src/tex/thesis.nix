{ stdenv, texlive, fetchFromGitHub, lib, nerdfonts, makeFontsConf }:

stdenv.mkDerivation {
  pname = "thesis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "thesis";
    rev = "master";
    hash = "sha256-DL078mBGmxKHTnBYG6Y1/9FtTrWTsbrPBnPm8NMh+zA=";
  };

  FONTCONFIG_FILE = makeFontsConf {
    fontDirectories = [ (nerdfonts.override { fonts = [ "Hack" ]; }) ];
  };

  buildInputs = [ texlive.combined.scheme-full ];

  buildPhase = ''
    xelatex thesis.tex
    biber thesis
    xelatex thesis.tex
    xelatex thesis.tex
  '';

  installPhase = ''
    mkdir -p $out/pub
    cp thesis.pdf $out/pub/
  '';
}
