{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    go
    golangci-lint
    gopls
    gotools
    delve
    gomodifytags
    gore
    gotests
  ];
}
