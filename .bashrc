# If not running interactively, don't do anything
case $- in *i*) ;; *) return;; esac
# bash completion
if [[ -f /etc/bash_completion ]]; then
	/etc/bash_completion
fi
# history stuff
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=500
HISTFILESIZE=1000
HISTFILE=~/.local/history
# update the values of LINES and COLUMNS on window resize
shopt -s checkwinsize
# prompt
PS1='\033[1;31m\W/ \e[0m'
#PROMPT_COMMAND='echo -en "\033]0;[${PWD##*/}]\a"'
PROMPT_COMMAND='echo -en "\033]0;$(dirs)\a"'
# Path
export PATH=~/.local/bin:$PATH
# editor
export EDITOR="emacs"
# shorten long commands
alias ga='git add .'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias g="cd ~/git"
alias autoremove='yay -Rsn $(yay -Qdtq)'
alias mpv="mpv --loop=inf"
alias img="\mpv --loop=inf --pause"
alias dio="gio tree"
alias rickroll="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
# options for commands
alias ls="ls --color=yes --group-directories-first"
alias la="ls -A --color=yes --group-directories-first"
alias rm="rm -Ir"
# shorten name
function e() {
	emacs $1 &
}
alias v="nvim"
alias py="python"
alias open="xdg-open"
# other
shopt -s autocd
# emsdk
export PATH=/usr/lib/emsdk:$PATH
export PATH=/usr/lib/emsdk/upstream/emscripten:$PATH
export PATH=/usr/lib/emsdk/node/14.18.2_64bit/bin:$PATH
export EMSDK=/usr/lib/emsdk
export EMSDK_NODE=/usr/lib/emsdk/node/14.18.2_64bit/bin/node

# emacs vterm
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
