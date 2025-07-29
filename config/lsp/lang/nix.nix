{
  pkgs,
  lib,
  config,
  self,
  ...
}:
{
  plugins = {
    nix.enable = true;
    hmts.enable = true;
    nix-develop.enable = true;

    conform-nvim.settings = {
      formatters_by_ft = {
        nix = [ "alejandra" ];
      };

      formatters = {
        alejandra.command = lib.getExe pkgs.alejandra;
      };
    };

    lint = {
      lintersByFt = {
        nix = [
          "deadnix"
        ]
        ++ lib.optionals (!config.plugins.lsp.servers.statix.enable) [ "statix" ];
      };

      linters = {
        deadnix.cmd = lib.getExe pkgs.deadnix;
        statix.cmd = lib.getExe pkgs.statix;
      };
    };

    # Config from khanelivim
    lsp.servers.nixd = {
      enable = true;
      settings.settings =
        let
          flake = ''(builtins.getFlake "${self}")'';
          system = ''''${builtins.currentSystem}'';
        in
        {
          nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
          formatting = {
            command = [ "${lib.getExe pkgs.alejandra}" ];
          };
          options = {
            nixvim.expr = ''${flake}.packages.${system}.nvim.options'';
            # NOTE: These will be passed in from outside using `.extend` from the flake installing this package
            # nix-darwin.expr = ''${flake}.darwinConfigurations.khanelimac.options'';
            # nixos.expr = ''${flake}.nixosConfigurations.khanelinix.options'';
            # home-manager.expr = ''${nixos.expr}.home-manager.users.type.getSubOptions [ ]'';
          };
        };
    };
  };
}
