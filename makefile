# Deprecated
install:
	@echo "`make install` is no longer supported, please use `make install-omz` to install for Oh-My-Zsh, or view README.md for additional installation options."

# Deprecated
link:
	@echo "`make link` is no longer supported, please use `make link-omz` to install for Oh-My-Zsh, or view README.md for additional installation options."

# Installs a copy of the theme on the folder `~/.oh-my-zsh/themes/`
install-omz:
	cp ./vero.zsh-theme ~/.oh-my-zsh/custom/themes/

# Symlinks the theme for easier development
link-omz:
	ln -sF `pwd`/vero.zsh-theme ~/.oh-my-zsh/themes/
