{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default

    ./bar.nix
    ./colors.nix
    ./launcher.nix
    ./lock.nix
    ./notifications.nix
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      accessibility.ui_scale = 1.2;

      shell = {
        font_family = config.theme.fontFamily;
        time_format = "{:%-I:%M %p}";
        avatar_path = "${./samus.png}";
      };

      location.auto_locate = true;

      weather = {
        enabled = true;
        unit = "imperial";
      };

      battery.warning_threshold = 30;

      dock.enabled = false;
    };
  };
}
