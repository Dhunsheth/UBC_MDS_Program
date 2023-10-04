# n=3
# for (( i=1; i<=n; i+=1  ))
# do
# 	output=""
# 	for (( j=1; j<=i; j+=1 ))
# 	do 
# 		output+=$j
# 	done
# 	echo $output
# done

var1=2
var2=3
for ((i=1;i<=var2;i++))
do
	for ((j=1;j<=i;j++))
	do
		echo -n "$var1"
		var1=$((var1 + 1))
	done
	echo ""
done

# j=1
# while [ $j -le 2 ]
# do
# 	i=1
# 	while [ $i -le 2 ]
# 	do
# 		echo "$j $i"
# 		i=$((i+1))
# 	done
# 	j=$((j+1))
# done

# for i in {2..3..1}; do
# 	for j in {2..3..1}; do
# 		if [ $i -eq 3 ]; then
# 			echo "$i $j"
# 			continue
# 		elif [ $j -eq 2 ]; then
# 			echo "$i $j"
# 			break
# 		fi
# 	done
# done
