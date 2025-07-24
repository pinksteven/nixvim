{
  plugins = {
    snacks = {
      enable = true;

      settings = {
        bigfile.enabled = true;
        gitbrowse.enabled = true;
        scroll.enabled = true;
        scope.enabled = true;
        words.enabled = true;
        bufdelete.enabled = true;
        statuscolumn.enabled = true;
        lazygit = {
          enabled = true;
          win.border = "rounded";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options = {
        desc = "Open file in browser";
      };
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options = {
        desc = "Open lazygit";
      };
    }
  ];
}
