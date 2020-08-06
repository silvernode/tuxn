import
  package_managers,
  os, strformat

proc helpOpt*() =
    echo """
    tuxn [i, r, u, sup, s, c ] <pkgname>

    i     install a package
    ri    reinstall a package
    r     remove a package
    up    update system
    ug    upgrade system
    sup   sync and upgrade
    s     search for a package
    c     clean package cache
    in    show info for package
    """

proc pkmCmd*(command: string, arg: TaintedString) =
    
    if arg == "":
      discard execShellCmd(command)
    else:
      echo command, arg
      discard execShellCmd(fmt"{command} {arg}")
    


proc customPkm*() =
  ## Interactively create custom package manager bindings
  stdout.write("Name of custom package manager: ")
  var pkmName = readLine(stdin)

  stdout.write("Package manager file path: ")
  var pkmFilePath = readLine(stdin)

  stdout.write("Install command: ")
  var pkmInstallCmd = readLine(stdin)

  stdout.write("Reinstall command: ")
  var pkmReinstallCmd = readLine(stdin)
#[
  stdout.write("Remove command: ")
  var pkmRemoveCmd = readLine(stdin)

  stdout.write("Update command: ")
  var pkmUpdateCmd = readLine(stdin)

  stdout.write("Upgrade command: ")
  var pkmUpgradeCmd = readLine(stdin)

  stdout.write("Sync & Upgrade command (sup): ")
  var pkmSupCmd = readLine(stdin)

  stdout.write("Search command: ")
  var pkmSearchCmd = readLine(stdin)

  stdout.write("Clean command: ")
  var pkmCleanCmd = readLine(stdin)

  stdout.write("Info command: ")
  var pkmInfoCmd = readLine(stdin)
]#
  let lines = [pkmName, pkmFilePath, pkmInstallCmd, pkmReinstallCmd]
  # echo "Writing file"
  # writeFile(pkmName, pkmFilePath)
  echo "Opening file"
  let file = open(pkmName, fmWrite)
 # echo "Reading first line"
 # echo file.readLine()
 # echo "Closing file"
  defer: file.close()

  for line in lines:
    file.writeLine(line)
