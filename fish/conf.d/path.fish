set -x PATH /usr/local/opt/mysql-client/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
pyenv init - | source

# Remove redundant paths
set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)

