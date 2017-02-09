# Installs a copy of the theme on the folder `~/.oh-my-zsh/themes/`
install:
	cp ./vero.zsh-theme ~/.oh-my-zsh/themes/vero.zsh-theme

# Symlinks the theme for easier development
link:
	ln -sF `pwd`/vero.zsh-theme ~/.oh-my-zsh/themes/
