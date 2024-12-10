{ pkgs, ... }:

{
  enableMan = false;
  imports = [
    ./settings.nix
    ./autocmd.nix
    ./keymaps.nix
    ./plugins
  ];

  extraPackages = with pkgs; [
    ripgrep
    lazygit
  ];
}
