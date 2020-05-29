{ lib, ... }:
extraCSS:
page:
let
  title = if page ? title then page.title else page.fileData.basename;
  content = ''
    <div id="content">
    <h1>${title}</h1>
    ${page.content}
    </div>
  '';
in
page // {
  inherit content title;
  extraCSS = lib.optionals (page ? extraCSS) page.extraCSS ++ extraCSS;
}
