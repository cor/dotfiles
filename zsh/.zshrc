# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
wd() {
   . /Users/cor/bin/wd/wd.sh
}

# Open book script
alias ob='~/Setup/SchoolScripts/open-book.swift'
alias eob='nvim ~/Setup/SchoolScripts/open-book.swift'

export VISUAL=nvim
export EDITOR="$VISUAL"
