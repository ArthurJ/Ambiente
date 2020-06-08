Arch Linux

Instalação:

https://www.youtube.com/watch?v=VUq9r--Rkx4
Maior parte OK, porém o grub não funcionou bem dentro do VMWare
Para o VMWare, usei:
https://chaseafterstart.github.io/

Nesses links, coisas importantes:
    - Instalar o pacote networkmanager e usar em seguida o comando `systemctl enable NetworkManager`

Nesses links, coisas importantes (Especificas para o VMWare):
    - Alterar o arquivo .vmx, acrescentando uma linha com `firmware = "efi"` antes de iniciar a VM
    - Instalar o pacote refind-efi e em seguida usar o comando `refind-install`
        -  Basically, where you see the part that says something like ro root=UUID-...-6d73ae6b5332, 
        it needs to be placed on the line "boot with standard options" and the other two need to be deleted. Also, replace the ro with rw.
    
Ordem de eventos:
    - Check de rede e ajuste de timedate e keyboard
        `loadkeys br-abnt2`
        `ping 8.8.8.8`
        `timedatectl set-ntp true`
        `ls /sys/firmware/efi/efivars`  # (Apenas para VMWare) Verifica se o sistema é efi

    - Partição de discos (Boot=512MiB Efi, Swap~=min(10G,2xRAM), root=20G Linux filesystem, home=(o que sobrar) Linux filesystem)
        `cfdisk /dev/sda` 
        #escolher gpt
        #criar e definir tipo de cada uma
        #Write
        #Quit & yes
        `lsblk`     # verificar partições... `gdisk -l /dev/sda` também pode ser usado
        
        `free -m`   # verificar memória antes
        `mkswap /dev/sda2`  # Define área de swap
        `swapon /dev/sda2`  # Liga o Swap
        `free -m`    # verificar se funcionou

        `mkfs.fat -F32 /dev/sda1`
        `mkfs.ext4 /dev/sda3`
        `mkfs.ext4 /dev/sda4`

        `mount /dev/sda3 /mnt`

        `mkdir -p /mnt/boot/efi`
        `mount /dev/sda1 /mnt/boot`

        `mkdir /mnt/home`
        `mount /dev/sda4 /mnt/home`

    - Instalação dos pacotes *essênciais*
        `pacstrap /mnt base base-devel linux linux-firmware`
        `lsblk`

    - Configuração de sistema
        `genfstab -U /mnt >> /mnt/etc/fstab`

        `arch-chroot /mnt`  # IMPORTANTE: loga na máquina final

        `echo KEYMAP=br-abnt2 >> /etc/vconsole.conf`
        
        `ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime`
        `hwclock --systohc`
        
        `pacman -S nano neovim zsh networkmanager firefox git ntfs-3g openssh`
        
        `systemctl enable NetworkManager`   #Bota a rede pra funcionar
        
        `nano /etc/locale.gen` # Descomentar a linha de ingles e de portugues
        `locale-gen`
        `echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf`
        
        `echo nome_do_computador >> /etc/hostname`
        `nano /etc/hosts`
            #127.0.0.1  localhost
            #::1        localhost
            #127.0.1.1  nome_do_computador.localdomain  nome_do_computador
        
        `mkinitcpio -P` # cria um disco de inicialização padronizado

        `passwd` # Definir senha de root
        `useradd -G wheel -s /bin/zsh -m -c "Usuário" usuário`    # adicionar usuário
        `gpasswd -a usuario audio`
        `passwd usuário`
        `nano /etc/sudoers`
            # descomentar linha para permitir que integrantes do grupo %wheel executem comandos sudo
            # ou acrescentar linha abaixo de `root ALL=(ALL) ALL` com o nome do usuário
            # Descomentar a linha de permissão de comandos sem senha para shutdown, reboot e pacman
        
        `nano /etc/pacman.conf`
            # descomentar a linha `[multilib]` e a liha subsequente
            # descomentar a linha Color
        `nano /etc/pacman.d/mirroslist`
            # Colocar os mirrors brasileiros primeiro, em ordem de proximidade
        `pacman -Syu`

    - Instalação do bootloader
        - refind (para o VMWare)
            `pacman -S refind-efi`
            `refind-install`
            `nano /boot/refind_linux.conf`
                #Basically, where you see the part that says something like ro root=UUID-...-6d73ae6b5332, 
                #it needs to be placed on the line "boot with standard options" and the other two need to be deleted. Also, replace the ro with rw.
        - grub (vida real)
            `pacman -S grub efibootmgr os-prober`
            `grub-install --target=x86_64-efi --bootloader-id=GRUB`
            `grub-mkconfig -o /boot/grub/grub.cfg`

        
    - Instalação da Interface Gráfica
        - Xfce
            `pacman -S xfce4 xfce4-goodies`
            `pacman -S lightdm lightdm-gtk-greeter xorg-server`
            `nano /etc/lightdm/lightdm.conf`
                # dentro de [Seat:*]
                # descomentar a linha `greeter-session=exemple-gtk-gnome`
                # e subistituir o valor para `lightdm-gtk-greeter`
            `systemctl enable lightdm`
            `nano /etc/X11/xorg.conf.d/20-keyboard.conf´    # http://manjaro-linux.com.br/forum/viewtopic.php?t=2117&p=27989
                #Section "InputClass"
                #    Identifier "keyboard"
                #    MatchIsKeyboard "yes"
                #    Option "XkbModel" "pc105"
                #    Option "XkbLayout" "br"
                #    Option "XkbVariant" ""
                #EndSection
        - dwm ( https://stackoverflow.com/questions/31275672/how-to-install-dwm-in-arch-linux )
            `pacman -S xorg-xinit xorg-server xorg git webkit2gtk`
            `cd /usr/src`
            `git clone git://git.suckless.org/dwm`
            `git clone git://git.suckless.org/st`
            `git clone git://git.suckless.org/dmenu`
            `git clone git://git.suckless.org/surf`
            `cd dwm && make clean install && cd ..`
            `cd st && make clean install && cd ..`
            `cd dmenu && make clean install && cd ..`
            `cd surf && make clean install && cd ..`
            `echo setxkbmap -model abnt2 -layout br >> /home/user/.xinitrc`
            `echo exec dwm >> /home/user/.xinitrc`
            `chown user /home/user/.xinitrc`
            `startx`
        

    `exit`
    `umount --all`
    `shutdown -P now`
