{pkgs}:
pkgs.mkShell {
  packages = with pkgs.elmPackages; [
    elm
    elm-format
    elm-json
    elm-language-server
    elm-test
    elm-review
  ];
}
