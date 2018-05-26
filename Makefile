sync:
	rsync -avrz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress output/packages alpine.ma.ssive.co:/var/www/alpine.ma.ssive.co/
