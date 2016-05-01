#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz

# First test:
# nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-14.12.tar.gz

# Second test:
# nixpkgs tag, 16.03 = d231868990f8b2d471648d76f07e747f396b9421

# Third test:
# This appears to be a release: nixpkgs-16.03pre76763.be0abb3
# This makes it easiest to match what's used in the docker image.
# -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/be0abb32f6a049fc5713f6b9235f01e4c6a1efcf.tar.gz

echo Hello world 
