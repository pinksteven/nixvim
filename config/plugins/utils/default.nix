{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
  plugins.project-nvim.enable = true; # It has built in vim rooter plus it's a nice plugin on it's own.

  imports = [
    ./codeium.nix
    ./debugprint.nix
    ./mini.nix
    ./nvim-surround.nix
    ./compiler.nix
    ./persistence.nix
    ./snacks.nix
    ./wakatime.nix
    ./flash.nix
  ];
}
