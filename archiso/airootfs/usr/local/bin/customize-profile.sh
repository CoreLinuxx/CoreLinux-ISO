#!/bin/bash
# autor: EosOS.dev

# systemctl para habilitar o NetworkManager
systemctl enable NetworkManager

pacman-key --init

#systemctl enable firewalld.service

systemctl enable bluetooth.service

# Habilita sddm Plasma
systemctl enable sddm.service

xdg-user-dirs-update
## Script to perform several important tasks before `mkarcheosiso` create filesystem image.

set -e -u

## -------------------------------------------------------------- ##

## Modify /etc/mkinitcpio.conf file
#sed -i '/etc/mkinitcpio.conf' \
#        -e "s/#COMPRESSION=\"zstd\"/COMPRESSION=\"zstd\"/g"

## Fix Initrd Generation in Installed System
cat >"/etc/mkinitcpio.d/linux.preset" <<-_EOF_
	# mkinitcpio preset file for the 'linux' package

	ALL_kver="/boot/vmlinuz-linux"
	ALL_config="/etc/mkinitcpio.conf"

	PRESETS=('default' 'fallback')

	#default_config="/etc/mkinitcpio.conf"
	default_image="/boot/initramfs-linux.img"
	#default_options=""

	#fallback_config="/etc/mkinitcpio.conf"
	fallback_image="/boot/initramfs-linux-fallback.img"
	fallback_options="-S autodetect"    
_EOF_

## Delete ISO specific init files
rm -f /etc/mkinitcpio.conf.d/archiso.conf

cp -f /etc/skel-custom/.bashrc /etc/skel/.bashrc
cp -f /etc/skel-custom/.bash_profile /etc/skel/.bash_profile
