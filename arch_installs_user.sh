sudo pacman -S python python2 python-pip python2-pip 
sudo pacman -S xorg-xclipboard trash-cli otf-fira-code #ttf-inconsolata
sudo pacman -S ranger w3m
sudo pacman -S feh xcompmgr transset-df util-linux neofetch
sudo pacman -S feh fish

pip install neovim
pip install autopep8
pip2 install autopep8
pip2 install neovim 


echo 'setxkbmap -model abnt2 -layout br' >> .xinitrc
echo '#feh --bg-fill img.jpg' >> .xinitrc
echo 'xcompmgr -c &' >> .xinitrc

echo 'while true; do' >> .xinitrc
echo '  xsetroot -name "$(date +"%F %R")"' >> .xinitrc
echo '  sleep 1m' >> .xinitrc
echo 'done &' >> .xinitrc

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
echo 'set relativenumber' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'if filereadable(expand("personal.vim"))' >> ~/.config/nvim/init.vim
echo '  source personal.vim' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim

#-----------------------------------------------------------------------------
sudo chsh $(whoami) -s  $(which fish)

curl -L https://get.oh-my.fish | fish

fish -c 'omf install agnoster'

#sudo chsh $(whoami) -s  $(which zsh)

## ZSH MELHORADO
#zsh -c 'git clone -b arch --recursive https://github.com/ArthurJ/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
#zsh -c 'setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do; ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done'
#zsh -c 'cd $ZPREZTODIR'

#git pull
#git submodule update --init --recursive

cd
#-----------------------------------------------------------------------------

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#-----------------------------------------------------------------------------

echo 'neofetch' >> ~/.profile
echo '' >> ~/.profile

echo 'exit_sig(){' >> ~/.profile
echo '    exit' >> ~/.profile
echo '}' >> ~/.profile

echo 'if [[ "$(tty)" = "/dev/tty1" ]]; then' >> ~/.profile
echo '    pgrep -x dwm || startx &' >> ~/.profile
echo 'fi' >> ~/.profile

echo 'if [[ "$(tty)" = "/dev/tty2" ]]; then' >> ~/.profile
echo '    pgrep -x gotop || gotop ' >> ~/.profile
echo 'fi' >> ~/.profile

echo 'if [[ "$(tty)" = "/dev/tty3" ]]; then' >> ~/.profile
echo '    set -m ' >> ~/.profile
echo '    trap exit_sig 2 ' >> ~/.profile
echo '    pgrep -x dmesg || dmesg HweL ' >> ~/.profile
echo 'fi' >> ~/.profile

#-----------------------------------------------------------------------------

# Logar automaticamente no tty2 e tty3 (que vão rodar gotop e dmesg)

sudo systemctl enable getty@tty2.service
sudo systemctl edit getty@tty2
    # [Service]
    # ExecStart= 
    # ExecStart=-/usr/bin/agetty  --autologin arthur %I $TERM

sudo systemctl enable getty@tty3.service
sudo systemctl edit getty@tty3
    # [Service]
    # ExecStart= 
    # ExecStart=-/usr/bin/agetty  --autologin arthur %I $TERM