#!/bin/bash

#This script reads 100 files from /usr/bin folder and gens sample sha files

MD5FILE="md5_sample.txt"
SHA256FILE="sha256_sample.txt"
C=100

> $MD5FILE
> $SHA256FILE

for file in /usr/bin/*; do
	md5sum "$file" | cut -f1 -d' ' >> $MD5FILE
	sha256sum "$file" | cut -f1 -d' ' >> $SHA256FILE
	let C-=1
	if [ $C -eq 0 ]; then
		break
	fi
done
