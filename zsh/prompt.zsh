# Inspired by https://github.com/holman/dotfiles/blob/master/zsh/prompt.zsh
autoload colors && colors

git="git"
hg="hg"

git_dirty() {
  # git information
  st=$($git status --porcelain 2>/dev/null | tail -n 1)
  if [[ $st =~ ^fatal ]]
  then
    echo ""
  else
    if [[ $st = "" ]]
    then
      echo "%{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "%{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

hg_dirty() {
  # mercurial information
  if [ -d .hg ]; then
    if [[ $($hg status) = "" ]]
    then
      echo "%{$fg[green]%}$(hg_prompt_info)%{$reset_color%}"
    else
      echo "%{$fg[red]%}$(hg_prompt_info)%{$reset_color%}"
    fi


  fi
}

get_hg_path() {
  d=$(pwd)
  while : ; do
    if test -d "$d/.hg" ; then
      hg=$d
      break
    fi
    test "$d" = / && break
    d=$(cd -P "$d/.." && echo "$PWD")
  done
  echo $d
}

hg_prompt_info () {
  local current="$(get_hg_path)/.hg/bookmarks.current"
  if  [[ -f "$current" ]]; then
    echo "{$(cat "$current")} "
  else
    echo "{default} "
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref --short HEAD 2>/dev/null || $git describe --tags --exact-match 2>/dev/null || $git rev-parse --short HEAD 2>/dev/null) || return
 echo "($ref) "
}

git_need_push () {
  if [[ $($git cherry -v @{upstream} 2>/dev/null) == "" ]]
  then
    echo ""
  else
    echo "%{$fg[magenta]%}!%{$reset_color%} "
  fi
}

directory_name () {
  echo "%{$fg[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'$(directory_name) $(git_dirty)$(git_need_push)$(hg_dirty)'
set_prompt () {
  export RPROMPT="%{$fg[yellow]%}[%T]%{$reset_color%}"
}

set_terminal_title () {
  # set terminal title to the current folder
  echo -ne "\e]0;${PWD##*/}\a"
}

precmd_functions+=(set_prompt set_terminal_title)
