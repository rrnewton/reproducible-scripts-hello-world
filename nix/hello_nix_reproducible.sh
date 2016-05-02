#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bashInteractive -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz

# First test:
#   nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-14.12.tar.gz
# Or more recent:
#   nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz

# Second test:
# nixpkgs tag, 16.03 = d231868990f8b2d471648d76f07e747f396b9421
# -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/d231868990f8b2d471648d76f07e747f396b9421.tar.gz

# Third test:
# This appears to be a release: nixpkgs-16.03pre76763.be0abb3
# This makes it easiest to match what's used in the docker image.
# -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/be0abb32f6a049fc5713f6b9235f01e4c6a1efcf.tar.gz

# Fourth test:
# -I nixpkgs=http://nixos.org/releases/nixpkgs/nixpkgs-16.03pre76763.be0abb3/nixexprs.tar.xz
# Note nix-channel uses the bare URL:
#   http://nixos.org/releases/nixpkgs/nixpkgs-16.03pre76763.be0abb3/

# And here's the very latest nightly release:
# -I nixpkgs=http://nixos.org/releases/nixpkgs/nixpkgs-16.09pre82345.3994a23/nixexprs.tar.xz

# Gosh, which are going to get me the cached binary packages?  

echo Hello world 
