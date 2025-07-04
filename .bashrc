# When not running a session interactively (sftp/scp) don't do anything as it can cause sessions to fail
# as any std out will interupt and kill sessions
[ -z "$PS1" ] && return

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset='\[\e[0m\]'
  c_user='\[\e[1;33m\]'
  c_path='\[\e[0;31m\]'
  c_host='\[\e[0;34m\]'
  c_git_cleancleann='\[\e[0;36m\]'
  c_git_dirty='\[\e[0;35m\]'
else
  c_reset=
  c_user=
  c_host=
  c_git_cleancleann_path=
  c_git_clean=
  c_git_dirty=
fi

# Setup git stuff function to assemble the git parsing art of our prompt.
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_color="$c_git_clean"
  else
    git_color="$c_git_dirty"
  fi

  echo "[$git_color$git_branch${c_reset}]"
}

# These entries just ensure a large number of old commands are tracked for easy lookup later
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history


# Append each command to the history so each shell has access
shopt -s histappend
PROMPT_COMMAND='PS1="${c_user}\u${c_reset}@${c_host}\h${c_reset} : ${c_path}\w\n${c_reset}$(git_prompt)\$ "'
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

alias ls='ls --color'
alias ll='ls -al'
alias l='ls -al'
alias cl='clear'
LS_COLOR=$LS_COLORS:'di=0;34:ln=0;94:or=0;31:ex=0;32:'
export LS_COLORS
function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'

# give more colors to tmux :P
alias tmux="tmux -2"

# set vim to use
alias vi='vim' 
export manpager="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\"" 
export git_editor="vim"

# Only alias vi/vim to nvim if Neovim is available 
if command -v nvim >/dev/null 2>&1; then
  alias vi='nvim'
  alias vim='nvim'
fi
