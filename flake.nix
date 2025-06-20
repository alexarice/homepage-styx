{
  description = "Homepage flake";

  inputs = {
    all-agda.url = "github:alexarice/all-agda";
    styx.url = "github:alexarice/styx/flakes";
    styx.inputs.nixpkgs.follows = "nixpkgsold";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgsold.url = "github:nixos/nixpkgs/8c5d37129fc5097d9fb52e95fb07de75392d1c3c";
    catt-agda = {
      url = "github:alexarice/catt-agda";
      inputs = {
        all-agda.follows = "all-agda";
        flake-utils.follows = "flake-utils";
      };
    };
    eurollvm.url = "git+ssh://git@github.com/alexarice/eurollvm";
    catt-nbe.url = "git+ssh://git@github.com/alexarice/catt-nbe";
  };

  outputs = { self, nixpkgs, all-agda, styx, flake-utils, nixpkgsold, catt-agda, eurollvm, catt-nbe }:
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
        agdaPackages-2_6_1 = all-agda.legacyPackages."x86_64-linux".agdaPackages-2_6_1;
        agdaPackages-2_6_4 = all-agda.legacyPackages."x86_64-linux".agdaPackages-2_6_4.overrideScope (self: super: {
          catt-agda = catt-agda.packages.${system}.catt-agda;
        });
        inherit eurollvm catt-nbe;
        styx = styx.defaultPackage."x86_64-linux";
        styxLib = styx.lib.x86_64-linux;
        styx-themes = styx.themes.x86_64-linux;
      }).site;

      defaultPackage = packages.site;
    }
  );
}
