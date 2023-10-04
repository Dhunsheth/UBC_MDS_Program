if [[ $# == 0 ]]; then
    echo "Please add some arguments."
    exit 1
fi

for (( i = $#; i>0; i-- ))
do
    echo ${!i}
done
