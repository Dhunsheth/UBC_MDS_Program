current_directory=$PWD
home=$HOME

if [[ $current_directory == $home ]]; then
	echo "The script is executed from your Home directory"
else
	echo "The script is executed from $current_directory"
fi