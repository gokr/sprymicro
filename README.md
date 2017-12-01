# Sprymicro
This is a demonstration of compiling minimal Spry interpreters.

* sprymin.nim   - A minimal core Spry interpreter that can still read a file
* sprymicro.nim - As small as it can get, source is embedded instead of accessed as file

## Going small
The Spry interpreter is fairly small, but it does include the Nim soft realtime GC so we can't
go ultra small. But using for example musl-libc or diet-libc you can make a statically linked stripped 64 bit x86_64 VM
that is only around 100kb. Clang makes a smaller non-size optimized binary, but larger size optimized.

## musl-libc
If you want to try building with musl-libc (which seems to be the most competent small libc) you need to install
musl-dev and then use a build command like this:

```
nim -d:release --opt:size --passL:-static --gcc.exe:musl-gcc --gcc.linkerexe:musl-gcc c sprymin && strip -s sprymin
```

## diet-libc
If you want to try building with diet-libc you need to install dietlibc-dev and add this file:

gokr@yoda:~$ cat /usr/bin/dietgcc 
diet gcc $@

...then use a build command like this:

```
nim -d:release --opt:size --passL:-static --gcc.exe:dietgcc --gcc.linkerexe:dietgcc c sprymin && strip -s sprymin
```
On my machine that produces a sprymin around 122kb and sprymicro around 114kb.
