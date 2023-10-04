read -p "Enter an integer greater than 10: " int
re='^[0-9]+$'
if ! [[ $int =~ $re ]] ; then
   echo "Error: Not an integer" >&2; exit 1
elif (( $int < 11 )); then
    echo "Integer is not greater than 10, please try again." ; exit 1
fi

for (( i = ${#int}-1; i >= 0; i-- ))
do
   echo -n ${int:$i:1}
   #statements
done
echo
