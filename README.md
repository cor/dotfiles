# dotfiles
These dotfiles aren't special, but they're mine.

1. Install `zsh`, `nvim` and `prezto`
2. run `setup.sh`

## `<C-h>` fix for neovim: 
```
cd ~
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

