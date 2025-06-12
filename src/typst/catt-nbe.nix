{ runCommand, catt-nbe }:

runCommand "catt-nbe" {} ''
  mkdir -p $out/talks/
  cp ${catt-nbe.packages.x86_64-linux.catt-nbe} $out/talks/catt-nbe.pdf
''
