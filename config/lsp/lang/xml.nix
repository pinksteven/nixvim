{pkgs, ...}: {
  lsp.servers.lemminx.enable = true;
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        xml = ["xmllint"];
        xsd = ["xmllint"];
        dtd = ["xmllint"];
        xslt = ["xmllint"];
      };
      formatters.xmllint = {
        cmd = "${pkgs.libxml2}/bin/xmllint";
      };
    };
  };
}
