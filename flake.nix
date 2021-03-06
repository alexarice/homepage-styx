{
  description = "Homepage flake";

  inputs = {
    all-agda.url = "github:alexarice/all-agda";
    styx.url = "github:alexarice/styx/flakes";
    styx.inputs.nixpkgs.follows = "nixpkgsold";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgsold.url = "github:nixos/nixpkgs/8c5d37129fc5097d9fb52e95fb07de75392d1c3c";
  };

  outputs = { self, nixpkgs, all-agda, styx, flake-utils, nixpkgsold }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            inherit (nixpkgsold.legacyPackages."${system}") multimarkdown;
          })
        ];
      };
    in rec {

      packages.site = (pkgs.callPackage (import ./src/site.nix) {
        agdaPackages = all-agda.legacyPackages."x86_64-linux".agdaPackages-2_6_1;
        styx = styx.defaultPackage."x86_64-linux";
        styxLib = styx.lib.x86_64-linux;
        styx-themes = styx.themes.x86_64-linux;

      }).site;

      defaultPackage = packages.site;

    }
  );
}
