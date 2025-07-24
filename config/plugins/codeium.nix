{
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    codeium-nvim = {
      enable = true;
      package = pkgs.vimPlugins.windsurf-nvim;

      settings = {
        enable_chat = true;

        tools = {
          curl = lib.getExe pkgs.curl;
          gzip = lib.getExe pkgs.gzip;
          uname = lib.getExe' pkgs.coreutils "uname";
          uuidgen = lib.getExe' pkgs.util-linux "uuidgen";
        };
      };
    };
    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>Cc";
        mode = "n";
        group = "+codeium";
      }
    ];
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-C>";
      action = "<cmd>Codeium Chat<CR>";
      options = {
        desc = "Codeium Chat";
      };
    }
  ];
}
