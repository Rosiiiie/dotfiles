# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

export TERMINAL=kitty

. "$HOME/.cargo/env"
