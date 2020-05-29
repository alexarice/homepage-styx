env:
{ page, ... }:
if page ? title then ''
  <title>${page.title}</title>
'' else ""
