#
#   bashrc 
#   github.com/Mespyr
#   

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# history stuff
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=500
HISTFILESIZE=1000
HISTFILE=~/.config/history
# update the values of LINES and COLUMNS on window resize
shopt -s checkwinsize
# Other
PS1='\033[1;35m\W/ \e[0m'
# Path
export PATH=~/.local/bin:$PATH
export PATH=~/.config/scripts:$PATH
# editor
export EDITOR="nvim"
# aliases
alias ga='git add .'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias autoremove='sudo pacman -Rsn $(pacman -Qdtq)'
alias ls="exa -labs type"
alias cat="bat"
alias rm="rm -I"
alias v="nvim"
alias py="python3"
alias img="mpv --loop=inf --pause"
alias rickroll="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
alias dio="gio tree"
