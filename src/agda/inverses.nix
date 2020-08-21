{ mkDerivation , standard-library, fetchFromGitHub }:

mkDerivation rec {
  pname = "inverses-agda";
  version = "02fd0fd1f85b18a45a3ff91d5a096f572756e0ff";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "Inverses";
    rev = version;
    sha256 = "1kzw4g27rw8v9kj6307v67lx92ry36kx09v7qask4xgi59qm7dbd";
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
