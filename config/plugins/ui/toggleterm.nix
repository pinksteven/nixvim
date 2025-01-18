{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<C-q>]]";
    };
  };

  keymaps = [
    {
      mode = "t";
      key = "<C-q>";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Open/Close Terminal 2";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Open/Close Terminal";
    }
  ];
}
