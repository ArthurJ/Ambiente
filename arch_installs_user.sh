sudo pacman -S python python2 python-pip python2-pip xorg-xclipboard trash-cli otf-fira-code

pip install neovim
pip install autopep8
pip2 install autopep8
pip2 install neovim 

echo 'setxkbmap -model abnt2 -layout br' >> .xinitrc
echo 'exec dwm' >> .xinitrc

mkdir -p ~/Stuff/Downloads
cd ~/Stuff
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
cd -


mkdir -p ~/.config/nvim
curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=c&langs=elixir&langs=erlang&langs=haskell&langs=lisp&langs=lua&langs=python&langs=rust&editor=nvim' > ~/.config/nvim/init.vim

cp ~/Ambiente/local_bundles.vim ~/.config/nvim/
cp ~/Ambiente/personal.vim ~/.config/nvim/

echo '' >> ~/.config/nvim/init.vim
echo 'if filereadable(expand("personal.vim"))' >> ~/.config/nvim/init.vim
echo '  source personal.vim' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim

#-----------------------------------------------------------------------------
sudo chsh $(whoami) -s  $(which zsh)

# ZSH MELHORADO
zsh -c 'git clone -b arch --recursive https://github.com/ArthurJ/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
zsh -c 'setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do; ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done'
zsh -c 'cd $ZPREZTODIR'

git pull
git submodule update --init --recursive

cd
#-----------------------------------------------------------------------------

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#-----------------------------------------------------------------------------

echo 'if [[ "$(tty)" = "/dev/tty1" ]]; then' >> ~/.profile
echo '    pgrep dwm || startx &' >> ~/.profile
echo 'fi' >> ~/.profile