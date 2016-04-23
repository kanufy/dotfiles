install:
	mkdir -p ${HOME}/.vim/dein
	rm -rf ${HOME}/.vimrc
	rm -rf ${HOME}/.zshrc
	ln -sf ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
	ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
