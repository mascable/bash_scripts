#!/bin/sh


#This is my integer function.

function IntegerFunction
{
	#passing the choice into the function

	user_int=$choice

	#my if statements to get it to do the things I want.

	if [ $user_int -ge 11 ] > /dev/null 2>&1 ;then
		echo
		echo "That is not an integer between 1 and 10. Try again."
		echo
		continue

	elif [ $user_int -le 0 ] > /dev/null 2>&1 ;then
		echo
		echo "That is not an integer between 1 and 10. Try again."
		echo
		continue

	elif [[ $user_int =~ ^[a-zA-Z]+$ ]];then
		echo		
		echo "That is not an integer between 1 and 10. Try again."
		echo
		continue
	
	#The math of the program.

	else
		ans=$((($user_int * $user_int) + $user_int))
		echo
		echo "The result is" $ans
		echo

	fi

}

#The while loop wrapping my body which takes in the user choice.

while true;
do
	read -p "Please enter an integer between 1 and 10 (q to quit): " choice

	if [[ $choice == "q" || $choice == "Q" ]];then
		echo
		echo "Quitting..."
		echo
		exit	

	else
		IntegerFunction $choice
	fi
done

