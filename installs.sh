sudo dpkg -i -R debs # Instala os debs contidos na pasta

sudo apt-add-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:git-core/ppa -y

sudo apt-get update && sudo apt-get dist-upgrade

sudo apt-get install python3.6* -y # Instala a ultima versão do python

sudo apt-get install calibre cheese conky conky-all cowsay figlet file-roller gedit-plugins git grub-customizer hddtemp htop libdvdread4 libreoffice lm-sensors meld ncurses-term openssh-server p7zip p7zip-full p7zip-rar python-dev python-docutils python-pip python-sqlite python-virtualenv python3-numpy python3-pandas python3-pip python3-scipy ipython3 r-base r-base-dev rar sharutils sqlformat terminator traceroute transmission transmission-gtk trash-cli tree unace arj cabextract unrar zip unzip mpack uudeview usb-creator-gtk vim xclip zsh  gcc ntfs-3g -y

sudo apt-get autoclean -y
sudo apt-get autoremove -y

apm install --packages-file package-list.txt # Instala os pacotes do atom

# A instalar:
## Drivers adicionais
## Pycharm
## IntelliJ
## Slack
## Clojure
## Scala
## FileZilla
## yEd
## Spark
## Java JDK


##Ajuste do ssh
