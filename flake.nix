{
  description = "Homepage flake";

  inputs = {
    all-agda.url = "github:alexarice/all-agda";
    styx.url = "/home/alex/styx";
  };

  outputs = { self, nixpkgs, all-agda, styx }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {

    packages.x86_64-linux.site = (pkgs.callPackage (import ./src/site.nix) {
      agdaPackages = all-agda.legacyPackages."x86_64-linux".agdaPackages-2_6_1;
      styx = styx.defaultPackage."x86_64-linux";
      styxLib = styx.lib.x86_64-linux;
      styx-themes = styx.themes.x86_64-linux;
    }).site;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.site;

  };
}
