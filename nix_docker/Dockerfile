# Optoin (1):
# FROM nixos/nixpkgs:15.06pre63766.8e56452

# Option (2): 
FROM nixos/nix:1.10
# Bootstrapping problem: need a good Tar:
RUN nix-env -iA nixpkgs.gnutar 

# Nix-channel: should be optional:
## RUN nix-channel --add http://nixos.org/releases/nixpkgs/nixpkgs-15.06pre63766.8e56452/ dev
# RUN nix-channel --add http://nixos.org/releases/nixpkgs/nixpkgs-16.03pre76763.be0abb3/ dev
# RUN nix-channel --update
# ALTERNATIVE, pass -I below:

# Install packages:
# DELICATE: the goal here is to use the exact same nixpkgs as the script below uses.
RUN nix-env -iA nixpkgs.strace nixpkgs.bashInteractive nixpkgs.gnutar -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz

# Woo, Docker CACHING should actually be safe in this context.
# RUN nix-env -iA nixpkgs.stdenv


# This must be run from the root of the repo
# (UGH, see https://github.com/docker/docker/issues/2745 about this arbitrary limitation.)
ADD ./nix /scripts

# RUN time /scripts/hello_nix_reproducible.sh
