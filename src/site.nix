/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
{ styx
, agdaPackages-2_6_1
, agdaPackages-2_6_2
, callPackage
, fetchFromGitHub
, extraConf ? {}
, styxLib
, styx-themes
, pkgs
}:

let
  strict-group-theory = agdaPackages-2_6_1.callPackage ./agda/strict-group-theory.nix {
    groups = agdaPackages-2_6_1.callPackage ./agda/packages/groups.nix { };
  };
  strict-group-theory-uf = agdaPackages-2_6_1.callPackage ./agda/strict-group-theory-uf.nix {
    groups-uf = agdaPackages-2_6_1.callPackage ./agda/packages/groups-uf.nix { };
  };
  inverses-agda = agdaPackages-2_6_1.callPackage ./agda/inverses.nix { };
  inverses-pdf = callPackage (import ./tex/inverses.nix) { inherit inverses-agda; };
  linear-inf-pdf = callPackage (import ./tex/linear-inf.nix) { };
  inf-category-equivs-pdf = callPackage (import ./tex/inf-category-equivs.nix) { };
  strict-assoc-pdf = callPackage (import ./tex/strict-assoc.nix) { };
  strict-unit-assoc-pdf = callPackage (import ./tex/strict-unit-assoc.nix) { };
  semistrict-pdf = callPackage (import ./tex/semistrict.nix) { };
  syco10-pdf = callPackage (import ./tex/syco10.nix) { };
  strict-units-pdf = callPackage (import ./tex/strict-units.nix) { };
  syllepsis = agdaPackages-2_6_2.callPackage (import ./agda/syllepsis.nix) { };
  inherit (builtins) readFile;
in rec {

  themes = [
    styx-themes.generic-templates
    ../custom
  ];

  /* Loading the themes data
  */
  themesData = styxLib.themes.load {
    inherit styxLib themes;
    extraEnv = { inherit data pages; };
    extraConf = [ ./conf.nix extraConf ];
  };

  inherit (themesData) lib conf files templates env;

  data = {
    homepage = lib.loadFile { file = ./index.md; inherit env; };

    strict-group-theory-post = lib.loadFile {
      file = "${strict-group-theory}/strict-group-theory.md";
      inherit env;
    };
    strict-group-theory-uf-post = lib.loadDir {
      dir = "${strict-group-theory-uf}";
      asAttrs = true;
      inherit env;
    };

    syllepsis-post = lib.loadFile {
      file = "${syllepsis}/Syllepsis.md";
      inherit env;
    };
  };


  pages = rec {
    index = {
      path = "/index.html";
      title = "Alex Rice";
      template = templates.indexTemplate;
      layout = templates.layout;
    } // data.homepage;
    strict-group-theory = {
      path = "/posts/strict-group-theory.html";
      title = "Strictly Associative Group Theory in Agda";
      template = templates.agdaPostLayout;
      layout = templates.layout;
    } // data.strict-group-theory-post;
    syllepsis = {
      path = "/posts/Syllepsis.html";
      title = "The Kavvos-Sojakova Proof of Syllepsis in Agda";
      template = templates.agdaPostLayout;
      layout = templates.layout;
    } // data.syllepsis-post;
    syllepsis-alias = {
      path = "/posts/syllepsis.html";
      redirect-url = "Syllepsis.html";
      layout = lib.id;
      template = templates.redirect;
    };
  };

  agdaToPages = basePath: pages: map (x: x // { path = "${basePath}/${x.fileData.basename}.html"; }) (lib.pagesToList {
    inherit pages;
    default.template = templates.agdaPostLayout;
    default.layout = templates.layout;
  });

  strict-group-theory-uf-pages = agdaToPages "/posts/sgtuf" data.strict-group-theory-uf-post;

  /* Converting the pages attribute set to a list
  */
  pageList = lib.pagesToList { inherit pages; } ++ strict-group-theory-uf-pages;

  fileList = files ++ [
    ./static
    strict-group-theory.html
    strict-group-theory-uf.html
    inverses-agda
    inverses-pdf
    linear-inf-pdf
    inf-category-equivs-pdf
    strict-assoc-pdf
    semistrict-pdf
    syco10-pdf
    strict-units-pdf
    strict-unit-assoc-pdf
  ];

  /* Generating the site
  */
  site = lib.mkSite {
    inherit pageList;
    files = fileList;
  };

}
