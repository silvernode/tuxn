# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

import 
  tuxnpkg/package_managers,
  tuxnpkg/procs,
  os, 
  strformat, 
  strutils, 
  tables

when isMainModule:
  var argCount = paramCount()
  var cmdArgs = commandLineParams()
  var pkgArgs: TaintedString
  var pkm: PackageManager

  if fileExists(apt.filePath):
    pkm = apt
  elif fileExists(dnf.filePath):
    pkm = dnf
  elif fileExists(eopkg.filePath):
    pkm = eopkg
  elif fileExists(pacman.filePath):
    pkm = pacman
  else:
    echo "No supported package manager found"
    quit(0)

  


  for n in 1 ..< argCount:
    echo cmdArgs[n]
    pkgArgs = pkgArgs & " " & cmdArgs[n]

  case cmdArgs[0]

    of "i", "-i","install":
      pkmCmd(pkm.installCmd, pkgArgs)
    
    of "ri", "-ri", "reinstall":
      pkmCmd(pkm.reinstallCmd, pkgArgs)

    of "r", "-r", "remove":
      pkmCmd(pkm.removeCmd, pkgArgs)

    of "u", "-u", "upgrade":
      pkmCmd(pkm.upgradeCmd, pkgArgs)

    of "sup", "-sync-and-upgrade":
      pkmCmd(pkm.supCmd, pkgArgs)

    of "s", "-s", "search":
      pkmCmd(pkm.searchCmd, pkgArgs)

    of "c", "-c", "clean":
      pkmCmd(pkm.cleanCmd, pkgArgs)

    of "if", "-if", "info":
      pkmCmd(pkm.infoCmd, pkgArgs)

    else:
      helpOpt()
      quit(0)
  

