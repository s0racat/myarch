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
su arch -c 'chmod 755 ~/Desktop/root-terminal.desktop'
rfkill unblock all
# pacman
yes|pacman -Scc
pacman -Qdttq | pacman -Rsn - || true
pacman-key --init
pacman-key --populate archlinux
# clean
rm -f /etc/systemd/system/multi-user.target.wants/{pacman-init.service,choose-mirror.service}
rm -f /etc/systemd/scripts/choose-mirror
rm -rf /etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount}
rm -f /root/{.automated_script.sh,.zlogin}
rm -f /etc/mkinitcpio-archiso.conf
rm -rf /etc/initcpio
