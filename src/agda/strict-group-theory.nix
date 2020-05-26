{ mkDerivation , standard-library, groups }:

mkDerivation {
  pname = "strict-group-theory-post";
  version = "2020-5-26";

  src = ./strict-group-theory;

  buildInputs = [ groups standard-library ];

  outputs = [ "out" "html" ];

  buildPhase = ''
    agda --html --html-highlight=auto *.md
  '';

  installPhase = ''
    mkdir -p $out
    mkdir -p $html/posts
    cp html/*.html $html/posts
    cp html/*.md $out
  '';
}
