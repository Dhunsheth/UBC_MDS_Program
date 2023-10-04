value=`cat phonebook.txt`  
# echo "$value" 

for i in $value
do
	echo -n "Name: "
	echo -n $i | grep -o -P '(?<=<name>).*?(?=</name>)' | tr -d '\n'
	echo -n " Phone: "
	echo $i | grep -o -P '(?<=<phone>).*?(?=</phone>)'
done