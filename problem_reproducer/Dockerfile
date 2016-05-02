FROM nixos/nix:1.10

# Install packages:
# DELICATE: the goal here is to use the exact same nixpkgs as the script below uses.
RUN nix-env --version && nix-env -iA nixpkgs.gnutar

ENV NIX_PATH=nixpkgs=http://nixos.org/releases/nixpkgs/nixpkgs-16.09pre82345.3994a23/nixexprs.tar.xz

RUN nix-env -iA nixpkgs.bashInteractive
RUN nix-env -f "<nixpkgs>" -iA haskellPackages.stack 

RUN which -a stack && \
    stack --version && \
    stack new hello


# FailedConnectionException2 "s3.amazonaws.com" 443 True getProtocolByName: does not exist (no such protocol name: tcp)

# FailedConnectionException2 "raw.githubusercontent.com" 443 True getProtocolByName: does not exist (no such protocol name: tcp)
