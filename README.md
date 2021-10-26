# Arch-Linux-Everlasting-Essentials
<div style="text-align:center"><img src="https://i.imgur.com/rWXjTQr.png" /></div>
CURRENTLY WORK IN PROGRESS. This script aims to automate the setup of a fresh arch linux system. Installs and configure essential packages, i3-gaps DE and dotfiles.

# Base Arch Linux installation and setup

There are two scripts, part 1 and part 2. Keep in mind the setup is my personal preference and may not please your needs. You need to have 3 partitions with /dev/sda1 = EFI System, /dev/sda2 = Linux Swap and /dev/sda3 = Linux Filesystem for the script to work. 

Run Part 1 when the partitions are ready. You will then be asked to arch-chroot into /mnt and run part 2. 

After the installation you will end up with a machine called overlord and a user called troan. I am planning to make this customizable as the script is running with a prompt, option or a environment variable. So you can choose which method you like the most.
