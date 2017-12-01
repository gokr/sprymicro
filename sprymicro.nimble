# Package
version       = "0.0.1"
author        = "Göran Krampe"
description   = "Small demo Spry interpreters"
license       = "MIT"
bin           = @["sprymicro", "sprymin"]

# Deps
requires "spryvm"

task test, "Run the tests":
  withDir "tests":
    exec "nim c -r all"
