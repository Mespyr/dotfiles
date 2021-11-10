# arch linux install guide for me

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
mkdir /mnt/boot/efi
mount /dev/<ROOT_PARTITION> /mnt
mount /dev/<EFI_PARTITION> /mnt/boot/efi
swapon /dev/<SWAP_PARTITION>
```

### Pacstrap
```
pacstrap /mnt base base-devel linux-lts linux-firmware amd-ucode git neovim
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
myhostname
```

configure `/etc/hosts`
```
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain myhostname
```

Install NetworkManager:
```
pacman -S networkmanager
systemctl enable NetworkManager
```

### Set password and add new user
```
passwd
useradd -m username
passwd username
usermod -aG wheel,audio,video,storage,optical username
```

### Sudo
```
pacman -S sudo
EDITOR=nvim visudo
```

### Grub
```
pacman -S grub
pacman -S efibootmgr dosfstools mtools
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot
```
exit
umount /mnt
reboot
```

## After Install
Install all packages listed in `after-install.txt`
Reboot.
Clone the repository and copy all config files to the right places.
