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
    rev = "99a10fc05a7706504fbac6849809387caa625c53";
    sha256 = "sha256-SXcXoGnInMgS/l8JKFEkuSDwbHD97wiZHurMBjaI+Vc=";
  };
}
