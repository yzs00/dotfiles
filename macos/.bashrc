#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash options
#shopt -s autocd

GREEN="$(tput setaf 2; tput bold)"
BLUE="$(tput setaf 4; tput bold)"
RESET="$(tput sgr0)"

#export PS1="${GREEN}my prompt${RESET}> "

#source ~/.bash.d/git-prompt.sh
#PS1='${GREEN}\u@\h${BLUE}:\w${RESET}$(__git_ps1 " (%s)")\n$ '
PS1='${GREEN}\u@\h${BLUE}:\w${RESET}\n$ '

[[ -r ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -r ~/.bash_completions ]] && source ~/.bash_completions

# `ssh-agent` を起動しておく
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
