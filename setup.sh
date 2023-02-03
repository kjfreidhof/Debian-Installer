#!/bin/sh 

skip()
{
	echo "This Process will continue : $1"
	continue








}







setup="sudo apt install wget aria2c curl gnupg dirmngr curl"
upd="sudo apt update -y"
upg="sudo apt upgrade -y"
dist="sudo apt dist-upgrade"
x="exit"
reboot="sudo reboot"
add="Adding the backports and updates"

echo "Installing neccesarry dependencies"
echo "Do you want to Continue Press enter or Ctrl-c?"
read
$setup

echo "What source do you want to add the backports if you are on debian stable and proposed updates? [|y|n|]"
echo "y, Yes"
echo "n, No"

read -rp " =" CHOICE

if [ "$CHOICE" = y ]; then
	echo "$add"
	sleep 3
	sudo echo "deb http://deb.debian.org/debian/ stable-proposed-updates main" >> /etc/apt/sources.list
	sudo echo "deb http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list
	sudo echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" >> /etc/apt/sources.list
	$upd
	$upg
	$skip_str

elif [ "$CHOICE" = n ]; then 
	echo "Continue...."
	$skip_str

else
	echo "Exiting"
	$x


fi 


echo "Do You want to add other repos? [|1|2|3|]"
echo "1, Testing"
echo "2, Unstabe"
echo "3, Keep-Stable"


read -rp " =" CHOICE 

if [ "$CHOICE" = 1 ]; then
	echo "adding testing repo this will take a minute sit back and relax"
	sleep 3
	sudo echo "deb http://deb.debian.org/debian bookworm main" >> /etc/apt/sources.list
	$upd
	$upg
	$dist
	$skip_str
elif [ "$CHOICE" = 2 ]; then 
       echo "adding unstable this will take a minute sit back and relax"
       sleep 3
       sudo echo "deb https://deb.debian.org/debian unstable main" >> /etc/apt/sources.list
       $upd
       $upg
       $dist

elif [ "$CHOICE" = 3 ]; then
	echo "Keeping stable"
	sleep 3
	echo "Continue...."
	$skip_str

else
	echo "Exiting...."
	sleep 3
	$x

fi 

echo "If you made changes to the sources list you may need to reboot
do you want to reboot now or later? Press enter to Reboot or Ctrl-c to cancel 
and reboot later"
read

$reboot






























