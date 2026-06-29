install: install-brew
	mkdir -p ${HOME}/.vim/dein
	mkdir -p ${HOME}/.config/fish
	rm -rf ${HOME}/.vimrc
	rm -rf ${HOME}/.zshrc
	mv ${HOME}/.config/fish/ ${HOME}/.config/oldfish
	ln -sf ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
	#ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
	ln -s ${HOME}/dotfiles/fish ${HOME}/.config/

install-brew:
	brew bundle

clean-brew:
	brew bundle cleanup
