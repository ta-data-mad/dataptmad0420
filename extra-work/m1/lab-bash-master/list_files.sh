#!/bin/bash
ls
name="agustin"
echo $name
mkdir $name
rmdir $name
cd lorem
for i in $(ls);
do
    cat $i
    echo
    echo Nombre fichero=$i
    echo $(cat $i | wc -c)
    echo
    echo $i has $(cat $i | wc -c) characters length
    echo
done
ps -ef | sort -n -k3


