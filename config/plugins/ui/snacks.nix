{
  plugins.snacks = {
    enable = true;
    terminal = {
      enabled = true;
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
        "t"
      ];
      key = "<leader>tt";
      action = "<CMD>lua Snacks.terminal.toggle(cmd)<cr>";
    }
  ];
}
