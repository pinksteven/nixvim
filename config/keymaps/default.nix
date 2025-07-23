{
  globals.mapleader = " ";

  plugins.mini = {
    enabled = true;
    modules.bracketed.enable = true;
  };

  imports = [
    ./windows.nix
  ];
}
