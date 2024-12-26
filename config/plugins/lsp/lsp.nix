{
  plugins = {
    lsp-signature.enable = true;

    lsp = {
      enable = true;
      servers.typos_lsp = {
        enable = true;
        settings = {
          init_options = {
            diagnosticSeverity = "Hint";
          };
        };
      };
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
    };
    lint.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
