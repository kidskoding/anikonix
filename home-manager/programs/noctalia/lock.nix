{config, ...}: {
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

  programs.noctalia.settings.lockscreen = {
    transition = [];
  };

  programs.noctalia.settings.lockscreen_widgets.widget = {
    "lockscreen-clock@eDP-1" = {
      type = "clock";
      output = "eDP-1";
      cx = 960.0;
      cy = 130.0;
      scale = 1.5;
      settings.format = config.programs.noctalia.settings.shell.time_format;
    };

    "lockscreen-avatar@eDP-1" = {
      type = "sticker";
      output = "eDP-1";
      cx = 960.0;
      cy = 300.0;
      scale = 0.6;
      settings.image_path = "${./avatars/nixos-logo.png}";
    };

    "lockscreen-user@eDP-1" = {
      type = "label";
      output = "eDP-1";
      cx = 960.0;
      cy = 420.0;
      settings = {
        title = config.home.username;
        description = "";
      };
    };

    "lockscreen-login-box@eDP-1" = {
      type = "login_box";
      output = "eDP-1";
      cx = 960.0;
      cy = 540.0;
      placement_width = 1920.0;
      placement_height = 1080.0;
      settings = {
        show_unlock_hint = false;
        center_password_text = true;
        show_media = false;
        show_weather = false;
      };
    };

    "lockscreen-media@eDP-1" = {
      type = "media_player";
      output = "eDP-1";
      cx = 960.0;
      cy = 800.0;
      settings.hide_when_no_media = true;
    };
  };

  programs.niri.settings.binds."Mod+Ctrl+L".action.spawn = [
    "noctalia"
    "msg"
    "session"
    "lock"
  ];
}
