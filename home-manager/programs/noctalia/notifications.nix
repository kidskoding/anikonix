{...}: {
  programs.noctalia.settings.notification = {
    position = "top_right";

    filter_order = [
      "critical"
      "default"
    ];

    filter = {
      critical = {
        match_content = ".*";
        allowed_urgencies = ["critical"];
        override_duration = 10000;
      };

      default = {
        match_content = ".*";
        allowed_urgencies = [
          "low"
          "normal"
        ];
        override_duration = 5000;
      };
    };
  };
}
