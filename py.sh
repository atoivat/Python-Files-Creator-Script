#!/bin/bash

# ~ PYTHON FILES CREATOR SCRIPT ~
# Put a name as first argument, and name.py will be created;
# Otherwise, a automatic name will be generated based on time, and auto_name.py will be created.
# The files always come with basic structure and permissions.
# by atoivat	~	github.com/atoivat

_txt='#!/usr/bin/env python

def main():
	# Code goes here

if __name__ == "__main__":
   main()'


if [ $# -gt "0" ]
then
	if [ -e $1.py ]
	then
   	echo "ERROR: A file named '$1.py' already exists."
   	exit 1
	fi
	out=$1
else
	echo "Auto-creating..."
	date=`date +"%d%m"`
    out=$date
    i=0
    while [ -e $out.py ]
    do
        let i+=1
        out="$date-$i"
    done
fi

echo "$_txt" > $out.py
chmod +x $out.py
echo "$out.py created."