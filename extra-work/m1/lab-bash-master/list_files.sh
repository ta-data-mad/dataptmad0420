#!/bin/bash

ls

name=Diego
echo $name
mkdir $name
rm -rf $name

cd lorem-copy

for i in *.txt
do
echo $i
wc -c $i
d=$(wc -c $i | awk '{print $1}')
e="${i%%.*}"
echo "$e has $d characters lenght"
done

cd ..

top -o cpu
ps aux --sort -rss

cat /proc/cpuinfo

alias ironlabs="cd /Users/diegofernandezdelahoz/Documents/Iron_Labs/dataptmad0420/"
alias ll="ls -ltrah"
alias procesos="top -o cpu"

tar -czvf lorem-compressed.tar.gz lorem lorem-copy
tar xvf lorem-compressed.tar.gz



