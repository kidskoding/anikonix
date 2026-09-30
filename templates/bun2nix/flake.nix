{
  description = "bun project built from bun.lock";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    bun2nix = {
      url = "github:nix-community/bun2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [inputs.bun2nix.overlays.default];
    };
  in {
    packages.${system}.default = pkgs.callPackage ./default.nix {};

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        bun
        bun2nix
      ];

      shellHook = ''
        [ -d .git ] || git init -q

        if [ ! -f bun.lock ]; then
          bun install
          touch node_modules
        elif [ ! -d node_modules ] || [ bun.lock -nt node_modules ]; then
          bun install --frozen-lockfile
          touch node_modules
        fi

        if [ ! -f bun.nix ] || [ bun.lock -nt bun.nix ]; then
          bun2nix -o bun.nix
        fi
      '';
    };
  };
}
