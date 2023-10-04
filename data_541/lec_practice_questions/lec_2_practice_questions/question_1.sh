read -p "Enter a number: " num1

if (($num1 > 0)); then 
	echo "Greater than 0"
elif (($num1 < 0)); then
	echo "Less than 0"
else
	echo "Number is 0"
fi