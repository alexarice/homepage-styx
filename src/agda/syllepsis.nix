{ mkDerivation, fetchFromGitHub }:

mkDerivation rec {
  pname = "syllepsis";
  version = "master";

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "Syllepsis";
    rev = "c8f6fad84351ff8ada623d053947afc2a6224be3";
    hash = "sha256-nY5eLG4OTxS13QePd12iyIBIdyV4zn4CZJXnxxu/Zf8=";
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
