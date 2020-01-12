![alt tag](https://github.com/joaopedropio/dotfiles/blob/master/screenshot.png)

#fazer a pasta virar pasta de font
fc-cache -vf
fc-list

#sistema
pacman -S alsa-utils xorg-server xorg-xinit vim vlc net-tools dialog wpa_supplicant wpa_actiond pulseaudio slim cmus feh termite zsh gvfs-mtp pcmanfm 

#i3
yaourt i3-gaps-git i3blocks-gaps google-chrome-stable

#drivers
to make wifi and bluetooth to work, copy and paste these folders into /lib/firmware:

wifi: cp -r ath10k /lib/firmware
bluetooth: cp -r qca /lib/firmware
