import
  os, 
  strformat,
  colorize,
  strutils

proc helpOpt*() =
    echo """

tuxn [i, r, up, u, sup, s, c, in, v ] <pkgname>

i     install a package
ri    reinstall a package
r     remove a package
up    update repositories
ug    upgrade system
sup   sync and upgrade
s     search for a package
c     clean package cache
if    show info for package
v     show tuxn version
    """

proc pkmCmd*(command: string, arg: TaintedString) =
    try:
      if arg == "":
        discard execShellCmd(command)
      else:
        discard execShellCmd(fmt"{command} {arg}")
    
    except:
      echo fgLightRed("Unknown Error: Please submit an issue on https://github.com/silvernode/tuxn")
    
proc sigTerm*() {.noconv.} =
      echo fgLightRed("""


cancelled""")
      quit(1)
    

proc customPkm*() =
  setControlCHook(sigTerm)
  
  var homeDir = getHomeDir()
  var pkmDir = fmt"{homeDir}/.tuxn/pkm"

  if existsDir(pkmDir) != true:
    createDir(pkmdir)

  while true:
    stdout.write(fgLightCyan("Would you like to create custom bindings?:[Y/n]: "))
    var choice = readLine(stdin)

    try:
      case choice
        of "n", "N", "no", "NO", "No":
          quit(1)

        of "y", "Y", "yes", "YES", "Yes":
          ## Interactively create custom package manager bindings
          stdout.write("Name of custom package manager: ")
          var pkmName = readLine(stdin)

          stdout.write("Package manager file path: ")
          var pkmFilePath = readLine(stdin)

          pkmFilePath = escape(pkmFilePath, prefix = "\"", suffix = "\"")

          stdout.write("Install command: ")
          var pkmInstallCmd = readLine(stdin)

          pkmInstallCmd = escape(pkmInstallCmd, prefix = "\"", suffix = "\"")

          stdout.write("Remove command: ")
          var pkmRemoveCmd = readLine(stdin)

          pkmRemoveCmd = escape(pkmRemoveCmd, prefix = "\"", suffix = "\"")

          stdout.write("Reinstall command: ")
          var pkmReinstallCmd = readLine(stdin)

          pkmReinstallCmd = escape(pkmReinstallCmd, prefix = "\"", suffix = "\"")

          stdout.write("Update command: ")
          var pkmUpdateCmd = readLine(stdin)

          pkmUpdateCmd = escape(pkmUpdateCmd, prefix = "\"", suffix = "\"")

          stdout.write("Upgrade command: ")
          var pkmUpgradeCmd = readLine(stdin)

          pkmUpgradeCmd = escape(pkmUpgradeCmd, prefix = "\"", suffix = "\"")

          stdout.write("Sync & Update command: ")
          var pkmSupCmd = readLine(stdin)

          pkmSupCmd = escape(pkmSupCmd, prefix = "\"", suffix = "\"")

          stdout.write("Search command: ")
          var pkmSearchCmd = readLine(stdin)

          pkmSearchCmd = escape(pkmSearchCmd, prefix = "\"", suffix = "\"")

          stdout.write("Clean command: ")
          var pkmCleanCmd = readLine(stdin)

          pkmCleanCmd = escape(pkmCleanCmd, prefix = "\"", suffix = "\"")

          stdout.write("Info command: ")
          var pkmInfoCmd = readLine(stdin)

          pkmInfoCmd = escape(pkmInfoCmd, prefix = "\"", suffix = "\"")

          

          let lines = [
          fmt"#{pkmName}", 
          fmt"filePath = {pkmFilePath}", 
          fmt"installCmd = {pkmInstallCmd}", 
          fmt"removeCmd = {pkmRemoveCmd}",
          fmt"reinstallCmd = {pkmReinstallCmd}", 
          fmt"updateCmd = {pkmUpdateCmd}", 
          fmt"upgradeCmd = {pkmUpgradeCmd}", 
          fmt"supCmd = {pkmSupCmd}", 
          fmt"searchCmd = {pkmSearchCmd}", 
          fmt"cleanCmd = {pkmCleanCmd}", 
          fmt"infoCmd = {pkmInfoCmd}"
          ]

          var pkmPath = fmt"{pkmdir}/{pkmName}"
          let file = open(pkmPath, fmWrite)
        
          defer: file.close()

          for line in lines:
            file.writeLine(line)

          if fileExists(pkmPath):
            echo fgLightGreen(fmt"{pkmName} created in {pkmDir}")

          elif not fileExists(pkmPath):
            echo fgLightRed(fmt"{pkmName} not created, make sure you have permission to write files")
            quit(1)

        else:
          echo fgLightYellow("Please type 'y' or 'n'")

    except: echo "something went wrong"
