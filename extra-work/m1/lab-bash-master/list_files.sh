#!/bin/bash
#ls

#Load your name in the variable name.
name=MiguelAngel

#Print that variable.
echo $name

#Create a folder named after the variable name.
mkdir $name

#Delete that folder.
rm -r $name


#For every folder in lorem print the total number of characters of every file name. Try using a for loop to show every file name.

    #Print every file.
    #Print the number of characters of every file name.
    #Print the number of characters of every file name with the following format: lorem has 5 characters lenght

for file in *

do
	ch=$(echo "$file"| wc -m)
	if ([ -d $file ] && [ "$(ls $file)" ]) ;then
		echo "Folder $file has $ch lenght" 
		for entry in $file/*
		do
			string=$(echo "$entry")
			prefix=$(echo $file)
			word=${string//$(echo "$file/")}
			che=$(echo "$word" | wc -m)
			echo -e "\t File $word in folder $file has $che characters"	
		done	
	else
		echo "File $file has $ch lenght" 
	fi
	 
	
done



#Show the system processes being executed (show them hierarchically):

    #Using top or htop commands.
    # top
    #Using ps command with arguments.
ps -ely
#Show processor info on screen.
lscpu
#Create 3 new alias and make them available everytime you login your session.

#i put this part in comments because i dont want to modify my alias, but, this will be the code

#cd 
#alias ..="cd .." >>
#alias la="ls -la" >> nano ~/.bashrc
#alias cconda="conda env" >> nano ~/.bashrc

#Compress lorem and lorem-copy folders in a file named lorem-compressed.tar.gz
tar -cvf lorem-compressed.tar.gz ./lorem ./lorem-copy/
#Uncompress lorem-compressed.tar.gz in lorem-uncompressed folder.
mkdir lorem-uncompressed
tar -xvf lorem-compressed.tar.gz -C lorem-uncompressed
