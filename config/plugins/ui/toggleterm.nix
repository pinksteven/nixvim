{
  plugins.toggleterm = {
    enable = true;
    settings = {
      # open_mapping = "[[<C-q>]]";
      direction = "float";
    };
  };

  keymaps = [
    {
      mode = "t";
      key = "<C-q>";
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
