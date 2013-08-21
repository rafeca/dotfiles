 # Load RVM into a shell session *as a function*
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# rvm zsh completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# add rvm info to right prompt
rvm_hook () {
  export RPROMPT="`$rvm_path/bin/rvm-prompt v g` $RPROMPT"
}
precmd_functions+=(rvm_hook)