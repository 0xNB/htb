#!/bin/bash

echo 'Scanning for ports...'
ports=$(nmap  -vv -p- --min-rate=1000  -T4 $1 | tee /dev/tty | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
echo "Running default scripts for $ports"
nmap -sC -sV -p -vv $ports $1
