{...}: {
  programs.niri.settings.environment.TERMINAL = "ghostty";

  programs.noctalia.settings.shell.launcher = {
    sort_by_usage = false;

    pinned = [
      "nixos-manual"
      "com.mitchellh.ghostty"
      "Celeste"
      "claude"
      "discord"
      "Enter the Gungeon"
      "Hollow Knight"
      "lunarclient"
      "nvim"
      "orca-ide"
      "org.kde.dolphin"
      "qimgv"
      "rs.ruffle.Ruffle"
      "spotify"
      "Stardew Valley"
      "steam"
      "The Binding of Isaac Rebirth"
      "thunderbird"
      "zen-beta"
    ];
  };
}
