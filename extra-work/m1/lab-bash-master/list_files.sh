#!/bin/bash

name="Sergio"
echo $name

mkdir $name
rm -r $name

files=/Home/Sergio/repos/dataptmad0420/extra-work/m1/lab-bash-master/lorem/*

for file in $files
do
  echo $(basename $file) | ls
  echo -n "$file" | wc -m
done
