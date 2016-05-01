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

### Now for nix on top of Docker:

The hello_nix_reproducible.sh script takes as little as 218ms to rerun
on my workstation, running inside a docker image.  (See ./nix_docker/)

Now I've got a version of nix going where docker and the reproducible
script both use release 16.03 of nixpkgs.  This seems great but the
docker image has blown up to 837MB.

Actually, ~900MB in /nix according to du.

The shell script run brought in these packages:

    these paths will be fetched (49.69 MiB download, 217.39 MiB unpacked):
    /nix/store/1mirmaabxbkzr3gya7f67613nfws3zq8-findutils-4.4.2
    /nix/store/2bqdxy5fgi62nw6kq4ymzwy8c7k9n7vm-bash-4.3-p42-doc
    /nix/store/3hr0h90xhpba54c4adx31pbbibr7q49c-gnumake-4.1
    /nix/store/3jix5d2i3ca5yzvrj6c5vz4jhj5ijkd2-paxctl-0.9
    /nix/store/5d74gq5wzm4w0qxdvfvl9g9wj1667jd9-gnutar-1.28
    /nix/store/6ncqddnb3gsigfkxxqna1cbndvpmy191-patchelf-0.9
    /nix/store/7a6c59gb2vvkiq5f9iv3aivklfi01zy4-diffutils-3.3
    /nix/store/7csg7wkgzdhp7yddlnjfs87fjlsxf33k-zlib-1.2.8
    /nix/store/94d6pflxmi1g3rjgl57dqnkmq0j6888v-gnugrep-2.22
    /nix/store/a9a5gfvwnhagaaqw6crk7x4ak3114hfd-linux-headers-3.18.14
    /nix/store/bg7i4yhq6a0brr2fvqqj88bk55wvj0hp-gzip-1.6
    /nix/store/bqyfbhf408nb019fp91g9vr1k7pgvdwj-gcc-wrapper-5.3.0
    /nix/store/by640hm8yixig8h2hdp7kbv94icbgjc2-ed-1.12
    /nix/store/dvxkaxif4iia45yyq887103qr6mc2xrd-acl-2.2.52
    /nix/store/fbb5afz59r0x2w4w8wsn21lq4jvxpz0w-coreutils-8.25
    /nix/store/gaw6kqvdkbcfmmq13vnfv78l0yq8rh42-attr-2.4.47
    /nix/store/h1vm2sdhphj52p0bhf9si7szviw2km7z-glibc-2.23
    /nix/store/i7iwcmg12wrrj357jyrbpmhqzgi91hlg-xz-5.2.2
    /nix/store/ksx1gzsbjgbhg5rdi5yqpgbhg8qyk1r4-gawk-4.1.3
    /nix/store/lycikilm4fckm773bsp11p91n1lvn0yq-stdenv
    /nix/store/pia3qb9bf3c72rhigvdjvqasyggm5j9v-gcc-5.3.0
    /nix/store/pks0f2gg6h8fjcg2fdaqwxqw4ps456wl-bzip2-1.0.6
    /nix/store/pl1578x6z8vyn2w51lqg7gb58x0n6np5-binutils-2.26
    /nix/store/rwqh31ccqcjcnikgnqi64hvfaddmn44z-gnused-4.2.2
    /nix/store/vnw8s115pid8n9ls26rfgig9ixqzh8mx-pcre-8.38
    /nix/store/w6rc026a5kw9zyvvapqq6li157ckvwq7-bash-4.3-p42
    /nix/store/xp8774cawyrrpd8lcicrvbhh97f7a61i-patch-2.7.5


But that's after the previous install did this:

    installing ‘strace-4.10’
    installing ‘bash-interactive-4.3-p42’
    these paths will be fetched (38.61 MiB download, 172.49 MiB unpacked):
    /nix/store/31w31mc8immhpnmxvcl4l0fvc3i5iwh0-zlib-1.2.8
    /nix/store/4bydkxwlmw5lnymw3qyxkqw8c6sr86sf-bash-4.3-p42-doc
    /nix/store/4i01mpa2s194m44xrz41wmf4yr49jysq-ncurses-5.9
    /nix/store/8xfxnm4a7jvyh0i1sd967z6rws8lh21a-coreutils-8.24
    /nix/store/8z667vv1agvpd3iknmk94j0ix6bv413i-attr-2.4.47
    /nix/store/9ais7ngz6njw3x2b8yj34cxgv1pwfvbj-readline-6.3p08
    /nix/store/a3x9hggwq83f3fk88lqvgh6jvlklhk36-perl-5.20.2
    /nix/store/c4v7l9xq6dylqigjnplxkmc87fv9j0zs-libunwind-1.1
    /nix/store/hhyaq5l6a7arifi2siq08m2bbqq074zi-xz-5.2.1
    /nix/store/i9nn1fkcy95dzf0hb9wi8gbkid3iw1sa-gcc-4.9.3
    /nix/store/kj6gl6xd81jgigrmq9gjsffmgipafjs4-bash-4.3-p42
    /nix/store/r2ylv1ir0ksb60s4i1fvahb1l630mx4h-strace-4.10
    /nix/store/sk0b1r840b686zc2m8mzyw8yyq1aymqh-acl-2.2.52
    /nix/store/xag5ayq906w9zhlxs8wayv4kvpiyqphq-bash-4.3-p42

Darn this is not working right.  I end up with three versions of
zlib.  Ok, two I expected from having to install gnutar before
installing the 16.03 tarball.  But the idea was that the
strace/bashInteractive install and the hello_world script are supposed
to both be using the exact same 16.03 nixpkgs snapshot.  That SHOULD
include the same version of zlib-1.2.8!  Ditto for coreutils, etc.

If I delete old generations and gargage collect, plus mush all the
commands in the Dockerfile into one RUN/layer... then it successfully
frees 344MB at the end.  That's much better.

Ah, darn, but then because it deleted so much garbage.  The first time
we run the script it refetches the 16.03.tar.gz.  And worse than that
we reinstall a bunch of stuff.  That brings us back up to 900MB /nix
and these packages reported by `nix-env -q`:

    bash-interactive-4.3-p42
    gnutar-1.28
    nix-1.10
    nss-cacert-3.20
    strace-4.10

I did look at the strace.  It includes 200 opens.  Virtually all under
`/nix/store/<pkg-hash>`.  I don't see where/how it does the caching.

BEFORE that script ran, the /nix/store was 546MB.  It has two zlibs
instead of three.  But, weirdly, the `nix-env -q` reports EXACTLY the
same packages as listed above, after the script ran.  What gives?  If
it's the same nixpkg set, and its the same packages/versions, then why
the extra reinstalls and >300MB?

    bash-interactive-4.3-p42
    gnutar-1.28
    nix-1.10
    nss-cacert-3.20
    strace-4.10
