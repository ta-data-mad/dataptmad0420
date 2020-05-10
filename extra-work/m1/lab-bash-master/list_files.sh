#!/bin/bash.
#Load your name in the variable name:
echo your name is:
read name

#print the variable:
echo  $name

#Create a folder named after the variable name:
mkdir $name

#Delete thar folder:
rmdir $name

#For every folder in lorem print the total number of characters of every file name. Try using a for loop to show every file name.
#Print every file:
for i in lorem/*
do
printf "$i"
echo 

done

#Print the number of characters of every file name:
for k in lorem/*
do
printf cat $k | wc -m 
done
