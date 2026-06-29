set -gx JAVA_HOME (/usr/libexec/java_home -v 17)
set -gx PATH /opt/homebrew/opt/openjdk@17/bin $PATH

set PATH /opt/homebrew/opt/mysql-client/bin $PATH
set PATH /opt/homebrew/opt/mysql@5.7/bin $PATH
set PATH $HOME/.nodebrew/current/bin $PATH
set PATH /opt/homebrew/bin $PATH
pyenv init - | source
set -x PYENV_ROOT $HOME/.pyenv
set PATH  $PYENV_ROOT/bin $PATH
set -x PKG_CONFIG_PATH $(brew --prefix)/opt/mysql-client/lib/pkgconfig $PKG_CONFIG_PATH


# Remove redundant paths
set -gx PATH (echo $PATH | tr ' ' '\n' | sort -u)
