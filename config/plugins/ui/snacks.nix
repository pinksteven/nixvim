{
  plugins.snacks = {
    enable = true;
    settings.terminal = {
      enabled = true;
      win = {
        position = "float";
        border = "rounded";
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>tt";
      action = "<cmd>lua Snacks.terminal()<cr>";
      options = {
        desc = "Open terminal";
      };
    }
    {
      mode = "t";
      key = "<C-q>";
      action = "<cmd>lua Snacks.terminal()<cr>";
      options = {
        desc = "Open terminal";
      };
    }
  ];
}
