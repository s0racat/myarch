# myarch

## features

linux-lts kernel, xfce4 desktop environment, customized zsh, root terminal, fcitx-mozc with japanese input, jp106 keyboard, intel-gpu optimized

## screenshot
<img src="https://github.com/llnnn-ux/myarch/blob/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88_2020-12-15_23-16-53.png" title="screenshot1">

<img src="https://github.com/llnnn-ux/myarch/blob/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88_2020-12-16_18-04-29.png" title="screenshot2">

## read manual

[gitlab archlinux official docs](https://gitlab.archlinux.org/archlinux/archiso/-/tree/master/docs)

```bash
man makepkg
man repo-add
mksquashfs -h
```

## install requirements

```bash
pacman -S archiso arch-install-scripts dosfstools e2fsprogs libisoburn mtools squashfs-tools --needed
```

## make custom repo

```bash
git clone https://aur.archlinux.org/someaur.git
cd /path/to/aur
makepkg -s # must not be run as root
sudo -i # or su root
mkdir -pv /root/custom/x86_64
cp somename.pkg.tar.zst /root/custom/x86_64
cd /root/custom/x86_64
repo-add custom.db.tar.xz /root/custom/x86_64/*pkg.tar.zst*
echo "somepkgname" >> /root/myarch/packages.x86_64
```

## build

```bash
sudo -i # or su root
git clone https://github.com/llnnn-ux/myarch.git
cd myarch
mkarchiso -v -w work/ -o out/ . # customize out directory ex. /run/media/user/label
```
## prebuilt iso

```bash
https://mega.nz/file/sr4kjTTR#qCCLBhq4q8_paJnZBT2TVAEgHp3OSOcW-ooT6FZOz-Q
```

## loopback boot with grub 

[archwiki](https://wiki.archlinux.org/index.php/Multiboot_USB_drive)

[archwiki ja](https://wiki.archlinux.jp/index.php/%E3%83%9E%E3%83%AB%E3%83%81%E3%83%96%E3%83%BC%E3%83%88_USB_%E3%83%89%E3%83%A9%E3%82%A4%E3%83%96)

```bash
set isodevuuid="XXXX-XXXX"
set label="somelabel"
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
