sharename="SharedVBoxUbuntu"
sudo mkdir /mnt/$sharename 2> /dev/null
sudo chmod 777 /mnt/$sharename 
sudo mount -t vboxsf -o uid=1000,gid=1000 $sharename /mnt/$sharename
#ln -s /mnt/$sharename $HOME/Desktop/$sharename

