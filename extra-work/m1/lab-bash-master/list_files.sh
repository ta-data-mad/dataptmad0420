#!/bin/bash
ls

name=victor
echo $name
mkdir $name
ls
rm -r $name

cd ~/Documentos/ironhack_repos/dataptmad0420/extra-work/m1/lab-bash-master/lorem
for file in *
do
	echo $file
	expr length $file
done

for file in *
do
	echo $file has $(expr length $file) characters lenght
done


