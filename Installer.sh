#!/bin/sh

skip()
{
	echo "This Process Will continue : $1"
	continue







}

gnome="sudo apt install gnome-core -y"
#xfce="sudo apt install xfce4 -y"
#plasma="sudo apt install kde-plasma-desktop"
term="sudo apt install terminator -y"
brave="sudo apt install brave-browser -y"
qt="sudo apt install qutebrowser -y"
mpv="sudo apt install mpv -y"
upd="sudo apt update -y"
pip="sudo apt install python3-pip -y"
hold="sudo apt-mark hold firefox-esr"
holdchromium="sudo apt-mark hold chromium"
holdephiphany="sudo apt-mark hold epiphany-browser"
t="sudo apt install gnome-tweaks -y"
rr="sudo apt remmove firefox-esr"
echo "Holding firefox"
$hold

echo "Holding Chromium"
$holdchromium

echo "Holding ephiphany"
$holdephiphany


echo "Installing Brave"
sleep 3
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

$upd

$brave

echo "Installing Qutebrowser"
sleep 3
$qt

echo "Removing firefox"
sleep 3
$rr



echo "Installing terminator"
sleep 3
$upd
$term

echo "Installing Pip"
sleep 3s
$pip

echo "Installing Gnome and Gnome-tweaks"
sleep 3
$upd
$gnome
$t

re="sudo apt remove totem gnome-terminal -y"
echo "Removing totem and gnome-terminal -y"
sleep 3
$re

echo "You have installed the system The machine is going to reboot 
Press emter to continue or Ctrl-c to cancel"
read 

reb="sudo reboot"
echo "Rebooting"
sleep 3
$reb



