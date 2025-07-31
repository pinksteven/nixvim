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
      enable = true;
      standalonePlugins = with pkgs.vimPlugins; [
        "firenvim"
        "neotest"
        "nvim-treesitter"
        mini-nvim
        overseer-nvim
        vs-tasks-nvim
      ];
    };
  };
}
