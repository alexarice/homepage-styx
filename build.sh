#!/bin/sh

path=$(nix build --json --no-link | jq -r .[0].outputs.out)

if [ $? -ne 0 ]; then
    echo "Nix failed"
fi

rm -rf ./src/public/*
cp -L -r $path/* ./src/public
chmod u+rw -R ./src/public/*
