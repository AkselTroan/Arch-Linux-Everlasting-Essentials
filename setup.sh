#!/usr/bin/env bash

# Colors
red=$'\e[1;31m'
green=$'\e[1;32m'
cyan=$'\e[1;36m'
normie=$'\e[0m'
magenta=$'\e[1;35m'

# Clearing terminal
cls='printf "\033c"'

# Usefull variables
arrow=' ==> '
newline=$'\n'


echo ""
echo "$cyan"
echo ' █████╗ ██████╗  ██████╗██╗  ██╗    ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗
██╔══██╗██╔══██╗██╔════╝██║  ██║    ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝
███████║██████╔╝██║     ███████║    ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██╔══██║██╔══██╗██║     ██╔══██║    ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ 
██║  ██║██║  ██║╚██████╗██║  ██║    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝
'
echo "$normie"

echo "$green"
echo '✩░▒▓▆▅▃▂▁𝐀𝐫𝐜𝐡 𝐋𝐢𝐧𝐮𝐱 || 𝐄𝐯𝐞𝐫𝐥𝐚𝐬𝐭𝐢𝐧𝐠 𝐄𝐬𝐬𝐞𝐧𝐭𝐢𝐚𝐥𝐬▁▂▃▅▆▓▒░✩'
echo 'Found at: https://github.com/AkselTroan/Arch-Linux-Everlasting-Essentials.git'
echo 'Written by Aksel Troan'
echo "$normie"

menu(){
	echo "
$green [MAIN MENU] $normie What do you want to do? $newline$magenta
$magenta 1: $normie Packages
$magenta 2: $normie Dotfiles
$magenta 3: $normie Config
$red q:  QUIT $normie
"
}

options(){
read -p "$newline$arrow" option
case "$option" in  # For each option given, a function need to be added.
	1 ) echo "$cyan Installing packages... $normie";;
	2 ) echo "$cyan Setting up dotfiles... $normie";;
	3 ) echo "$cyan Setting up configs $normie";;
	q ) echo "$red QUITTING $normie";;
esac
}
menu
options
