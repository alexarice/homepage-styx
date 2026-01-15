{ runCommand, planqc }:

runCommand "mutable-poster" {} ''
  mkdir -p $out/poster/
  cp ${planqc.packages.x86_64-linux.poster} $out/poster/mutable.pdf
''
