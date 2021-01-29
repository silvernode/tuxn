# Tuxn
A package manager wrapper for unix-like systems.

## Get & Install Nim

A good amount of Linux distributions offer Nim in their repositories, albeit the version generally outdated.

I recommend installing Nim via the "choosenim" script which manages different versions of Nim.
This script works much like "rustup" for the Rust programming language.
To get choosenim for Linux, enter the following commands:

```
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```
Then you can add it to your bash profile or .bashrc file

```
echo 'PATH=${HOME}/.nimble/bin:$PATH' >> ~/.bashrc
```

Close your terminal, then reopen it or open a new instance of your shell:
```
bash
```
## Building
```
git clone https://github.com/silvernode/tuxn.git
```
```
cd tuxn
```
```
nimble build
```
```
./tuxn -h
```

## Binary Realeses

https://github.com/silvernode/tuxn/releases
