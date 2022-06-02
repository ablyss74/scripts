### This will be a script to automate the setup of my Clear Linux Box
```bash
systemctl set-default multi-user.target

swupd bundle-add dev-utils containers-basic mpg123 desktop-enlightenment package-utils

# Google code snippet from https://community.clearlinux.org/t/installing-google-chrome-on-clear-linux/1132
curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
rpm -U --nodeps google-chrome*.rpm
rm google-chrome*

ln -s $HOmE $HOME/Desktop/Home
ln -s $HOmE $HOME/Desktop-1/Home

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.mpv.Mpv
flatpak install flathub com.obsproject.Studio
flatpak install flathub net.sourceforge.projectM

curl -O https://raw.githubusercontent.com/ablyss74/scripts/main/archive/Music%20Thingy/beta_music_thingy.bash
curl -O https://download.nvidia.com/XFree86/Linux-x86_64/515.43.04/NVIDIA-Linux-x86_64-515.43.04-no-compat32.run
curl -O https://raw.githubusercontent.com/ablyss74/scripts/main/archive/nvidia_clear_linux/Install_Nvidia
```

