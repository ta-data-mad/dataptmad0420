#!/bin/bash

# BONUS 1_ Create a variable w/ your name called NAME
NAME="Laura"
echo "my name is $NAME \n"

# BONUS_2 Create a folder named after the variable
mkdir $NAME

echo "\n $NAME directory created"
# BONUS 3_ Delete de folder
rm -r $NAME/
echo "\n $NAME directory deleted"

# BONUS 4_ For every folder in lorem/ print the total number of characters of every file name. 
#          Try using a for loop to show every file name
echo "\nCounting characters in lorem folder\n"
for f in $(ls lorem/)
do
	echo $f
	echo -n $f | wc -m
	len=$(echo -n $f | wc -m)
	echo "$f has $len characters lenght\n"
done;

# BONUS 5_ Show the system processes being executed
# top and htop sohw the last processes being running and other relevant information (time, users, space)
# (ps -aux | less) #shows system processes also
echo "\nBonus 5: system processes are included as a comment"

# BONUS 6_ Show processor info on screen
# CPU=$(lscpu)
# echo head -3 $CPU
echo "\nBonus 6: show processor info on screen is included as a comment"

# BONUS 7_ Create 3 new alias and make them available everytime you login your session
alias ll='ls -alf'
alias labs='cd ~/Documentos/IronHack [dataptapril0420]/cloned/dataptmad0420/'
alias ls= 'ls --color=auto'
echo "\n3 new aliases have been created"

# NO QUIERO DE MOMENTO PONER NINGÚN ALIAS ASI QUE:
unalias ll
unalias labs
unalias ls
echo "\nThe 3 aliases have been undone.."

# BONUS 8_ Compress lorem and lorem_copy folders in a file named lorem-compressed.tar.gz
echo "\nCreating a compressed file: ...\n..."
tar -czvf lorem-compressed.tar.gz lorem*/
echo "New .tar.gz done..\n"

# BONUS 9_ Uncompress lorem-compressed.tar.gz in lorem-uncompressed folder 
# Gunzip can currently decompress files created by gzip, zip, compress, compress -H or pack. 
# for tar.gz files:
echo  "\nUncompressing ...\n..."
mkdir lorem-uncompressed | tar -xvf lorem-compressed.tar.gz --directory lorem-uncompressed/
echo ".tar.gz Uncompressed..\n"
