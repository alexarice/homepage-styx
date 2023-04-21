{ mkDerivation, cubical, fetchFromGitHub, texlive }:

mkDerivation {
  pname = "groups-uf";
  version = "master";

  buildInputs = [ cubical texlive.combined.scheme-full ];

  outputs = [ "out" "latex" ];

  postBuild = ''
    agda talk.lagda.tex --latex --count-clusters
    cd latex
    pdflatex talk.tex
    pdflatex talk.tex
    cd ..
  '';

  installPhase = ''
    mkdir $out
    cp -r * $out
    mkdir -p $latex/talks
    cp latex/talk.pdf $latex/talks/sgtuf.pdf
  '';

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "GroupsUF";
    rev = "352177a9c98659f6dd79b700d952757615465393";
    sha256 = "sha256-a3K0udXk8EE+oRpUhh3z/ScV5OIAZLFj0QHvWZnTjg8=";
  };
}
