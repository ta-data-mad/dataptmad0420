# Creación alias.
alias la='ls -lah'

# Print Hello World in console.
echo Hello world!

# Moving to lab directory.
cd ~/Desktop/Ironhack/dataptmad0420/extra-work/m1/lab-bash-master/

# Create a new folder named new_dir.
mkdir new_dir

# Delete new_dir folder.
rm -rf new_dir

# Make a copy of sed.txt (located in the lorem folder) to lorem-copy.
cp ./lorem/sed.txt ./lorem-copy/

# Copy the rest of the files located in lorem to lorem-copy using only one code line (tip: use ;).
cp ./lorem/at.txt ./lorem/lorem.txt ./lorem-copy/.

# Locate at lorem folder and show sed.txt content.
cd lorem/; cat sed.txt

# Locate at lorem folder and show at.txt and lorem.txt content.
cat at.txt ; echo -e '\n\n\n' ; cat lorem.txt

# Locate at lorem-copy folder and show the first three lines of sed.txt.
cd ../lorem-copy/
head -n3 sed.txt

# Locate at lorem-copy folder and show the last three lines of sed.txt.
tail -n3 sed.txt

# Add Homo homini lupus. at the end of sed.txt located at lorem-copy.
echo 'Homo homini lupus.' >> sed.txt

# Locate at lorem-copy folder and show the last three lines of sed.txt. Now you should see Homo homini lupus..
tail -n3 sed.txt

# Change every et to ET in at.txt located at lorem-copy (tip: use sed).
sed 's/ et / ET /' at.txt

# Find the active user of the system.
who

# Find out where are you located within the system.
pwd

# List all .txt files located at lorem.
cd ..
la ./lorem *.txt

# Count the number of lines in sed.txt located at lorem.
cat ./lorem/sed.txt | wc -l

# Count the number of files which name starts with lorem located at the whole lab directory.
la -R | wc -l

# Count the number of times et appears in at.txt located at lorem.
la -R | grep at.txt | wc -l

# Count the number of times the string et appears in at.txt located at lorem.
grep -wc et ./lorem/at.txt

# Count the number of times the string et appears in every file located at lorem-copy.
grep -iwcr et ./lorem-copy/


#######################################################################################################################
#######################################################################################################################


# Load your name in the variable name.
name='Pablo'

# Print that variable.
echo $name

# Create a folder named after the variable name.
mkdir $name

# Delete that folder.
rmdir $name

# For every folder in lorem print the total number of characters of every file name. Try using a for loop to show every file name.

#   Print every file.
#   Print the number of characters of every file name.
#   Print the number of characters of every file name with the following format: lorem has 5 characters lenght
bash script_lab.sh

		#######
		# Script_lab.sh is a bash script that reads the working directory
		# and returns either a file it's a directory and it's name length
		# or if it's a file and it's name and content length.
		#######

# Show the system processes being executed (show them hierarchically):

#   Using top or htop commands.
	htop #m or F6 to sort.

#   Using ps command with arguments.
	ps -ef

# Show processor info on screen.
lscpu
# Create 3 new alias and make them available everytime you login your session.

# Created editing bash.bashrc on ~/etc to be permanent.
alias lo="ls -lah"
alias ..="cd .."
alias g="git status"
alias labs="cd ~/Desktop/Ironhack/dataptmad0420"

# Compress lorem and lorem-copy folders in a file named lorem-compressed.tar.gz
tar -cvf lorem-compressed.tar.gz ./lorem ./lorem-copy/

# Uncompress lorem-compressed.tar.gz in lorem-uncompressed folder.
mkdir lorem-uncompressed
tar -xvf lorem-compressed.tar.gz -C lorem-uncompressed

