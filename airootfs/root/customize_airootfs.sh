#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

# Warning: customize_airootfs.sh is deprecated! Support for it will be removed in a future archiso version.

#sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
# User settings
echo 'root:root' | chpasswd
usermod -s /bin/zsh root
useradd -m arch -s /bin/zsh -G storage
echo 'arch:arch' | chpasswd
groupadd -r autologin
gpasswd -a arch autologin
su arch -c 'chmod 755 ~/Desktop/root-terminal.desktop'
# timesync
timedatectl set-ntp true
# NetworkManager
systemctl enable NetworkManager
systemctl enable firewalld.service
# tlp
systemctl enable tlp.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
# gui
systemctl enable lightdm
systemctl set-default graphical.target
# bluetooth
rfkill unblock all
systemctl enable bluetooth
# noto-cjk
ln -s /etc/fonts/conf.avail/70-noto-cjk.conf /etc/fonts/local.conf
# pacman
pkgfile -u || true
yes|pacman -Scc
pacman -Qdttq | pacman -Rsn - || true
pacman-key --init
pacman-key --populate archlinux
systemctl enable reflector.service
# clean
systemctl disable pacman-init.service choose-mirror.service
rm -f /etc/systemd/scripts/choose-mirror
rm -rf /etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount}
rm -f /root/{.automated_script.sh,.zlogin}
rm -f /etc/mkinitcpio-archiso.conf
rm -rf /etc/initcpio
