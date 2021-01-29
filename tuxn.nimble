# Package

version       = "0.1.1"
author        = "mollusk"
description   = "A rewrite of tuxc in nim"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["tuxn"]



# Dependencies

requires "nim >= 1.2.4"
requires "colorize"
