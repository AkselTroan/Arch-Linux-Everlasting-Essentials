#!/usr/bin/env bash

# Colors
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
CYAN=$'\e[1;36m'
ENDCOLOR=$'\e[0m'
MAGENTA=$'\e[1;35m'

# Clearing terminal
cls='printf "\033c"'

# Usefull variables
arrow=' ==> '
newline=$'\n'

clear
echo ""
echo "$CYAN"
echo ' █████╗ ██████╗  ██████╗██╗  ██╗    ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗
██╔══██╗██╔══██╗██╔════╝██║  ██║    ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝
███████║██████╔╝██║     ███████║    ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██╔══██║██╔══██╗██║     ██╔══██║    ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ 
██║  ██║██║  ██║╚██████╗██║  ██║    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝
'
echo "$ENDCOLOR"

echo "$GREEN"
echo '✩░▒▓▆▅▃▂▁𝐀𝐫𝐜𝐡 𝐋𝐢𝐧𝐮𝐱 || 𝐄𝐯𝐞𝐫𝐥𝐚𝐬𝐭𝐢𝐧𝐠 𝐄𝐬𝐬𝐞𝐧𝐭𝐢𝐚𝐥𝐬▁▂▃▅▆▓▒░✩'
echo 'Found at: https://github.com/AkselTroan/Arch-Linux-Everlasting-Essentials.git'
echo 'Written by Aksel Troan'
echo "$ENDCOLOR"


dirExsists(){
echo ""
	if [ -d $1 ]
	then
		echo "$GREEN [O.K] Found $1 $ENDCOLOR"
	else
		echo "$RED [Error]: Can't find $1, Creating directory... $ENDCOLOR"
		mkdir -p $1
		
		if [ $? -eq 0 ]; then
    		echo "$GREEN Successfully created directory $ENDCOLOR"
		else
    		echo "$RED Failed to create directory $ENDCOLOR"
		fi

	fi


}


install_packages(){
	while read -r line; do sudo pacman -S --needed $line; done < ./Resources/package_list.txt
}

setup_dotfiles(){
	echo ""
	echo "$CYAN [Dotfiles] $ENDCOLOR Symlink dotfiles"
	echo ""
	for dotfile in $dotsDetect; do
    	ln -svfn $dots$dotfile ~/$dotfile 2>/dev/null
	done;
	
}

setup_config(){
	# Symlinks all files that goes in /home/$USER/.config
	echo ""
	echo "$CYAN [DotConfigs] $ENDCOLOR Symlink dotconfig"
	echo ""
    dirExsists $HOME/.config
    for dotconfig in $confsDetect; do
        ln -svfn $confs$dotconfig ~/.config/$dotconfig
done;
read
echo

}
install_arch_linux(){  # This is predefined to my personal prefrences
	
	# Pre-installation


	# Verify the bootmode

	echo "HAVE TO SET THE PARTION CORRECT? FOLLOW MY TEMPLATE BEFOREHAND!!!"
	echo "Verify boot mode"
	echo ""
	echo ""
	echo ""

	ls /sys/firmware/efi/efivars


	# Network settings

	echo "Starting network setup..."
	echo "Cheking for ip adress"
	echo ""
	ip link


	echo "For wireless connection, make sure the card is not blocked with rfkill."
	echo "Use the tool iwctl for connecting to a wifi"

	echo "Testing if there is a internet connection"
	echo "pinging google.com"

	ping -c 5 google.com

	echo ""
	echo ""

	# Update the system clock
	echo "Updating the system clock"
	timedatectl set-ntp true
	echo ""

	echo "Checking status for the sytem clock"
	timedatectl status
	echo ""
	echo ""

	# Partition the disks

	# /dev/sda
	# GPT label type
	 
	# dev/sda1
	# First sector = default
	# Last sector = +550M
	# Type = 1(EFI System)

	# /dev/sda2
	# First sector = default
	# Last sector = +2G
	# Type = 19(Linux Swap)

	# /dev/sda3
	# First Sector = default
	# Last sector = default(Remaining space)
	# Type = 20(Linux Filesystem)

	# Remeber to write table 

	echo "Making filesystem"

	mkfs.fat -F32 /dev/sda1

	mkswap /dev/sda2

	swapon /dev/sda2

	mkfs.ext4 /dev/sda3

	mount /dev/sda3 /mnt

	echo ""
	echo ""
	echo "Installing base, Linux and Linux Firmware..."
	echo ""
	echo ""
	pacstrap /mnt base linux linux-firmware

	genfstab -U /mnt >> /mnt/etc/fstab

	# For some reason the script can go on with the script. Need to spit the rest of installatio in another script and call it here.
	arch-chroot /mnt /scripts/arch-chroot.sh 

}

menu(){
	echo "
$GREEN [MAIN MENU] $ENDCOLOR What do you want to do? $newline$MAGENTA
$MAGENTA 1: $ENDCOLOR Install Packages
$MAGENTA 2: $ENDCOLOR Dotfiles
$MAGENTA 3: $ENDCOLOR Config
$MAGENTA 4: $ENDCOLOR Install Arch Linux
$RED q:  QUIT $ENDCOLOR
"
}

options(){
read -p "$newline$arrow" option
case "$option" in  # For each option given, a function need to be added.
	1 ) echo "$CYAN Installing Arch-Linux-Everlasting-Essentials packages... $ENDCOLOR"
		install_packages
		;;
	2 ) echo "$CYAN Setting up dotfiles... $ENDCOLOR"
		setup_dotfiles
		;;
	3 ) echo "$CYAN Setting up configs $ENDCOLOR"
		setup_config
		;;
	4 ) echo "$CYAN Installing Arch Linux... $ENDCOLOR"
		install_arch_linux
		;;
	q ) echo "$RED QUITTING $ENDCOLOR";;
esac
}
menu
options
