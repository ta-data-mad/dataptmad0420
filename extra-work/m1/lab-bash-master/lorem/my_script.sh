echo
echo 'exercise 1'

my_name='Adja'
echo $my_name

echo
echo 'exercise 2'

for file in *;
do
 echo $file
done

echo
echo 'exercise 3'

for file_name in *;
do
  printf $file_name | wc -m 
done

echo
echo 'exercise 4'

for file_name in *;
do
  total_line=$(printf $file_name | wc -m)
  echo "${file_name} has ${total_line} characters length" 
done
echo 
echo 'exercise 5'
ps -axjf
top -0 %cpu
echo

