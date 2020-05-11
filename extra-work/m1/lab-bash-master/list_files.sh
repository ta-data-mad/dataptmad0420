#!/bin/bash.
ls

#Load your name in the variable name:
echo your name is:
read name

#print the variable:
echo  $name

#Create a folder named after the variable name:
mkdir $name
echo

#Delete thar folder:
rmdir $name
echo

#For every folder in lorem print the total number of characters of every file name. Try using a for loop to show every file name.
#Print every file:
for i in lorem/*
do
printf "$i\n"
done
echo

#Print the number of characters of every file name:
for k in  lorem/*
do
cat $k|wc -m

done
echo

#Print the number of characters of every file name with the following format: lorem has 5 characters lenght
for M in  lorem/*
do
echo  $M has $(cat $M|wc -m)  characters lenght

done
echo

#Show the system processes being executed (show them hierarchically):
top
echo

ps -axrj
echo


#Show processor info on screen
sudo dmidecode --type processor
echo

#Create 3 new alias and make them available everytime you login your session.
echo For create 3 new alias and make_ them available everytime you login your session,
echo you have to open the file: ~/.bashrc and put your alias with this form:
echo 'alias'"'"'name alias'"'"'='"'"'command'"'"

#Compress lorem and lorem-copy folders in a file named lorem-compressed.tar.gz
#tar -czf nombre-directorio.tar.gz  nombre-directorio
tar -czvf lorem-compressed.tar.gz lorem/*  lorem-copy/*
echo

#Uncompress lorem-compressed.tar.gz in lorem-uncompressed folder.
tar xvf lorem-compressed.tar.gz -C lorem-uncompressed
