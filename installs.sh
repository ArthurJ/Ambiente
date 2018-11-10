# NÃO EXECUTAR COM SUDO

sudo apt --fix-broken install

sudo dpkg -i -R debs # Instala os debs contidos na pasta

sudo apt-add-repository ppa:danielrichter2007/grub-customizer
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:neovim-ppa/stable

sudo add-apt-repository ppa:snwh/ppa # Paper Theme

sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -


sudo apt-get update -y && sudo apt-get dist-upgrade -y


sudo apt install arj -y
sudo apt install autokey-common -y
sudo apt install autokey-gtk -y
sudo apt install arp-scan -y
sudo apt install cabextract -y
sudo apt install calibre -y
sudo apt install cheese -y
sudo apt install cowsay -y
sudo apt install curl -y
sudo apt install figlet -y
sudo apt install file-roller -y
sudo apt install gcc -y
sudo apt install git -y
sudo apt install gparted -y
sudo apt install gedit-plugins -y
sudo apt install hddtemp -y
sudo apt install htop -y
sudo apt install libdvdread4 -y
sudo apt install libreoffice -y
sudo apt install lm-sensors -y
sudo apt install lynx -y
sudo apt install meld -y
sudo apt install mpack -y
sudo apt install ncurses-term -y
sudo apt install ntfs-3g -y
sudo apt install neovim -y
sudo apt install network-manager-openvpn -y
sudo apt install network-manager-openvpn-gnome -y
sudo apt install nmap -y
sudo apt install openssh-server -y
sudo apt install openvpn -y
sudo apt install p7zip -y
sudo apt install p7zip-full -y
sudo apt install postfix -y
sudo apt install p7zip-rar -y
sudo apt install opera-stable -y

sudo apt-get install gnome-tweak-tool -y
sudo apt-get install chrome-gnome-shell -y

sudo apt install grub-customizer -y
sudo apt install gtk2-engines-murrine -y
sudo apt install libglib2.0-dev -y
sudo apt install libxml2-utils -y
sudo apt install gnome-themes-standard -y

sudo apt install paper-icon-theme -y

sudo apt install python-dev python-docutils python-pip python-virtualenv -y
sudo apt install python3 python3-numpy python3-pip python-setuptools python3-setuptools -y

sudo apt install rar -y
sudo apt install screen  -y
sudo apt install sharutils -y
sudo apt install sqlformat -y
sudo apt install terminator -y
sudo apt install tortoisehg -y
sudo apt install traceroute -y
sudo apt install transmission transmission-gtk  -y
sudo apt install trash-cli -y
sudo apt install tree -y

sudo apt install ttf-dejavu ttf-mscorefonts-installer ttf-xfree86-nonfree -y

sudo apt install unace -y
sudo apt install unrar -y
sudo apt install unzip -y
sudo apt install usb-creator-gtk -y
sudo apt install uudeview -y
sudo apt install xclip -y
sudo apt install zip -y
sudo apt install zsh -y

sudo apt-get autoclean -y
sudo apt-get autoremove -y

# pip  install selenium
# pip  install pdfminer

pip3  install autopep8
pip3  install ipython
pip3  install neovim
pip3  install jupyter

#pip3  install pydotplus
#pip3  install nltk
#pip3  install pyzabbix

#------------------------------------------------------------------------------

mkdir -p ~/Stuff/Downloads

#------------------------------------------------------------------------------
cd ~/Stuff/Downloads
wget https://repo.continuum.io/archive
export ANACONDA=`cat index.html | grep Anaconda3 | grep Linux-x86_64 | sort  | tail -n 1 | lynx -dump -nolist -stdin | awk '{print $1}' | head -n 1`
wget https://repo.continuum.io/archive/$ANACONDA


cd ~
#-----------------------------------------------------------------------------

mkdir -p ~/.config/nvim
curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=c&langs=html&langs=elixir&langs=erlang&langs=haskell&langs=lisp&langs=lua&langs=python&langs=rust&editor=nvim' > ~/.config/nvim/init.vim

cp ~/Ambiente/local_bundles.vim ~/.config/nvim/
cp ~/Ambiente/personal.vim ~/.config/nvim/

echo '' >> ~/.config/nvim/init.vim
echo 'if filereadable(expand("~/personal.vim"))' >> ~/.config/nvim/init.vim
echo '  source ~/personal.vim' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim
#-----------------------------------------------------------------------------

firefox -newtab \
-url "https://filezilla-project.org/download.php?type=client" \
-url "http://tomcat.apache.org" \
-url "https://lucidworks.com/download/" \
-url "http://www.oracle.com/technetwork/pt/java/javase/downloads/index.html" \
-url "https://www.jetbrains.com/pycharm/download/#section=linux" \
-url "https://www.jetbrains.com/idea/download/#section=linux" \
-url "https://spark.apache.org/downloads.html" \
-url "https://snwh.org/paper/download"
-url "https://www.opera.com/pt/computer/linux"

opera https://extensions.gnome.org
opera https://extensions.gnome.org/extension/19/user-themes/ &
opera https://extensions.gnome.org/extension/7/removable-drive-menu/ &
opera https://extensions.gnome.org/extension/1036/extensions/ &
opera https://extensions.gnome.org/extension/750/openweather/ &
opera https://extensions.gnome.org/extension/906/sound-output-device-chooser/ &

sudo chsh $(whoami) -s  $(which zsh)

# ZSH MELHORADO
zsh -c 'git clone --recursive git@github.com:ArthurJ/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
zsh -c 'setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do; ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done'
zsh -c 'cd $ZPREZTODIR'

git pull
git submodule update --init --recursive

cd

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

cd /tmp && wget -qO - https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
cd materia-theme-master
sudo ./install.sh
