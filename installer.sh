#!/bin/bash
gnome="sudo apt install gnome-core -y"
xfce="sudo apt install xfce4 -y"
plasma="sudo apt install kde-plasma-desktop -y"
term="sudo apt install terminator -y"
brave="sudo apt install brave-browser -y"
chromium="sudo apt install chromium -y"
firefox="sudo apt install firefox-esr -y"
qt="sudo apt install qutebrowser -y"
vlc="sudo apt install vlc -y"
mpv="sudo apt install mpv"
upd="sudo apt update -y"
kali="sudo apt-get install kali-linux-headless -y"
auto="sudo apt-get autoremove --purge"
clean="sudo apt clean"
skip="continue"
x="exit"
pip="sudo apt install python3-pip"
hold="sudo apt-mark hold firefox-esr"
holdchromium="sudo apt-mark hold chromium"
holdephiphany="sudo apt-mark hold epiphany-browser"

echo "Holding firefox"
$hold

echo "Holding Chromium"
$holdchromium

echo "Holding ephiphany"
$holdephiphany


echo "Installing terminator"
sleep 3
$upd
$term

echo "Installing Pip"
sleep 3s
$pip

echo "Installing Kali linux"
$auto
$upd
$kali
$clean

echo "What Desktop Environment do you want to install?[|1|2|3|]"
echo "1, Gnome"
echo "2, Plasma"
echo "3, xfce"

read -rp " =" CHOICE

if [ "$CHOICE" = 1 ]; then
        echo "Installing Gnome"
        sleep 3
        $upd
        $gnome
        $skip

elif [ "$CHOICE" = 2 ]; then
        echo "Installing Plasma"
        sleep 3
        $upd
        $plasma

elif [ "$CHOICE" = 3 ]; then 
        echo "Installing xfce"
        sleep 3
        $upd
        $xfce

else

        echo "Exiting"
        $x

fi 

echo "What web browser would you like to install? [|1|2|3|4|]"
echo "1, Brave"
echo "2, Firefox"
echo "3, chromium"
echo "4, qutebrowser"

read -rp " =" CHOICE

if [ "$CHOICE" = 1 ]; then
        echo "Installing Brave"
        sleep 3
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        $upd
        $brave
        $skip
elif [ "$CHOICE" = 2 ]; then
        echo "Installing Firefox"
        sleep 3
        $firefox
        $skip
elif [ "$CHOICE" = 3 ]; then
        echo "Installing Chromium"
        sleep 3
        $chromium
        $skip
elif [ "$CHOICE" = 4 ]; then
        echo "Installing qutebrowser"
        sleep 3
        $qt
        $skip
else
        echo "Exitiing"
        sleep 3
        $x

fi 

echo "Do you want install vlc or mpv as your media player? [|1|2|3|]"
echo "1, vlc"
echo "2, mpv"
echo "3, Both"

read -rp " =" CHOICE

if [ "$CHOICE" = 1 ]; then
        echo "Installing vlc"
        $upd
        $vlc
        $skip

elif [ "$CHOICE" = 2 ]; then
        echo "Installing mpv"
        $upd
        $mpv
        $skip

elif [ "$CHOICE" = 3 ]; then
        echo "Installing both"
        $upd
        $mpv
        $vlc
        $skip

else
        echo "Exiting"
        $x

fi 
reboot="sudo reboot"

echo "Time to reboot into the new environment Do you want to Reboot now or Reboot Later?
Press Enter to Reboot now or ctrl c to cancel"
read -rp
$reboot







