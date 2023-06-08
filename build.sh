#!/bin/sh

sudo rm --verbose --recursive --force ./output
mkdir --verbose --parents ./pre-build
$EDITOR ./pre-build.sh

sudo mkdir --verbose --parents ./output
sudo chown root:"$(whoami)"
sudo mkarchiso -v -w ./output -o ./output releng

mv --verbose ./output/*.iso .
find . -name "*.iso" | head -1 | xargs run_archiso -i
