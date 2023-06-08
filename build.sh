#!/bin/sh

sudo rm --recursive --force ./output
mkdir --verbose --parents ./pre-build
$EDITOR ./pre-build.sh
./pre-build.sh

sudo mkarchiso -v -w ./output -o ./output releng
sudo chown root:"$(whoami)"
sudo chmod g+w ./output

find ./output -name "*.iso" -exec mv --verbose {} . \;
# sudo rm --recursive --force ./output
find . -name "*.iso" | head -1 | xargs run_archiso -i
