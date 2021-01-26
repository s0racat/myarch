## Description

Minimal GUI Environment built with archiso

## Features

- kernel: linux-lts
- Desktop environment: xfce
- User shell: zsh /Advanced Completion/Useful aliases
- Japanese input with fcitx-mozc
- firefox with uBlock Origin

## Screenshot

<img src="https://github.com/u0a266/myarch/blob/master/2021-01-04_07-39.png" title="screenshot1">

## Prebuilt iso

```bash
https://mega.nz/folder/0vZ1wKDC#4vTfffzF2vM9EES3BVSSrQ
```

## Read Manual

[gitlab archlinux official docs](https://gitlab.archlinux.org/archlinux/archiso/-/tree/master/docs)

```bash
man makepkg
man repo-add
mksquashfs -h
```

## Install Requirements

```bash
sudo pacman -S archiso arch-install-scripts dosfstools e2fsprogs libisoburn mtools squashfs-tools --needed
```

## Make Custom Repository

```bash
git clone https://aur.archlinux.org/pkgname.git
cd /path/to/cloneddir
makepkg -s # must not be run as root
sudo -i # or su root
mkdir -p /root/custom/x86_64/
cp /home/$USER/path/to/pkgname-pkgver.pkg.tar.zst /root/custom/x86_64/
cd /root/custom/x86_64/
repo-add custom.db.tar.xz ./*pkg.tar.zst*
echo "pkgname" >> /root/myarch/packages.x86_64
```

## Build

```bash
sudo -i # or su root
git clone https://github.com/u0a266/myarch.git
cd myarch
mkarchiso -v -w work/ -o out/ . 
```
## Loopback iso boot with grub 

[archwiki](https://wiki.archlinux.org/index.php/Multiboot_USB_drive)

[archwiki ja](https://wiki.archlinux.jp/index.php/%E3%83%9E%E3%83%AB%E3%83%81%E3%83%96%E3%83%BC%E3%83%88_USB_%E3%83%89%E3%83%A9%E3%82%A4%E3%83%96)

__Example__

```bash
set isodevuuid="XXXX-XXXX"
set label="LABEL"
search --no-floppy --fs-uuid --set=root $isodevuuid
set iso="/iso/myarch-2020.12.16-x86_64.iso"
loopback loop $iso
menuentry 'myarch-2020.12.16-x86_64' {
    linux (loop)/arch/boot/x86_64/vmlinuz-linux-lts archisobasedir=arch archisolabel=$label img_dev=/dev/disk/by-uuid/$isodevuuid img_loop=$iso earlymodules=loop
    initrd (loop)/arch/boot/intel-ucode.img
    initrd (loop)/arch/boot/amd-ucode.img
    initrd (loop)/arch/boot/x86_64/initramfs-linux-lts.img
}

menuentry 'uEFI shell' {
    chainloader (loop)/shellx64.efi
}
```
