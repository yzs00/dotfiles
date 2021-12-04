#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash options
#shopt -s autocd
stty -ixon

GREEN="$(tput setaf 2; tput bold)"
BLUE="$(tput setaf 4; tput bold)"
RESET="$(tput sgr0)"

PS1='${GREEN}\u@\h${BLUE}:\w${RESET}\n$ '

[[ -r ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -r ~/.bash_completions ]] && source ~/.bash_completions

# `ssh-agent` 

# If Not Running Interactively
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'



[[ -r /etc/profile.d/grc.sh ]] && GRC_ALIASES=true source /etc/profile.d/grc.sh

if [ -f /usr/lib/bash-git-prompt/gitprompt.sh ]; then
    #GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME=Default
    GIT_PROMPT_START="${c_green}\u@\h${c_blue}:\w${c_reset}"
    GIT_PROMPT_END="\n$ "
    source /usr/lib/bash-git-prompt/gitprompt.sh
fi
