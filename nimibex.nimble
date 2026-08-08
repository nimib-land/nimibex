# Package

version       = "0.1.0"
author        = "NimibLand"
description   = "Extensions, experiments and extras for nimib ecosystem "
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.2.10"
requires "nimib >= 0.4.1"
requires "chroma >= 1.0.0"

dev:
  requires "nimibook >= 0.4.0"

task buildBook, "Builds the nimiBook docs":
  selfExec(" r nbook.nim init")
  selfExec(" r nbook.nim build")

proc listFilesRec(dir: string): seq[string] =
  for f in listFiles(dir):
    if f.endsWith(".nim"):
      result.add(f)
  for subdir in listDirs(dir):
    result.add(listFilesRec(subdir))

task docs, "Generate automatic docs":
  for path in listFilesRec("src"):
    if path.endsWith(".nim"):
      selfExec " doc --index:on --git.url:https://github.com/nimib-land/nimibex --git.commit:main --outdir:docs/docs " & path
  selfExec " buildIndex -o:docs/docs/index.html docs/docs"
