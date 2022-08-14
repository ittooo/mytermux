#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage
pkg update
pkg install vim curl wget git exa neofetch zsh -y
pkg install fzf openssh proot tracepath nmap dnsutils termux-api tsu hping3 termux-tools

echo "echo 'Welcome Termux!'" > $PREFIX/etc/motd.sh

git clone https://gitee.com/ittooo/mytermux "$HOME/mytermux" --depth 1

rm  -rf "$HOME/.termux"
mkdir ".termux"
cp  "$HOME/mytermux/.termux/termux.properties" "$HOME/.termux/termux.properties"

ln -s -T "$HOME/mytermux/zshrc" "$HOME/.zshrc"

ln -s -T "$HOME/mytermux/vimrc" "$HOME/.vimrc"
echo "continue or break? put 1 or 2"
		read var
		case $var in
			"1")
				ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    			        mkdir -p "$(dirname $ZINIT_HOME)"
    			        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

				curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
				https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

				chsh -s zsh
				continue
				;;
			"2")
				break
				;;
				*)
				break
				;;
		esac
