# Package
version       = "0.0.2"
author        = "Göran Krampe"
description   = "Small demo Spry interpreters"
license       = "MIT"
bin           = @["sprymicro", "sprymin"]

# This forces no installation except binaries
skipExt       = @["nim"]
installDirs   = @[]

# Deps
requires "spryvm"

task test, "Run the tests":
  withDir "tests":
    exec "nim c -r all"
