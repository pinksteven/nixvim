{ mkPkgs, inputs, ... }:
{
  extraPlugins = [
    (mkPkgs "yuck.vim" inputs.yuck_vim)
  ];
  plugins = {
    parinfer-rust.enable = true;
  };
}
