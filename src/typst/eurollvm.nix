{ runCommand, eurollvm }:

runCommand "eurollvm" {} ''
  mkdir -p $out/talks/
  cp ${eurollvm.packages.x86_64-linux.sd-talk} $out/talks/sd-talk.pdf
  cp ${eurollvm.packages.x86_64-linux.constraint} $out/talks/mlir-ops.pdf
''
