# Package

version       = "0.1.0"
author        = "NimibLand"
description   = "Extensions, experiments and extras for nimib ecosystem "
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.2.10"
requires "nimib >= 0.4.1"

dev:
  requires "nimibook >= 0.4.0"

task buildBook, "Builds the nimiBook docs":
  selfExec(" r nbook.nim init")
  selfExec(" r nbook.nim build")
