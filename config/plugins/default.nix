{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldlAttrs;
  inherit (lib.lists) optional;
  by-name = ./.;
in
{
  imports = (
    foldlAttrs (
      prev: name: type:
      prev
      ++ optional (
        type == "regular" && builtins.match ".*\\.nix$" name != null && name != "default.nix"
      ) (by-name + "/${name}")
    ) [ ] (readDir by-name)
  );
}
