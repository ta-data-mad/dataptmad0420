#This script reads the workind directory and returns either a file is a directory (and it's name
# lenght) or another file type (and it's name and content lenght).

for file in *

do
	len=$(echo "$file" | wc -m)
	
	
	if [ -d "$file" ]
	
	then
		
		echo "$file" is a directory an its name has $len characteres. 
		
	else 
		
		num=$(wc -m < "$file")
		echo $file filename has a lenght of $len and the content is $num characteres long.
	fi

done
