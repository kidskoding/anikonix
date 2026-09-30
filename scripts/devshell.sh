#!/usr/bin/env bash
set -euo pipefail

shells=$(nix eval --raw ~/nixos#devShells.x86_64-linux --apply 's: builtins.concatStringsSep " " (builtins.attrNames s)')

if [ $# -ne 1 ] || [[ " $shells " != *" $1 "* ]]; then
  echo "usage: devshell <name>"
  echo "shells: $shells"
  exit 1
fi

if [ -e .envrc ]; then
  echo ".envrc already exists, not overwriting"
  exit 1
fi

echo "use flake ~/nixos#$1" > .envrc
direnv allow
