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
    echo $(wc -c $i)
done


