# Optoin (1):
# FROM nixos/nixpkgs:15.06pre63766.8e56452

# Option (2): 
FROM nixos/nix:1.10
# Bootstrapping problem: need a good Tar:
# RUN nix-env -iA nixpkgs.gnutar 

# Nix-channel: should be optional:
## RUN nix-channel --add http://nixos.org/releases/nixpkgs/nixpkgs-15.06pre63766.8e56452/ dev
# RUN nix-channel --add http://nixos.org/releases/nixpkgs/nixpkgs-16.03pre76763.be0abb3/ dev
# RUN nix-channel --update
# ALTERNATIVE, pass -I below:

# Install packages:
# DELICATE: the goal here is to use the exact same nixpkgs as the script below uses.
RUN nix-env -iA nixpkgs.gnutar && \
    nix-env -iA nixpkgs.bashInteractive -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz && \
    nix-shell -q && du -sch /* 

# Problems with this:
RUN echo 'echo hello' | nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz -p bashInteractive 

#    nix-env -iA nixpkgs.strace nixpkgs.bashInteractive -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/16.03.tar.gz && \
#    nix-env --delete-generations old && \
#    nix-collect-garbage && du -sch /*
## Surprisingly, this errors:
## nix-collect-garbage -d
##   error: getting status of ‘/nix/var/nix/profiles/default-1-link’: No such file or directory


# This must be run from the root of the repo
# (UGH, see https://github.com/docker/docker/issues/2745 about this arbitrary limitation.)
ADD ./nix /scripts

# Prime the pump by running the script once and installing any dependencies:
# We don't have /usr/bin/env here, so use nix-shell explicitly.
RUN nix-env -q && du -sch /* && \
    time nix-shell /scripts/hello_nix_reproducible.sh && \
    nix-env -q && du -sch /*
