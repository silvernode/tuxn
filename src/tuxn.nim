import 
  tuxnpkg/package_managers,
  tuxnpkg/procs,
  os,
  colorize

when isMainModule:
  const tuxnVersion: string = "v0.1.1 alpha"
  var argCount = paramCount()
  var cmdArgs = commandLineParams()
  var pkgArgs: TaintedString
  var pkm: PackageManager
  
  try:
    if fileExists(apt.filePath):
      pkm = apt
    elif fileExists(brew.filePath) or fileExists("/usr/bin/brew"):
      pkm = brew
    elif fileExists(dnf.filePath):
      pkm = dnf
    elif fileExists(eopkg.filePath):
      pkm = eopkg
    elif fileExists(pacman.filePath):
      pkm = pacman
    elif fileExists(xbps.filePath):
      pkm = xbps
    else:
      customPkm()
      quit(1)
  except:
    echo "A problem occured, please make sure you have system permissions"

  


  for n in 1 ..< argCount:
    pkgArgs = pkgArgs & " " & cmdArgs[n]

  try:
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
  except: helpOpt();quit(1)
  

