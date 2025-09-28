{
  lib,
  pkgs,
  ...
}: {
  lsp.servers.pyright.enable = true;
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        python = [
          "isort"
          "ruff"
        ];
      };
      formatters = {
        isort = {
          command = lib.getExe pkgs.isort;
        };
        ruff = {
          command = lib.getExe pkgs.ruff;
        };
      };
    };
    dap-python.enable = true;
  };
}
