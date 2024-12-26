{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];

  imports = [
    ./codeium.nix
    ./debugprint.nix
    ./mini.nix
    ./nvim-surround.nix
    ./compiler.nix
    ./persistence.nix
    ./snacks.nix
    ./wakatime.nix
  ];
}
