# Vero theme for Zsh
#
# Copyright (c) 2017-2021 Jade Michael Thornton
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# The software is provided "as is", without warranty of any kind, express or
# implied, including but not limited to the warranties of merchantability,
# fitness for a particular purpose and noninfringement. In no event shall the
# authors or copyright holders be liable for any claim, damages or other
# liability, whether in an action of contract, tort or otherwise, arising from,
# out of or in connection with the software or the use or other dealings in the
# software.

autoload colors && colors

ZSH_THEME_NODE_PROMPT_PREFIX="⟦node "
ZSH_THEME_NODE_PROMPT_SUFFIX="⟧"
ZSH_THEME_NVM_PROMPT_PREFIX="⟦nvm "
ZSH_THEME_NVM_PROMPT_SUFFIX="⟧"

ZSH_THEME_PYTHON_PROMPT_PREFIX="⟦py "
ZSH_THEME_PYTHON_PROMPT_SUFFIX="⟧"
ZSH_THEME_PYENV_PROMPT_PREFIX="⟦py "
ZSH_THEME_PYENV_PROMPT_SUFFIX="⟧"

ZSH_THEME_GIT_PROMPT_PREFIX="⟦%{$fg_bold[cyan]%}%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}⟧"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}•%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}•%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}•%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[magenta]%}↕%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}⚑%{$reset_color%}"

vero_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

vero_git_status() {
  local _STATUS="" _has_changes=0
  local _INDEX=$(command git status --porcelain -b 2> /dev/null)
  local -a _lines=("${(f)_INDEX}")
  local _branch_status="${_lines[1]}"

  # check status of files
  if (( ${#${(M)_lines:#[AMRD]? *}} )); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    _has_changes=1
  fi
  if (( ${#${(M)_lines:#?[MTD] *}} )); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    _has_changes=1
  fi
  if (( ${#${(M)_lines:#\?\? *}} )); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    _has_changes=1
  fi
  if (( ${#${(M)_lines:#UU *}} )); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    _has_changes=1
  fi

  if (( ! _has_changes )); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check branch tracking status
  if [[ "$_branch_status" == *ahead* ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if [[ "$_branch_status" == *behind* ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if [[ "$_branch_status" == *diverged* ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if command git rev-parse --verify refs/stash &> /dev/null; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo "$_STATUS"
}

vero_git_prompt () {
  local _branch=$(vero_git_branch)
  local _status=$(vero_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo "$_result"
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%} (ssh)"
  fi
}

function node_prompt_info() {
  command -v node &>/dev/null || return
  local node_ver=${$(node --version)#v}
  local _prefix="${ZSH_THEME_NODE_PROMPT_PREFIX:-$ZSH_THEME_NVM_PROMPT_PREFIX}"
  local _suffix="${ZSH_THEME_NODE_PROMPT_SUFFIX:-$ZSH_THEME_NVM_PROMPT_SUFFIX}"
  echo "${_prefix}${node_ver}${_suffix}"
}

function nvm_prompt_info() {
  node_prompt_info
}

function python_prompt_info() {
  local python_cmd
  if command -v python &>/dev/null; then
    python_cmd=python
  elif command -v python3 &>/dev/null; then
    python_cmd=python3
  else
    return
  fi
  local python_ver="${$($python_cmd --version 2>&1)#Python }"
  local _prefix="${ZSH_THEME_PYTHON_PROMPT_PREFIX:-$ZSH_THEME_PYENV_PROMPT_PREFIX}"
  local _suffix="${ZSH_THEME_PYTHON_PROMPT_SUFFIX:-$ZSH_THEME_PYENV_PROMPT_SUFFIX}"
  echo "${_prefix}${python_ver}${_suffix}"
}

function pyenv_prompt_info() {
  python_prompt_info
}

_PATH="%{$fg_bold[white]%}%~%{$reset_color%} "

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}

vero_precmd () {
  _TIME="%*"
  _ENV_LINE="$(python_prompt_info) $(node_prompt_info) $(vero_git_prompt)"
  _SSH="$(ssh_connection) "
  _PROMPT="$_TIME$_SSH$_USERNAME:$_PATH$_ENV_LINE"
  print
  print -rP "$_PROMPT"
}

setopt prompt_subst
PROMPT='λ $_LIBERTY '

autoload -U add-zsh-hook
add-zsh-hook precmd vero_precmd
