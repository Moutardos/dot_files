
## virtual env
export WORKON_HOME=$HOME/.virtualenvs
# check python exec path
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALfish_add_path $HOME/.local/bin
set ENV_ARGS ' -p /usr/bin/python3 '
export PROJECT_HOME=$HOME/Documents/42
source $HOME/.local/bin/fishenv.fish

## theming
starship init fish | source

## shortcut
alias cd42 'cd $HOME/Documents/42'
alias djangoenv 'cd $HOME/Documents/work/training_django; workon training_django'
