#!/bin/sh

mkdir --verbose --parents ./pre-build
$EDITOR ./pre-build.sh

sudo mkdir --verbose --parents ./output
sudo chown root:"$(whoami)"
sudo mkarchiso -v -w ./output -o ./output releng

mv --verbose ./output/*.iso .
sudo rm --verbose --recursive --force ./output
find . -name "*.iso" | head -1 | xargs run_archiso -i
