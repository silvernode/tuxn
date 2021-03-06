
type
    PackageManager* = object
        filePath*: string
        installCmd*: string
        reinstallCmd*: string
        removeCmd*: string
        updateCmd*: string
        upgradeCmd*: string
        supCmd*: string
        searchCmd*: string
        cleanCmd*: string
        infoCmd*: string
        topgradeCmd*: string



var
    #[temp* = PackageManager(
        filePath: "/usr/bin/",
        installCmd: "",
        reinstallCmd: "",
        removeCmd: "",
        updateCmd: "",
        upgradeCmd: "",
        supCmd: "",
        searchCmd: "",
        cleanCmd: "",
        infoCmd: ""
    )]#

    apt* = PackageManager(
        filePath: "/usr/bin/apt",
        installCmd: "apt install",
        reinstallCmd: "apt install --reinstall",
        removeCmd: "apt remove",
        updateCmd: "apt update",
        upgradeCmd: "apt upgrade",
        supCmd: "apt update && apt upgrade",
        searchCmd: "apt search",
        cleanCmd: "apt autoremove",
        infoCmd: "apt-cache show",
        topgradeCmd: "topgrade"
    )

    brew* = PackageManager(
        filePath: "/usr/local/bin/brew",
        installCmd: "brew install",
        reinstallCmd: "brew reinstall",
        removeCmd: "brew remove",
        updateCmd: "brew update",
        upgradeCmd: "brew upgrade",
        supCmd: "brew update && brew upgrade",
        searchCmd: "brew search",
        cleanCmd: "brew cleanup",
        infoCmd: "brew info",
        topgradeCmd: "topgrade"
    )

    dnf* = PackageManager(
        filePath: "/usr/bin/dnf",
        installCmd: "dnf install",
        reinstallCmd: "dnf reinstall",
        removeCmd: "dnf remove",
        updateCmd: "dnf check-update --refresh",
        upgradeCmd: "dnf upgrade",
        supCmd: "dnf upgrade --refresh",
        searchCmd: "dnf search",
        cleanCmd: "dnf clean all",
        infoCmd: "dnf info",
        topgradeCmd: "topgrade"
    )

    eopkg* = PackageManager(
        filePath: "/usr/bin/eopkg",
        installCmd: "eopkg it",
        reinstallCmd: "eopkg install --reinstall",
        removeCmd: "eopkg remove",
        updateCmd: "eopkg ur",
        upgradeCmd: "eopkg upgrade",
        supCmd: "eopkg sync && eopkg update",
        searchCmd: "eopkg sr",
        cleanCmd: "eopkg clean",
        infoCmd: "eopkg info",
        topgradeCmd: "topgrade"
    )

    pacman* = PackageManager(
        filePath: "/usr/bin/pacman",
        installCmd: "pacman -S",
        reinstallCmd: "pacman -S --force",
        removeCmd: "pacman -R",
        updateCmd: "pacman -Sy",
        upgradeCmd: "pacman -Su",
        supCmd: "pacman -Syu",
        searchCmd: "pacman -Ss",
        cleanCmd: "pacman -Scc",
        infoCmd: "pacman -Si",
        topgradeCmd: "topgrade"
    )


    xbps* = PackageManager(
        filePath: "/usr/bin/xbps-install",
        installCmd: "xbps-install",
        reinstallCmd: "xbps-install -f",
        removeCmd: "xbps-remove",
        updateCmd: "xbps-install -S",
        upgradeCmd: "xbps-install -u",
        supCmd: "xbps-install -Su",
        searchCmd: "xbps-query -Rs",
        cleanCmd: "xbps-remove -O",
        infoCmd: "xbps-query -RS",
        topgradeCmd: "topgrade"
    )

    

