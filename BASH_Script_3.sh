#!/bin/sh

declare -a user_array=()


function marvel_character
{
	
	declare -a rando_array=()
	
	randnum=$((RANDOM%10))
	counter=0
	
	while [ $counter -lt $randnum ];
	do 
		rando_array+=(${user_array[$counter]})
		counter=$(($counter+1))
	done


	rando_array+=($1)

	counter=$randnum

	while [ $counter -lt 10 ];
	do
		rando_array+=(${user_array[$counter]})
		counter=$(($counter+1))
	
	done

	echo
	echo "$marvel is in index position $randnum"


	#this is the array printed again
	echo
	echo "The array is now: ${rando_array[*]}"
	

}


counter=0

while [ $counter -le 9 ];
do
	counter=$(($counter+1))
	read -p "Please enter a number or word for index position $counter: " enter
	user_array+=($(echo $enter | tr " " "_"))
	

done

#checking the length of the array
echo
echo "This array has ${#user_array[*]} items"
echo

#Printing out the array
echo "This is the array:"
echo ${user_array[*]}
echo

#Swapping the first item with the last item
echo "This is the array after swapping the first and last items:"
declare -a temp_array+=(${user_array[*]})

user_array[0]=${user_array[9]}
user_array[9]=${temp_array[0]}
#echo ${temp_array[*]}
echo ${user_array[*]}

echo

#printing the first 3 items and last three
echo "These are the first three and last three items in the array:"
echo ${user_array[*]:0:3} ${user_array[*]: -3}
echo

#loop through all items in array
for i in ${user_array[*]};
	do
		echo $i
	done
echo

#Checking for the word cat
value="cat"
value2="Cat"
counter=0
count=0
for i in ${!user_array[*]};
do
	if [[ ${user_array[$i]} == $value ]];then
		counter=1		
	
	elif [[ ${user_array[$i]} == $value2 ]];then
		count=1
	
	fi
done

if [[ counter -eq 1 ]];then
	echo "There is a cat in your array"

elif [[ count -eq 1 ]];then 
	echo "There is a Cat in your array"

else
	echo "There is not a cat in your array"

fi
echo

#Asking for a marvel character and calling the function
read -p "Enter a Marvel character: " marvel
marvel=$( echo $marvel | tr " " "_")

marvel_character $marvel
echo

#Copy all integers to new array and sort ascending
declare -a new_array=()

for i in ${user_array[*]};
do 
	if [[ $i =~ ^-?[0-9]+$ ]];then
		new_array+=($i)
	fi

done

new_array=($(for i in ${new_array[*]}; do echo $i; done | sort -n))

echo "The integers in the original array, sorted, are: ${new_array[*]}"

echo
read -p "Press enter to end the script" enter




