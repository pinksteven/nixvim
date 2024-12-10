{
  plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";
      start_in_insert = true;
      open_mapping = "[[<C-/>]]";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Open Terminal";
      };
    }
    {
      mode = "t";
      key = "<C-q>";
      action = "<cmd>2ToggleTerm<cr>";
      options.desc = "Quit Terminal";
    }
  ];
}
