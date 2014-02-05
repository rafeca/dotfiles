 # Load RVM into a shell session *as a function*
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# rvm zsh completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

default_ruby=`rvm list default string`

# add rvm info to right prompt
rvm_hook () {
  # only show ruby version if it's different than the default one
  if [ "`rvm-prompt i v p g`" != $default_ruby ]
  then
    export RPROMPT="`rvm-prompt v g` $RPROMPT"
  fi
}
precmd_functions+=(rvm_hook)
