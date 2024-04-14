{ stdenv, texlive, fetchFromGitHub, lib, nerdfonts, makeFontsConf }:

stdenv.mkDerivation {
  pname = "thesis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "thesis";
    rev = "master";
    hash = "sha256-Jd5IW9W+AE2AEh57LZ9QA/L6qxrCAhTCTU8n/fDZw3I=";
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
