#!/bin/sh

path=$(nix build --json --no-link | jq -r .[0].outputs.out)

if [ $? -ne 0 ]; then
    echo "Nix failed"
fi

rm -r ./alexarice.github.io/*
cp -L -r $path/* ./alexarice.github.io
chmod u+rw -R ./alexarice.github.io/*
