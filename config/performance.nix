# # This entire file is from khanelivim
{ pkgs, ... }:
{
  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };
    combinePlugins = {
      enable = false; # It breaks for me i'll debug someday maybe
      standalonePlugins = with pkgs.vimPlugins; [
        firenvim
        neotest
        nvim-treesitter
        mini-nvim
        overseer-nvim
        vs-tasks-nvim
      ];
    };
  };
}
