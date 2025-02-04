{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
        winblend = 4;
      };
    };
  };

  keymaps = [
    {
      mode = "t";
      key = "<C-x>";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Open/Close Terminal";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Open/Close Terminal";
    }
  ];
}
