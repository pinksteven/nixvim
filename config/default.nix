{
  nixpkgs.config.allowUnfree = true;
  viAlias = true;
  vimAlias = true;
  enableMan = false;

  dependencies = {
    ripgrep.enable = true;
    lazygit.enable = true;
  };

  imports = [
    ./settings.nix
    ./autocmd.nix
    ./diagnostics.nix
    ./filetypes.nix
    ./performance.nix
    ./usercommands.nix
    ./lsp
    ./keymaps
    ./plugins
    ./theme
  ];
}
