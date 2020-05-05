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
