{ mkDerivation , standard-library, groups }:

mkDerivation {
  pname = "strict-group-theory-post";
  version = "2020-5-26";

  src = ./strict-group-theory;

  buildInputs = [ groups standard-library."1.3" ];

  outputs = [ "out" "html" ];

  buildPhase = ''
    agda --html --html-highlight=auto *.md --css /css/Agda.css
  '';

  installPhase = ''
    mkdir -p $out
    mkdir -p $html/posts
    cp html/*.html $html/posts
    cp html/*.md $out
  '';
}
