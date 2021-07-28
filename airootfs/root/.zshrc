# zsh-completion
[ -d /usr/share/zsh/site-functions ] && fpath=(/usr/share/zsh/site-functions/ $fpath)
autoload -U compinit; compinit
# zsh-autosuggestions
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-syntax-highlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# prompt
autoload -U promptinit; promptinit
autoload -U colors; colors
export PROMPT="%{$fg[red]%}%n%{$reset_color%}%# "
export RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
setopt auto_cd
setopt correct
setopt nolistbeep
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history
# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# chpwd
function chpwd() { exa }
# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${LS_COLORS}"
# pkgfile
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh
# alias
[ -f ~/.aliasrc ] && source ~/.aliasrc
# edit-command-line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
# <C-d> to exit zsh
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh
# emacs keybind
bindkey -e
