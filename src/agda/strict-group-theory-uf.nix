{ mkDerivation , cubical, groups-uf, cssFile }:

mkDerivation {
  pname = "strict-group-theory-uf-post";
  version = "2020-5-29";

  src = ./strict-group-theory-uf;

  buildInputs = [ groups-uf cubical ];

  outputs = [ "out" "html" ];

  buildPhase = ''
    agda --html --html-highlight=auto *.md --css /css/Agda.css
  '';

  installPhase = ''
    mkdir -p $out
    mkdir -p $html/posts/sgtuf
    cp html/*.html $html/posts/sgtuf
    cp html/*.md $out
  '';
}
