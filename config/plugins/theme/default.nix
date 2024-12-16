{
  lib,
  config,
  ...
}:
let
  colorscheme = config.theme.colors;
in
{
  colorschemes.base16 = {
    enable = true;
    inherit colorscheme;
    setUpBar = true;
  };
  highlight =
    let
      transparent = {
        bg = "none";
        ctermbg = "none";
      };
    in
    {
      Normal = lib.mkIf config.theme.transparency.main transparent;
      NonText = lib.mkIf config.theme.transparency.main transparent;
      SignColumn = lib.mkIf config.theme.transparency.signColumn transparent;
    };
}
