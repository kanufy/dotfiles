if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (pyenv init - | source)
    eval (pyenv virtualenv-init - | source)
    set -x PYENV_ROOT (pyenv root)
end
