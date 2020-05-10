#!/bin/bash
ls ~/Ironhack/IronLabs/dataptmad0420/extra-work/m1/lab-bash-master

# BONUS:
# Load your name in the variable name.
name='Jorge'


# Print that variable.
echo $name


# Create a folder named after the variable name.
mkdir $name


# Delete that folder.
rm -rf $name


# For every folder in lorem print the total number of characters of every file name. Try using a for loop to show every file name.
#   i.Print every file.
#  ii.Print the number of characters of every file name.
# iii.Print the number of characters of every file name with the following format: lorem has 5 characters lenght

WORKPATH=`find / -path "*/lab-bash-master/lorem" 2> /dev/null`
FILES=`find / -path "*/lab-bash-master/lorem" -exec ls {} \;  2> /dev/null`

cd `find / -path "*/lab-bash-master/lorem" 2> /dev/null`
for f in $FILES
do
	WC=`wc -c ${f} | awk '{print $1}'` 
	echo "$f has: $WC characters lenght" 
done


# Show the system process being executed 
#  i.Using top or htop commands.
# ii.Using ps command with arguments.
cd `find / -path "*/lab-bash-master/your-code" 2> /dev/null`
top -b -n 1 > top.txt
ps -aux -n 1 > ps.txt

# Show processor info on screen.
cat /proc/cpuinfo

# Create 3 new alias and make them available everytime you login your session.
echo -e "\n# Parent Directory\nalias ..='cd ..'" >> ~/.bash_aliases
echo -e "\n# Traverse two directories up\nalias ...='cd ../..'" >> ~/.bash_aliases
echo -e "\n# Show FS\nalias f='df -h'" >> ~/.bash_aliases
echo -e "\n# Clear pannel\nalias c='clear'" >> ~/.bash_aliases
echo -e "\n# List all\nalias lol='ls -ltrahn'" >> ~/.bash_aliases


# Compress lorem and lorem-copy folders in a file named lorem-compressed.tar.gz
cd `find / -path "*/lab-bash-master" 2> /dev/null`
tar -czvf lorem-compressed.tar.gz ./lorem ./lorem-copy
 
# Uncompress lorem-compressed.tar.gz in lorem-uncompressed folder.
mkdir lorem-uncompressed
tar -xzvf lorem-compressed.tar.gz -C ./lorem-uncompressed
