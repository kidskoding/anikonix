{...}: {
  services.hypridle = {
    enable = true;
    settings.general = {
      lock_cmd = "noctalia msg session lock";
      before_sleep_cmd = "noctalia msg session lock";
    };
  };

  programs.noctalia.settings.idle = {
    behavior_order = [
      "lock"
      "screen-off"
      "suspend"
    ];

    behavior = {
      lock = {
        enabled = true;
        timeout = 300;
        action = "lock";
      };

      screen-off = {
        enabled = true;
        timeout = 330;
        action = "screen_off";
      };

      suspend = {
        enabled = true;
        timeout = 900;
        action = "lock_and_suspend";
      };
    };
  };

  programs.niri.settings.binds."Mod+Ctrl+L".action.spawn = [
    "noctalia"
    "msg"
    "session"
    "lock"
  ];
}
