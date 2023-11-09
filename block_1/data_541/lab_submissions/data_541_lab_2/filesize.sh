file_path="$1"

if [[ -f $file_path ]]; then
	echo $file_path
	echo -n "File size is: "
	wc -c $file_path | awk '{print $1;}' 
else
    echo "File not found or file doesn't exist."
fi