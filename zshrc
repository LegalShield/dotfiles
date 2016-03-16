ls
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

autoload -U compinit
compinit

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -s "${ZDOTDIR:-$HOME}/.tmuxinator/scripts/tmuxinator" ]] && source "${ZDOTDIR:-$HOME}/.tmuxinator/scripts/tmuxinator"

if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

# Customize to your needs...
export PATH=~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools/proguard/bin:$PATH

#Allow History Substring Search With Up/Down nd UP and DOWN arrow keys
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

