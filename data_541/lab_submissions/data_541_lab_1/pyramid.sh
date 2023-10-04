#Shell Script to create pyramid using *
#rows=5          #Number of lines of stars

read -p "Enter the number of line of stars: " rows
re='^[0-9]+$'
if ! [[ $rows =~ $re ]] ; then
   echo "Error: Not an integer" >&2; exit 1
fi

for((i=rows; i>=1; i--))      #for loop for creating lines
do
  for((j=1; j<=rows - i; j++))  #for loop for creating spaces
  do
    echo -n "  "      #-n message to tell echo not to append a newline
  done
  if (($i == 1 || $i == $rows)); then
    for((j=1; j<=2*i - 1; j++))    # for loop for drawing stars
    do
      echo -n "* "
    done
  else
    echo -n "* "
    for((j=1; j<=2*i - 1 - 2; j++))
    do
      echo -n "  "
    done
    echo -n "* "
  fi
  echo
done
