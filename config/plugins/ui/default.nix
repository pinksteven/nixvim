{
  imports = [
    ./lualine.nix
    ./neo-tree.nix
    ./yazi.nix
    ./noice.nix
    ./bufferline.nix
    ./toggleterm.nix
    ./notify.nix
    ./whichkey.nix
    ./undotree.nix
    ./startup.nix
    ./snacks.nix
  ];

  plugins = {
    dressing.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
  };
}
