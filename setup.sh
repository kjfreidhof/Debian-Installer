#!/bin/bash 
setup="sudo apt install wget gnupg dirmngr curl"
kali1="sudo curl https://archive.kali.org/archive-key.asc -o /etc/apt/trusted.gpg.d/kali-archive-key.asc"
upd="sudo apt update -y"
upg="sudo apt upgrade -y"
dist="sudo apt-get dist-upgrade -y"
skip="continue"
x="exit"
reboot="sudo reboot"

echo "Installing neccesarry dependencies"
$setup


echo "Do you want to add the kali repo and install all kinds of kali tools?"
echo "y, Yes"
echo "n, No"
read -rp " =" CHOICE

if [ "$CHOICE" = y ]; then
    echo "adding Kali repos and installing kali tools"
    sleep 3
    $kali1
    sudo sh -c "echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list"
    $upd 
    sleep 3s
    $upg
    sleep 3s
    $dist
    $skip 

else
        echo "Exitting"
        sleep 3s
        $x


fi

echo "Time to reboot make sure"
sleep 3
echo "after you reboot run the installer script"
sleep 3

$reboot




