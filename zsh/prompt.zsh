# Inspired by https://github.com/holman/dotfiles/blob/master/zsh/prompt.zsh
autoload colors && colors

git="git"

git_dirty() {
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

git_prompt_info () {
 ref=$($git symbolic-ref --short HEAD 2>/dev/null || $git describe --tags --exact-match 2>/dev/null || $git rev-parse --short HEAD 2>/dev/null) || return
 echo "($ref) "
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo "%{$fg[magenta]%}!%{$reset_color%} "
  fi
}

directory_name () {
  echo "%{$fg[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'$(directory_name) $(git_dirty)$(need_push)'
set_prompt () {
  export RPROMPT="%{$fg[yellow]%}[%T]%{$reset_color%}"
}

set_terminal_title () {
  # set terminal title to the current folder
  echo -ne "\e]0;${PWD##*/}\a"
}

precmd_functions+=(set_prompt set_terminal_title)
