# NÃO EXECUTAR COM SUDO

sudo apt --fix-broken install

sudo dpkg -i -R debs # Instala os debs contidos na pasta

sudo apt-add-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:neovim-ppa/stable -y

sudo add-apt-repository ppa:snwh/pulp # Paper Theme

sudo apt-get update -y && sudo apt-get dist-upgrade -y


sudo apt install \
grub-customizer \
gtk2-engines-murrine \
paper-icon-theme \
libglib2.0-dev \
libxml2-utils \
gnome-themes-standard \
paper-cursor-theme -y


sudo apt install paper-gtk-theme -y


sudo apt install \
arj \
arp-scan \
cabextract \
calibre \
cheese \
cowsay \
curl \
figlet \
file-roller \
gcc \
git \
gparted \
gedit-plugins \
hddtemp \
htop \
libdvdread4 \
libreoffice \
lm-sensors \
lynx \
meld \
mpack \
ncurses-term \
ntfs-3g \
neovim \
network-manager-openvpn \
network-manager-openvpn-gnome \
nmap \
openssh-server \
openvpn \
p7zip \
p7zip-full \
p7zip-rar -y

sudo apt install \
python-dev \
python-docutils \
python-pip \
python-virtualenv -y


sudo apt install \
python3 \
python3-numpy \
python3-pip \
python-setuptools \
python3-setuptools \
rar \
screen \
sharutils \
sqlformat \
terminator \
tortoisehg \
traceroute \
transmission \
transmission-gtk \
trash-cli \
tree \
ttf-dejavu \
ttf-mscorefonts-installer \
ttf-xfree86-nonfree \
unace \
unrar \
unzip \
usb-creator-gtk \
uudeview \
xclip \
zip \
zsh -y

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

mkdir -p ~/Stuff
mkdir -p ~/Stuff/Downloads

#------------------------------------------------------------------------------
cd ~/Stuff/Downloads
wget https://repo.continuum.io/archive
export ANACONDA=`cat index.html | grep Anaconda3 | grep Linux-x86_64 | sort  | tail -n 1 | lynx -dump -nolist -stdin | awk '{print $1}' | head -n 1`
wget https://repo.continuum.io/archive/$ANACONDA


cd ~
#-----------------------------------------------------------------------------

mkdir -p ~/.config/nvim
curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=c&langs=html&langs=ruby&langs=elixir&langs=erlang&langs=go&langs=haskell&langs=lisp&langs=lua&langs=python&langs=ruby&langs=rust&editor=nvim' > ~/.config/nvim/init.vim

cp local_bundles.vim ~/.config/nvim
cp personal.vim ~/.config/nvim

echo '' >> ~/.config/nvim/init.vim
echo 'if filereadable(expand("~/personal.vim"))' >> ~/.config/nvim/init.vim
echo '  source ~/personal.vim' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim

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
