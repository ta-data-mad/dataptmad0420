#Este es el código del bonus del lab-bash-master

echo ------------------------------------
echo 'Este es el bonus del ejercicio'
name='Juan Munoz'

echo 'Mi nombre es:' $name

echo 'Directorio' $name 'creado' 
mkdir $name
echo 'Directorio' $name 'borrado'
rm -rf $name
cd lorem/


for i in $( ls ); do
	echo $i
	echo "$i has $count characthers length:"
	echo -n $i | wc -c
	echo '--- Next File:'
done  

