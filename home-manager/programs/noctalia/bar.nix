{pkgs, ...}: {
  programs.noctalia.settings = {
    bar.main = {
      position = "top";
      margin_edge = 6;
      margin_ends = 8;
      padding = 8;
      widget_spacing = 8;
      background_opacity = 0.85;

      dead_zone.actions.right = "none";

      start = ["workspaces"];
      center = ["media" "audio_visualizer"];
      end = [
        "tray"
        "volume"
        "network"
        "brightness"
        "battery"
        "clock"
        "control-center"
      ];
    };

    widget = {
      workspaces = {
        label_source = "id";
        hide_when_empty = true;
      };

      media = {
        artist_first = false;
        max_length = 300;
        title_scroll = "always";
        hide_when_no_media = true;
      };

      audio_visualizer = {
        width = 80;
        mirrored = false;
        show_when_idle = false;
      };

      battery.display_mode = "glyph";

      clock = {
        format = "{:%a %b %d  %I:%M %p}";
        tooltip_format = "{:%A, %B %-d %Y}";
      };

      control-center = {
        custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
        custom_image_colorize = true;
      };
    };
  };
}
