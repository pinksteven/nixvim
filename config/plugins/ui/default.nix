{
  imports = [
    ./lualine.nix
    ./neo-tree.nix
    ./yazi.nix
    ./noice.nix
    ./bufferline.nix
    ./notify.nix
    ./whichkey.nix
    ./undotree.nix
    ./startup.nix
    ./toggleterm.nix
  ];

  plugins = {
    dressing.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
  };
}
