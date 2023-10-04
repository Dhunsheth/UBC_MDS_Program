read -p 'Enter 2 numbers: ' num1 num2
echo "sum is $((num1+num2))"
echo "difference is $((num1-num2))"
echo "product is $((num1*num2))"
echo -n "quoties is" 
echo "scale=2; $num1 / $num2" | bc