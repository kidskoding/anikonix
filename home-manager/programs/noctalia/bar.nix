{pkgs, ...}: {
  programs.noctalia.settings = {
    bar.main = {
      position = "top";
      margin_edge = 10;
      margin_ends = 12;
      thickness = 44;
      radius = 14;
      padding = 12;
      widget_spacing = 12;
      font_scale = 1.1;
      background_opacity = 0.96;

      dead_zone.actions.right = "none";

      start = ["workspaces" "media" "audio_visualizer"];
      center = ["clock"];
      end = [
        "tray"
        "volume"
        "network"
        "brightness"
        "battery"
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
        max_length = 240;
        title_scroll = "on_hover";
        hide_when_no_media = true;
      };

      audio_visualizer = {
        width = 80;
        mirrored = false;
        show_when_idle = false;
      };

      volume.show_label = false;
      network = {
        show_label = false;
        show_vpn_label = false;
      };
      brightness.show_label = false;
      battery = {
        display_mode = "glyph";
        show_label = true;
      };

      clock = {
        format = "{:%a, %b %-d  •  %-I:%M %p}";
        tooltip_format = "{:%A, %B %-d %Y}";
      };

      control-center = {
        custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
        custom_image_colorize = true;
      };
    };
  };
}
