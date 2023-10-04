if [[ $# != 2 ]]; then
    echo "Please try again with the correct number of arguments."
    exit 1
fi

file_name="$1"
string="$2"

if [[ -f $file_name ]]; then
    cat $file_name | grep -i $string
    grep -o -i $string $file_name | wc -w
else
    echo "File not found in current directory, please try again."
fi
