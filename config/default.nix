{ pkgs, lib, ... }:

{
  imports = [
    ./settings.nix
    ./autocmd.nix
    ./keymaps.nix
    ./config.nix
    ./plugins
  ];

  options = {
    theme = {
      colors = {
        base00 = lib.mkOption {
          default = "#191724";
          type = lib.types.nonEmptyStr;
        };
        base01 = lib.mkOption {
          default = "#1f1d2e";
          type = lib.types.nonEmptyStr;
        };
        base02 = lib.mkOption {
          default = "#26233a";
          type = lib.types.nonEmptyStr;
        };
        base03 = lib.mkOption {
          default = "#6e6a86";
          type = lib.types.nonEmptyStr;
        };
        base04 = lib.mkOption {
          default = "#908caa";
          type = lib.types.nonEmptyStr;
        };
        base05 = lib.mkOption {
          default = "#e0def4";
          type = lib.types.nonEmptyStr;
        };
        base06 = lib.mkOption {
          default = "#e0def4";
          type = lib.types.nonEmptyStr;
        };
        base07 = lib.mkOption {
          default = "#524f67";
          type = lib.types.nonEmptyStr;
        };
        base08 = lib.mkOption {
          default = "#eb6f92";
          type = lib.types.nonEmptyStr;
        };
        base09 = lib.mkOption {
          default = "#f6c177";
          type = lib.types.nonEmptyStr;
        };
        base0A = lib.mkOption {
          default = "#ebbcba";
          type = lib.types.nonEmptyStr;
        };
        base0B = lib.mkOption {
          default = "#31748f";
          type = lib.types.nonEmptyStr;
        };
        base0C = lib.mkOption {
          default = "#9ccfd8";
          type = lib.types.nonEmptyStr;
        };
        base0D = lib.mkOption {
          default = "#c4a7e7";
          type = lib.types.nonEmptyStr;
        };
        base0E = lib.mkOption {
          default = "#f6c177";
          type = lib.types.nonEmptyStr;
        };
        base0F = lib.mkOption {
          default = "#524f67";
          type = lib.types.nonEmptyStr;
        };
      };
      transparency = {
        main = lib.mkOption {
          default = false;
          type = lib.types.bool;
        };
        signColumn = lib.mkOption {
          default = false;
          type = lib.types.bool;
        };
      };
    };
    flake = lib.mkOption {
      default = "~/.config/nixos/flake.nix";
      type = lib.types.nonEmptyStr;
    };
  };
}
