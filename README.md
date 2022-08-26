# myarch

[![CI](https://github.com/soracqt/myarch/actions/workflows/build-archiso.yml/badge.svg)](https://github.com/soracqt/myarch/actions/workflows/build-archiso.yml)

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
layout.css.devPixelsPerPx=1.25
```

### QT_APPS scaling

```bash
QT_SCALE_FACTOR=1.25
```

### Other scaling setting

https://wiki.archlinux.org/title/HiDPI
