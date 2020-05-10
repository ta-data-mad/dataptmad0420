# !/bin/bash


filenames='*.txt'

for eachfile in $filenames
numchar=grep -c eachfile

do
   echo $eachfile
   echo $numchar
done



