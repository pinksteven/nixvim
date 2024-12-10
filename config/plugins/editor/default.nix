{
  imports = [
    ./indent-blankline.nix
    ./mini.nix
    ./nvim-colorizer.nix
    ./precognition.nix
    ./rainbow-delimiters.nix
    ./treesitter.nix
    ./ufo.nix
  ];
  plugins = {
    trim.enable = true;
  };
}
