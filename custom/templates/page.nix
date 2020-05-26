{ lib, ... }:
extraCSS:
page:
let content = ''
  <div id="content">
  <h1>${page.title}</h1>
  ${page.content}
  </div>
'';
in
page // {
  inherit content;
  extraCSS = lib.optionals (page ? extraCSS) page.extraCSS ++ extraCSS;
}
