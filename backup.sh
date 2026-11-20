#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./backup.sh <file>"
    exit 1
fi

name=$1

if [ ! -e "$name" ]; then
    echo "Not found: $name"
    exit 2
elif [ -d "$name" ]; then
    echo "$name is a directory, not a file"
    exit 3
elif [ ! -r "$name" ]; then
    echo "Cannot read: $name"
    exit 4
fi

today=$(date +%F)
dest="$name.$today.bak"

cp "$name" "$dest"
size=$(wc -c < "$dest")

echo "Backup created: $dest ($size bytes)"
