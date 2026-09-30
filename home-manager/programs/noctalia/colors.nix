{
  config,
  lib,
  ...
}: let
  capitalize = s: lib.toUpper (builtins.substring 0 1 s) + builtins.substring 1 (-1) s;
  toPaletteKey = role: "m" + lib.concatMapStrings capitalize (lib.splitString "_" role);

  roles = lib.mapAttrs' (role: lib.nameValuePair (toPaletteKey role)) (import ./palette.nix config.theme.colors);
in {
  programs.noctalia = {
    customPalettes.${config.theme.name} = {
      dark = roles;
      light = roles;
    };

    settings.theme = {
      mode =
        if config.theme.dark
        then "dark"
        else "light";
      source = "custom";
      custom_palette = config.theme.name;
    };
  };
}
