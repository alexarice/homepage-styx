/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
{ styx
, agdaPackages
, extraConf ? {}
}:

let
  strict-group-theory = agdaPackages.callPackage ./agda/strict-group-theory.nix {
    groups = agdaPackages.callPackage ./agda/packages/groups.nix { };
  };
  strict-group-theory-uf = agdaPackages.callPackage ./agda/strict-group-theory-uf.nix {
    groups-uf = agdaPackages.callPackage ./agda/packages/groups-uf.nix { };
    cssFile = ./static/posts/Agda.css;
  };
in rec {

  /* Importing styx library
  */
  styxLib = import styx.lib styx;


  /* Importing styx themes from styx
  */
  styx-themes = import styx.themes;


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

  inherit (themesData) conf lib files templates env;

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

  fileList = files ++ [ ./static (strict-group-theory.html) (strict-group-theory-uf.html) ];

  /* Generating the site
  */
  site = lib.mkSite {
    inherit pageList;
    files = fileList;
  };

}
