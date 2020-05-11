
#Print Hello World in  console.
echo "Hellow World"

#Create a new folder named new_dir
mkdir new_dir

#Delete new_dir folder
rmdir new_dir

#Make a copy of sed.txt (located in the lorem folder) to lorem-copy.
cp /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/sed.txt /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy

#Copy the rest of the files located in lorem to lorem-copy using only one code line (tip: use ;)
cp -ur /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/ * /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy

#Locate at lorem folder and show sed.txt content.
cat /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/sed.txt

#Locate at lorem folder and show at.txt and lorem.txt content.
cat /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/at.txt; cat /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/lorem.txt

#Locate at lorem-copy folder and show the first three lines of sed.txt.
head -n 3 /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy/sed.txt

#Locate at lorem-copy folder and show the last three lines of sed.txt.
tail -n 3 /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy/sed.txt

#Add Homo homini lupus. at the end of sed.txt located at lorem-copy.
sed -i "\$aHomo homini lupus" /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy/sed.txt

#Locate at lorem-copy folder and show the last three lines of sed.txt. Now you should see Homo homini lupus..
tail -n 3 /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy/sed.txt

#Change every et to ET in at.txt located at lorem-copy (tip: use sed).
sed 's/et/ET/' /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem-copy/at.txt

#Find the active user of the system.
w

#Find out where are you located within the system.
eval echo "~$david"

#List all .txt files located at lorem.
find /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem -type f -name "*.txt"

#Count the number of lines in sed.txt located at lorem.
wc -l /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/sed.txt

#Count the number of files which name starts with lorem located at the whole lab directory.
find /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master -type f -name "lorem*" | wc -l

#Count the number of times et appears in at.txt located at lorem.
grep -o 'et' /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/at.txt | wc -l 

#Count the number of times the string et appears in at.txt located at lorem.
grep -o ' et ' /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/at.txt | wc -l 

#Count the number of times the string et appears in every file located at lorem-copy.
grep -o ' et ' /home/david/Documents/dataptmad0420/extra-work/m1/lab-bash-master/lorem/* | wc -l 
