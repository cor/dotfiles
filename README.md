# dotfiles
These dotfiles aren't special, but they're mine.

## `<C-h>` fix for neovim: 
```
cd ~
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

