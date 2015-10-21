install:
	mkdir -p ${HOME}/.vim/bundle
	test -d ${HOME}/.vim/bundle/neobundle.vim || git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
	rm -rf ${HOME}/.vimrc
	rm -rf ${HOME}/.zshrc
	ln -sf ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
	ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
