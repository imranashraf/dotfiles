if [ ! -d ~/Android_MTP_device ]; then
	mkdir ~/Android_MTP_device
fi

go-mtpfs ~/Android_MTP_device &

nautilus ~/Android_MTP_device
