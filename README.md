# dotfiles
These dotfiles aren't special, but they're mine.

Install NeoVim and Sublime Text 3 before executing `setup.sh`


## `<C-h>` fix for neovim: 

```
cd ~
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
