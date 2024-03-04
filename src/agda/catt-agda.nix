{ mkDerivation , standard-library, catt-agda }:

mkDerivation {
  pname = "catt-agda-html";
  version = "0.1";

  src = catt-agda.src;

  buildInputs = [ standard-library ];

  buildPhase = ''
    agda --html --html-highlight=auto Everything.agda --css /css/Agda.css
  '';

  installPhase = ''
    mkdir -p $out/catt-agda
    cp html/*.html $out/catt-agda
  '';
}
