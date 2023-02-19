# myarch

## Build in Artix

```bash
sudo mkarchiso -C pacman-artix.conf -v -w work -o out .
```

## Default Password

arch: arch

## Troubleshooting

### pacman-key

```bash
sudo pacman-key --init && sudo pacman-key --populate
```

### set keyboard layout to jp

```bash
setxkbmap jp
```

### return to en

```
setxkbmap us
```

### change user password

```bash
passwd
arch
your_new_passwd
your_new_passwd
```

### lock screen

```bash
i3lock -c 000000
```

### firefox scaling

```about:config
layout.css.devPixelsPerPx=1.5
```

### QT_APPS scaling

```bash
QT_SCALE_FACTOR=1.5
```

### Other scaling setting

https://wiki.archlinux.org/title/HiDPI

### Ventoy

Use grub2 mode. Does not boot in systemd-boot.

### Use grub2 mode automatically in ventoy

https://www.ventoy.net/en/doc_name_identifier.html

```bash
mv myarch-*-x86-64.iso myarch-2023.02.01-x86_64_VTGRUB2.iso
```
