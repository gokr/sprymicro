# Spry Minimal Language interpreter.
#
# This Spry interpreter has no extra modules linked, only core language.
#
# NOTE:
# * Clang makes a smaller non-size optimized binary, but larger size optimized.
# * You can get a statically linked VM using musl-libc down to 100kb.
#
# Regular compiled, no optimization for size, dynamically linked:
# nim -d:release c sprymin && strip -s sprymin
#
# Statically compiled optimized for size:
# nim -d:release --opt:size --passL:-static c sprymin && strip -s sprymin
#
# Statically compiled optimized for size using musl-libc:
# nim -d:release --opt:size --passL:-static --gcc.exe:dietgcc --gcc.linkerexe:dietgcc c sprymin && strip -s sprymin
#
# Statically compiled optimized for size using diet-libc (had to create /usr/bin/dietgcc containing "diet gcc $@"):
# nim -d:release --opt:size --passL:-static --gcc.exe="dietgcc" --gcc.linkerexe="dietgcc" c sprymin && strip -s sprymin
#
# Copyright (c) 2015 Göran Krampe

import os
import spryvm/spryvm
import spryvm/sprycore
import spryvm/spryio

# Just run a given file as argument, the hash-bang trick works also
let fn = commandLineParams()[0]
let code = readFile(fn)
var spry = newInterpreter()
spry.addCore()
spry.addIO()
discard spry.eval("[" & code & "]")
