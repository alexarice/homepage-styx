#!/bin/sh

path=$(nix build --json --no-link --print-build-logs | jq -r .[0].outputs.out)

if [ "$path" == "" ]; then
    echo "Nix failed"
    exit 1
fi
rm -r ./alexarice.github.io/*
cp -L -r $path/* ./alexarice.github.io
chmod u+rw -R ./alexarice.github.io/*
