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
  ];

  plugins = {
    neoscroll.enable = true;
    dressing.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
  };
}
