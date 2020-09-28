{ mkDerivation , standard-library, fetchFromGitHub }:

mkDerivation rec {
  pname = "inverses-agda";
  version = "0.2";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "Inverses";
    rev = "arxiv-v${version}";
    sha256 = "0gpq6k8hc2zr3lwni8fihhjhlp8vfdv0bifi0ivpvs4jxbdr4yc3";
    fetchSubmodules = true;
  };

  buildInputs = [ standard-library ];

  buildPhase = ''
    agda --html --html-highlight=auto Everything.agda --css /css/Agda.css
  '';

  installPhase = ''
    mkdir -p $out/pub/inverses
    cp html/*.html $out/pub/inverses
  '';
}
