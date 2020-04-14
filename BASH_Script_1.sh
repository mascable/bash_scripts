#! /bin/sh


#These are my variables
BASE_PRICE="100"

RUNNING_total="0"

random_var=$((( ($RANDOM%7)-3)*5 ))

total_price=$(($BASE_PRICE + $random_var))

#this is the menu and prompt for soda choice
echo "Welcome to the soda machine. You can enter values of 5, 10 or 25 in payment."
echo

read -p "What type of soda would you like? " user_soda
echo

echo "The current price of $user_soda is $total_price"
echo

#The while loop for doing the thing
while true;
do
	read -p "Enter a coin: " coin_entered 
	
	#These are the if/elif/else statements for if coin entered do this
	if [ $coin_entered -eq 5 ] > /dev/null 2>&1 ;then

		#The maths of the program
		RUNNING_total=$(($coin_entered + $RUNNING_total))
		balance=$(($total_price-$RUNNING_total))
		refund=$(($balance*-1))

						
		echo "You have inserted a nickle"

		#The if statements for the if balance do this portion.				
		if [ $balance -gt 0 ];then
			echo "Your balance is still $balance cents"
			echo

		elif [ $balance -lt 0 ];then
			echo "You have been refunded $refund cents"
			break
		else
			echo "Your balance is $balance cents"
			echo
			break
		fi

	elif [ $coin_entered -eq 10 ] > /dev/null 2>&1 ;then
		
		RUNNING_total=$(($coin_entered + $RUNNING_total))
		balance=$(($total_price-$RUNNING_total))
		refund=$(($balance*-1))


		echo "You have inserted a dime"

		if [ $balance -gt 0 ];then
			echo "Your balance is still $balance cents"
			echo

		elif [ $balance -lt 0 ];then
			echo "You have been refunded $refund cents"
			break
		else
			echo "Your balance is $balance cents"
			break
		fi

	elif [ $coin_entered -eq 25 ] > /dev/null 2>&1 ;then
		RUNNING_total=$(($coin_entered + $RUNNING_total))
		balance=$(($total_price-$RUNNING_total))
		refund=$(($balance*-1))


		echo "You have inserted a quarter"

		if [ $balance -gt 0 ];then
			echo "Your balance is still $balance cents"
			echo

		elif [ $balance -lt 0 ];then
			echo "You have been refunded $refund cents"
			echo
			break

		else
			echo "Your balance is $balance cents"
			echo
			break	
		fi

	else 
		echo "That is not a valid amount"
		echo
		continue
	fi

done

#saying goodbye to the user
echo "Your $user_soda is being dispensed. Thank you!"
echo
read -p "Press the enter key to close the script" enter
