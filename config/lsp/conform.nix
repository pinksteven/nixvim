{ pkgs, lib, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts = {
        timeout_ms = 3000;
        quiet = false;
        lsp_format = "fallback";
      };
      format_on_save = {
        lspFallback = true;
        timeoutMs = 3000;
      };
      formatters_by_ft = {
        # Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
        "lua" = [ "stylua" ];
        "sh" = [ "shfmt" ];
      };
      formatters = {
        _ = {
          command = "${pkgs.gawk}/bin/gawk";
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
