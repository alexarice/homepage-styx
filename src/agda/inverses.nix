{ mkDerivation , standard-library, fetchFromGitHub }:

mkDerivation rec {
  pname = "inverses-agda";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "Inverses";
    rev = "arxiv-v${version}";
    sha256 = "0p5r3gafaxwhq303hkns5sanvglkq0qcn7j1wc8ly2by2idzqbda";
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
