{ mkDerivation, fetchFromGitHub }:

mkDerivation rec {
  pname = "syllepsis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "Syllepsis";
    rev = "65e56d41256089ae73b5bb84312717733b0b6bfa";
    hash = "sha256-FK2NAbvt2lSpXHq2ifgixWr84ek3pLUrF+QsgCAjT94=";
  };

  LC_ALL = "en_GB.UTF-8";

  outputs = [ "out" "html" ];

  buildPhase = ''
    agda --html --html-highlight=auto *.md --css /css/Agda.css
  '';

  installPhase = ''
    mkdir -p $out
    mkdir -p $html/posts/syllepsis
    cp html/*.html $html/posts/syllepsis
    cp html/*.md $out
  '';
}
