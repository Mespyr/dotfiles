# arch linux install guide for me cuz i cant remember things

## installation

### Connect to internet
Use `iwctl` to connect to internet.
```
[iwd] device list
[iwd] station <device> scan
[iwd] station <device> get-networks
[iwd] station <device> connect <SSID>
```

### Update system clock
```
timedatectl set-ntp true
```

### Partition and mount drives
Partition drive using `cfdisk` like so:
- EFI System: 260M
- Linux swap: 2G
- Linux filesystem: rest of drive

Format drives like so:
```
mkfs.vfat /dev/<EFI_PARTITION>
mkfs.ext4 /dev/<ROOT_PARTITION>
mkswap /dev/<SWAP_PARTITION>
```

Mount drives:
```
mount /dev/<ROOT_PARTITION> /mnt
mkdir -p /mnt/boot/efi
mount /dev/<EFI_PARTITION> /mnt/boot/efi
swapon /dev/<SWAP_PARTITION>
```

### Pacstrap
```
pacstrap /mnt base base-devel linux linux-firmware amd-ucode git neovim grub efibootmgr dosfstools mtools networkmanager sudo
```

### Generate Fstab
```
genfstab -U /mnt >> /mnt/etc/fstab
```

## Configure system

### Chroot
```
arch-chroot /mnt
```

### Time zone
```
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwlock --systohc
```

### Localization
Uncomment line in `/etc/locale.gen` that says `en_US.UTF-8 UTF-8` and run:
```
locale-gen
```

Make file named /etc/locale.conf and type `LANG=en_US.UTF-8`

### Network configuration
Set hostname in `/etc/hostname`
```
olympus
```

configure `/etc/hosts`
```
127.0.0.1   localhost
::1         localhost
127.0.1.1   olympus.localdomain olympus
```

Install NetworkManager:
```
systemctl enable NetworkManager
```

### Set password and add new user
```
passwd
useradd -m achlys
passwd achlys
usermod -aG wheel,audio,video,storage,optical achlys
```

### Sudo
```
EDITOR=nvim visudo
```

### Grub
```
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

### Disable bell in tty
Edit /etc/inputrc and uncomment line that says:
```
set bell-style none
```

### Reboot
```
exit
umount /mnt
reboot
```

## After Install
Clone the repository and copy all config files to the right places.
Install yay using script, then install all other packages.
Create `~/.xinitrc` and put `exec awesome`

### Bluetooth and Sound
```
sudo pacman -S pulseaudio pulseaudio-bluetooth bluez bluez-utils blueberry
sudo systemctl enable bluetooth.service
```

To enable audio, in /etc/pulse/system.pa, put
```
...
load-module module-bluetooth-policy
load-module module-bluetooth-discover
...
```

In /etc/bluetooth/main.conf, set ControllerMode to `bredr` to be able to pair airpods.
