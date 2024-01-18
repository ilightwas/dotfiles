#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
  echo "run as root"
  exit
fi

dir_exists() {
  if [ ! -d "${1}" ]; then
    echo "Directory \"${1}\" does not exist"
    exit
	fi
}

check_mount_points() {
  dir_exists "$1"
  dir_exists "${1}/proc"
  dir_exists "${1}/sys"
  dir_exists "${1}/dev"
  dir_exists "${1}/run"
}

mount_filesystems() {
  echo "Mouting filesystems for enviroment"

  mount -v --types proc /proc "${chroot_dir}/proc"
  mount -v --rbind /sys "${chroot_dir}/sys"
  mount -v --make-rslave "${chroot_dir}/sys"
  mount -v --rbind /dev "${chroot_dir}/dev"
  mount -v --make-rslave "${chroot_dir}/dev"
  mount -v --bind /run "${chroot_dir}/run"
  mount -v --make-slave "${chroot_dir}/run"
}

umount_filesystems() {
  echo "Unmounting filesystems"
  umount -v "${chroot_dir}/run"
  umount -vR "${chroot_dir}/dev"
  umount -vR "${chroot_dir}/sys"
  umount -vR "${chroot_dir}/proc"
}

check_mount_points "$1"
mount_filesystems "$1"
chroot "$1" /bin/bash
umount_filesystems "$1"

