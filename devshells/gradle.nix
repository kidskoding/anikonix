{pkgs}: let
  jdk = pkgs.jdk21;
in
  pkgs.mkShell {
    packages = [
      jdk
      (pkgs.gradle.override {java = jdk;})
    ];

    env = {
      JAVA_HOME = jdk;
      GRADLE_USER_HOME = ".gradle";
    };
  }
