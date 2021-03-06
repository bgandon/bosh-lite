#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

apt-get -y install linux-headers-$(uname -r) build-essential make perl dkms git

mount -o loop /home/vagrant/linux.iso /media/cdrom

cd /tmp

git clone https://github.com/rasa/vmware-tools-patches.git
cd vmware-tools-patches
cp /media/cdrom/VMwareTools-*.tar.gz .

./untar-and-patch-and-compile.sh

rm /home/vagrant/linux.iso
umount /media/cdrom

apt-get -y remove linux-headers-$(uname -r)
