{ pkgs, ... }:
{
  enableMan = false;
  extraPackages = with pkgs; [
    ripgrep
    lazygit
  ];
}
