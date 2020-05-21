#git clone https://github.com/ArthurJ/Ambiente.git

sudo pacman -S python python2 python-pip python2-pip 
sudo pacman -S xterm xorg xorg-xinit xorg-xclipboard trash-cli otf-fira-code #ttf-inconsolata
sudo pacman -S ranger w3m feh
sudo pacman -S kitty
sudo pacman -S neofetch fish numlockx

pip install neovim
pip install autopep8
pip2 install autopep8
pip2 install neovim 



echo 'setxkbmap -model abnt2 -layout br' >> .xinitrc

echo 'xrand --output HDMI-1 --mode 1920x1080' >> .xinitrc # rodar ANTES o xrandr para ver os modos disponíveis
echo 'feh --no-fehbg --bg-fill $(shuf -n 1 imag.list)' >> .xinitrc # depende desse arquivo criado, talvez usar as imagens da wikipedia seja uma boa

echo 'compton --config ~/.config/compton/compton.conf &' >> ~/.xinitrc # depende da instalação do compton
echo 'numlockx &' >> .xinitrc

echo 'exec spectrwm' >> .xinitrc

#-----------------------------------------------------------------------------
mkdir ~/Stuff
#-----------------------------------------------------------------------------
mkdir -p ~/.config/compton
mkdir -p ~/.config/kitty
mkdir -p ~/.config/ranger
#-----------------------------------------------------------------------------

echo 'set previre_images true' > ~/.config/ranger/rc.local

# ~/.config/kitty/kitty.conf
## Pegar o sample pode ser interessante 
# font_family Fira Code Retina
# background_opacity .7
# dynamic_background_opacity yes
# allow_remote_control yes

#-----------------------------------------------------------------------------
sudo pacman -S go

cd ~/Stuff
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S compton-tryone-git
mkdir ~/.config/compton
cp /etc/xdg/compton.conf.example ~/.config/compton/compton.conf

# Mudanças
# inactive e active_opacity (define o máximo, .85) [0-1]
# blur_strength = 10 [1-20]
# backend = "glx"
# mark-ovredir-focused = false
# Mudar o fade-in e fad-out para 0.1, para diminuir o tempo de espera do efeito
# (provavelmente 1=imediato, 0.001=muito lentamente)

cd ~
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------

cd /usr/bin
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
cd -

#-----------------------------------------------------------------------------
mkdir -p ~/.config/nvim
curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=c&langs=elixir&langs=erlang&langs=haskell&langs=lisp&langs=lua&langs=python&langs=rust&editor=nvim' > ~/.config/nvim/init.vim

cp ~/Ambiente/local_bundles.vim ~/.config/nvim/
cp ~/Ambiente/personal.vim ~/.config/nvim/

echo '' >> ~/.config/nvim/init.vim
echo 'set relativenumber' >> ~/.config/nvim/init.vim
echo 'set clipboard+=unnamedplus' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'if filereadable(expand("personal.vim"))' >> ~/.config/nvim/init.vim
echo '  source personal.vim' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim

#-----------------------------------------------------------------------------
cp ~/Ambiente/personal.fish ~/.config/fish/config.d/

curl -L https://get.oh-my.fish | fish

omf install lambda
#-----------------------------------------------------------------------------

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#-----------------------------------------------------------------------------

echo 'set -g -x EDITOR nvim' >> ~/.profile

#-----------------------------------------------------------------------------

#echo 'exit_sig(){' >> ~/.profile
#echo '    exit' >> ~/.profile
#echo '}' >> ~/.profile
#
#echo 'if [[ "$(tty)" = "/dev/tty1" ]]; then' >> ~/.profile
#echo '    pgrep -x Xorg || startx &' >> ~/.profile
#echo 'fi' >> ~/.profile
#
#echo 'if [[ "$(tty)" = "/dev/tty2" ]]; then' >> ~/.profile
#echo '    pgrep -x gotop || gotop ' >> ~/.profile
#echo 'fi' >> ~/.profile
#
#echo 'if [[ "$(tty)" = "/dev/tty3" ]]; then' >> ~/.profile
#echo '    set -m ' >> ~/.profile
#echo '    trap exit_sig 2 ' >> ~/.profile
#echo '    pgrep -x dmesg || dmesg HweL ' >> ~/.profile
#echo 'fi' >> ~/.profile

# Logar automaticamente no tty2 e tty3 (que vão rodar gotop e dmesg)

# Com o fish não dá pra desabilitar os sinais de saida nem de suspensão
# Nesse caso vale criar um usuario sem permissões apenas para monitoramento

#sudo systemctl enable getty@tty2.service
#sudo systemctl edit getty@tty2
    # [Service]
    # ExecStart= 
    # ExecStart=-/usr/bin/agetty  --autologin arthur %I $TERM

#sudo systemctl enable getty@tty3.service
#sudo systemctl edit getty@tty3
    # [Service]
    # ExecStart= 
    # ExecStart=-/usr/bin/agetty  --autologin arthur %I $TERM