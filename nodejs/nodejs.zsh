# add nvm completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# add npm completion
source <(npm completion)

# add node version info to right prompt
nvm_hook () {
  if [ -f package.json ]; then
    version=`node -v`
    export RPROMPT="${version/v/} $RPROMPT"
  fi
}
precmd_functions+=(nvm_hook)
