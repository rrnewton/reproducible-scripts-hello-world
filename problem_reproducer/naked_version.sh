#!/bin/bash

# This runs the same commands as the dockerfile.
# This version WORKS FINE.  [2016.05.02] 

set -xe

source $HOME/.nix-profile/etc/profile.d/nix.sh

which -a nix-env
nix-env --version
nix-env -iA nixpkgs.gnutar

export NIX_PATH=nixpkgs=http://nixos.org/releases/nixpkgs/nixpkgs-16.09pre82345.3994a23/nixexprs.tar.xz

nix-env -iA nixpkgs.bashInteractive
nix-env -f "<nixpkgs>" -iA haskellPackages.stack 

which -a stack
stack --version
stack new hello
