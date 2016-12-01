#!/bin/bash

# Create signing keys
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=Descriptive name/"

# Sign the module (vboxdrv for this example)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)

# Register the keys to Secure Boot
echo "Supply a password for later reuse after reboot"
sudo mokutil --import MOK.der

# clean temporary created files
rm MOK.der MOK.priv

echo "Reboot and follow instructions to Enroll MOK (Machine Owner Key)."
echo "After the reboot, you may also need to sudo modprobe vboxdrv to load the module."

# Source
# http://askubuntu.com/questions/760671/could-not-load-vboxdrv-after-upgrade-to-ubuntu-16-04
