{ runCommand, popl-talk }:

runCommand "phase-talk" {} ''
  mkdir -p $out/talks/
  cp ${popl-talk.packages.x86_64-linux.phase} $out/talks/phase.pdf
''
