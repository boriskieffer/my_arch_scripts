#!/bin/bash

# A éxécuter APRÈS la màj des apps (malgré le fait que les paquets concernés DEVRAIENT être ajoutés automatiquement en conséquence)

ALL_TO_UPDATE=$(echo "n" | sudo pacman -Su  | grep "Paquets (.*)" | awk '{for(i=3; i< NF; i++) printf("%s\n", $i) }' | sed "s/-[0-9]\..*//g") 
 
TO_UPDATE=()

for pkg in $ALL_TO_UPDATE; do
	[[ $pkg == lib* ]] && TO_UPDATE+=($pkg)
done

sudo pacman --noconfirm -S $TO_UPDATE
