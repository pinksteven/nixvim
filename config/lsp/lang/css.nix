{
  pkgs,
  lib,
  ...
}: {
  # Stolen from Akari :) (great config btw, danke spector)
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft.css = [
        "prettierd"
        "prettier"
      ];

      formatters = {
        prettierd.command = "${pkgs.prettierd}/bin/prettierd";
        prettier.command = "${pkgs.nodePackages.prettier}/bin/prettier";
      };
    };
  };

  lsp.servers = {
    cssls = {
      enable = true;
      settings.cmd = [
        "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server"
        "--stdio"
      ];
    };

    tailwindcss = {
      enable = true;
      settings.cmd = [
        (lib.getExe pkgs.tailwindcss-language-server)
        "--stdio"
      ];
    };
  };
}
