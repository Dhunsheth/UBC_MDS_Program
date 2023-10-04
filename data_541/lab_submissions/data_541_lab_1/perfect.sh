read -p "Enter the first integer: " int1
re='^[0-9]+$'
if ! [[ $int1 =~ $re ]] ; then
   echo "Error: Not an integer" >&2; exit 1
fi
read -p "Enter the second integer: " int2
if ! [[ $int2 =~ $re ]] ; then
   echo "Error: Not an integer" >&2; exit 1
fi

if (( $int1 > $int2 )); then
	let int3=int1
	let int1=int2
	let int2=int3
fi

for (( c=$int1; c<=$int2; c++ ))
do
	sum=0
	for (( k=1; k<$c; k++ ))
	do 
		mod=$((c%k))
		if (( $mod == 0 )); then
			sum=$((k+sum))
		fi
	done
	if (( $sum == $c )); then
		echo $c
	fi
done

