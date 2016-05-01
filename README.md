# reproducible-scripts-hello-world
Examples of how to make scripts reproducible.


### [2016.05.01] {Simple testing of nix scripts}


 * ./nix/hello_nix_reprodicuble.sh
 * ./nix/hello_nix_impure.sh
 
Interestingly, this takes only about a second to run the first script
repeatedly (on my super wimpy macbook 12 laptop).  The second version
(without the -I option pointing to a nixpkgs tarball) takes half a
second.

I'm impressed at the one second time.  I wonder how much work it's
(re)doing.  When I get a chance I'll do an strace.



