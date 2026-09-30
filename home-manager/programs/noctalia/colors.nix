{
  config,
  lib,
  ...
}: let
  c = config.theme.colors;
  capitalize = s: lib.toUpper (builtins.substring 0 1 s) + builtins.substring 1 (-1) s;
  toPaletteKey = role: "m" + lib.concatMapStrings capitalize (lib.splitString "_" role);

  roles = lib.mapAttrs' (role: lib.nameValuePair (toPaletteKey role)) (import ./palette.nix c);
  palette =
    roles
    // {
      terminal = {
        normal = {
          inherit (c) black red green yellow blue;
          magenta = c.purple;
          cyan = c.aqua;
          white = c.gray;
        };
        bright = {
          black = c.grayBright;
          red = c.redBright;
          green = c.greenBright;
          yellow = c.yellowBright;
          blue = c.blueBright;
          magenta = c.purpleBright;
          cyan = c.aquaBright;
          white = c.fgBright;
        };
        foreground = c.fg;
        background = c.bg;
        cursor = c.fg;
        cursorText = c.bg;
        selectionFg = c.bg;
        selectionBg = c.fg;
      };
    };
in {
  programs.noctalia = {
    customPalettes.${config.theme.name} = {
      dark = palette;
      light = palette;
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
