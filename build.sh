#!/bin/sh

cp -r ./releng ./pre-build
notify-send "Edit pre build script"
$EDITOR ./pre-build.sh
./pre-build.sh

sudo mkarchiso -v -w ./output -o ./output ./pre-build
notify-send --urgency=critical "Ended building ISO"
sudo chown --recursive root:"$(whoami)"
sudo chmod --recursive g+w ./output

find ./output -name "*.iso" -exec mv --verbose {} . \;
sudo rm --recursive --force ./output
rmdir ./pre-build
printf 'Open ISO in QEMU [s/N]: '
read -r confirm
[ "$confirm" = "s" ] || [ "$confirm" = "S" ] \
	&& find . -name "*.iso" | head -1 | xargs run_archiso -i
