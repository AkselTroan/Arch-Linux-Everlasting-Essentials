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
	echo "Empty function"
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


menu(){
	echo "
$GREEN [MAIN MENU] $ENDCOLOR What do you want to do? $newline$MAGENTA
$MAGENTA 1: $ENDCOLOR Install Packages
$MAGENTA 2: $ENDCOLOR Dotfiles
$MAGENTA 3: $ENDCOLOR Config
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
	q ) echo "$RED QUITTING $ENDCOLOR";;
esac
}
menu
options
