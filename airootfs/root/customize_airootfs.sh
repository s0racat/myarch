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
ln -s /usr/lib/systemd/system/systemd-timesyncd.service /etc/systemd/system/sysinit.target.wants/
ln -s /usr/lib/systemd/system/firewalld.service /etc/systemd/system/multi-user.target.wants/
# tlp
ln -s /usr/lib/systemd/system/tlp.service /etc/systemd/system/multi-user.target.wants/
ln -s /dev/null /etc/systemd/system/systemd-rfkill.service
ln -s /dev/null /etc/systemd/system/systemd-rfkill.socket
# gui
ln -s /usr/lib/systemd/system/lightdm.service /etc/systemd/system/display-manager.service
# bluetooth
rfkill unblock all
ln -s /usr/lib/systemd/system/bluetooth.service /etc/systemd/system/bluetooth.target.wants/
# pacman
pkgfile -u || true
yes|pacman -Scc
pacman -Qdttq | pacman -Rsn - || true
pacman-key --init
pacman-key --populate archlinux
ln -s /usr/lib/systemd/system/reflector.timer /etc/systemd/system/timers.target.wants/
# clean
rm -f /etc/systemd/system/multi-user.target/{pacman-init.service,choose-mirror.service}
rm -f /etc/systemd/scripts/choose-mirror
rm -rf /etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount}
rm -f /root/{.automated_script.sh,.zlogin}
rm -f /etc/mkinitcpio-archiso.conf
rm -rf /etc/initcpio
