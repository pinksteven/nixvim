{ lib, ... }:
{
  # This is for stylix to be able to inject colors
  colorscheme = lib.mkForce null;
  plugins.mini = {
    enable = true;
    modules.base16.enable = true;
  };
}
