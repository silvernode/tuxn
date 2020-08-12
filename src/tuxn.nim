import 
  tuxnpkg/package_managers,
  tuxnpkg/procs,
  os,
  colorize

when isMainModule:
  var tuxnVersion = "0.1.0 alpha"
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
    echo fgLightRed("No supported package manager found")
    while true:
      stdout.write fgLightCyan("Would you like to create custom bindings?[Y/n]: ")
      var custom = readLine(stdin)
    
      case custom
        of "n", "N", "no", "No", "NO":
          quit(0)

        of "y", "Y", "yes", "Yes", "YES":
          customPkm()

        else:
          echo fgLightYellow("Please type 'y' or 'n'")

    quit(0)

  


  for n in 1 ..< argCount:
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

    of "v", "-v", "version":
      echo fgLightGreen(tuxnVersion)

    else:
      helpOpt()
      quit(0)
  

