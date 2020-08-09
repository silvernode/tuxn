import
  os, 
  strformat,
  colorize

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
    
proc sigTerm() {.noconv.} =
      echo fgLightRed("""


cancelled""")
      quit(1)
    

proc customPkm*() =
  setControlCHook(sigTerm)
  ## Interactively create custom package manager bindings
  stdout.write("Name of custom package manager: ")
  var pkmName = readLine(stdin)

  stdout.write("Package manager file path: ")
  var pkmFilePath = readLine(stdin)

  stdout.write("Install command: ")
  var pkmInstallCmd = readLine(stdin)

  stdout.write("Remove command: ")
  var pkmRemoveCmd = readLine(stdin)

  stdout.write("Reinstall command: ")
  var pkmReinstallCmd = readLine(stdin)

  stdout.write("Update command: ")
  var pkmUpdateCmd = readLine(stdin)

  stdout.write("Upgrade command: ")
  var pkmUpgradeCmd = readLine(stdin)

  stdout.write("Sync & Update command: ")
  var pkmSupCmd = readLine(stdin)

  stdout.write("Search command: ")
  var pkmSearchCmd = readLine(stdin)

  stdout.write("Clean command: ")
  var pkmCleanCmd = readLine(stdin)

  stdout.write("Info command: ")
  var pkmInfoCmd = readLine(stdin)

  

  let lines = [fmt"#{pkmName}", 
  fmt"filePath = {pkmFilePath}", 
  fmt"installCmd = {pkmInstallCmd}", 
  fmt"removeCmd = {pkmRemoveCmd}",
  fmt"reinstallCmd = {pkmReinstallCmd}", 
  fmt"updateCmd = {pkmUpdateCmd}", 
  fmt"upgradeCmd = {pkmUpgradeCmd}", 
  fmt"supCmd = {pkmSupCmd}", 
  fmt"searchCmd = {pkmSearchCmd}", 
  fmt"cleanCmd = {pkmCleanCmd}", 
  fmt"infoCmd = {pkmInfoCmd}"]

  
  echo "Opening file"
  let file = open(pkmName, fmWrite)
 
  defer: file.close()

  for line in lines:
    file.writeLine(line)
