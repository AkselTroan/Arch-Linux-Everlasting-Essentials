#!/usr/bin/env bash


    # Set the clock 
	ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
	
	echo ""
	echo "Setting systemclock..."
	echo ""
	hwclock --systohc

	line=en_US.UTF-8 UTF-8; sed -i "/^#$line/ c$line" /etc/locale.gen
	locale-gen
	# echo "LANG=en_US.UTF-8" >> /etc/locale.conf
	
	# Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running: 
	# Create the locale.conf(5) file, and set the LANG variable accordingly:
	# /etc/locale.conf
	# LANG=en_US.UTF-8


	# If you set the console keyboard layout, make the changes persistent in vconsole.conf(5):

	# /etc/vconsole.conf

	#KEYMAP=de-latin1



	# Create the hostname file:

	echo "overlord" >> /etc/hostname
	# /etc/hostname

	# myhostname


	# Add matching entries to hosts(5):

	# 
	cat << EOT >> /etc/hosts
	127.0.0.1		localhost
	::1				localhost
	127.0.1.1		overlord
EOT
	
	echo ""
	echo ""
	echo "Setting root password"

	# Set password
	passwd

	echo ""
	echo ""
	echo "Adding a new user"
	echo ""
	echo ""
	useradd -m troan
	echo "Setting password for troan"
	passwd troan

	echo ""
	echo "Granting troan sudo privileges"
	usermod -aG wheel,audio,video,optical,storage troan
	echo ""
	echo ""

	echo "Installing sudo"
	echo ""
	pacman -S sudo

	echo ""
	echo "Editing visudo and granting wheel group sudo privileges"
	echo '%wheel ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo
	echo ""

	echo "Installing grub and other boot essentials"
	pacman -S grub efibootmgr dosfstools os-prober mtools

	echo ""
	echo "Setting up EFI"
	echo ""
	mdkir /boot/EFI
	mount /dev/sda1 /boot/EFI

	echo ""
	echo "Setting up grub..."
	echo ""

	grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

	grub-mkconfig -o /boot/grub/grub.cfg

	echo "Installing some essentials tools..."
	
	pacman -S networkmanager git 

	systemctl enable NetworkManager

	exit 
	umount -l /mnt

	echo "Please shutdown the machine, remove the installation media and boot up again"
