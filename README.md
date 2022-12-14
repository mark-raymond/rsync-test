This repo contains a pair of files, which when synced with `rsync --no-whole-file --inplace -S`
does not result in the target being identical to the source.

A helper script, `test.sh`, makes a copy of `initial.bin` called `test.bin`, syncs `new.bin` on
`test.bin`, and compares the output. You would expect `test.bin` to now be identical to `new.bin`,
but it differs in one byte.

This was discovered using rsync 3.2.7, which was the latest version of rsync at the time of writing.

Output of `rsync --version` on the system I discovered this on:

```
rsync  version 3.2.7  protocol version 31
Copyright (C) 1996-2022 by Andrew Tridgell, Wayne Davison, and others.
Web site: https://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, symlinks, symtimes, hardlinks, hardlink-specials,
    hardlink-symlinks, IPv6, atimes, batchfiles, inplace, append, ACLs,
    xattrs, optional secluded-args, iconv, prealloc, stop-at, no crtimes, SLP
Optimizations:
    SIMD-roll, no asm-roll, openssl-crypto, no asm-MD5
Checksum list:
    xxh128 xxh3 xxh64 (xxhash) md5 md4 sha1 none
Compress list:
    zstd lz4 zlibx zlib none
Daemon auth list:
    sha512 sha256 sha1 md5 md4

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.
```
