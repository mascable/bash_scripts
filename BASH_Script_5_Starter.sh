#! /bin/bash

name_array=('Constance_Castillo' 'Kerry_Goodwin' 'Dorothy_Carson' 'Craig_Williams' 
'Daryl_Guzman' 'Sherman_Stewart' 'Marvin_Collier' 'Javier_Wilkerson' 'Lena_Olson' 
'Claudia_George' 'Erik_Elliott' 'Traci_Peters' 'Jack_Burke' 'Jody_Turner' 'Kristy_Jenkins' 
'Melissa_Griffin' 'Shelia_Ballard' 'Armando_Weaver' 'Elsie_Fitzgerald' 'Ben_Evans' 'Lucy_Baker' 
'Kerry_Anderson' 'Kendra_Tran' 'Arnold_Wells' 'Anita_Aguilar' 'Earnest_Reeves' 'Irving_Stone' 
'Alice_Moore' 'Leigh_Parsons' 'Mandy_Perez' 'Rolando_Paul' 'Delores_Pierce' 'Zachary_Webster' 
'Eddie_Ward' 'Alvin_Soto' 'Ross_Welch' 'Tanya_Padilla' 'Rachel_Logan' 'Angelica_Richards' 
'Shelley_Lucas' 'Alison_Porter' 'Lionel_Buchanan' 'Luis_Norman' 'Milton_Robinson' 'Ervin_Bryant' 
'Tabitha_Reid' 'Randal_Graves' 'Calvin_Murphy' 'Blanca_Bell' 'Dean_Walters' 'Elias_Klein' 
'Madeline_White' 'Marty_Lewis' 'Beatrice_Santiago' 'Willis_Tucker' 'Diane_Lloyd' 'Al_Harrison' 
'Barbara_Lawson' 'Jamie_Page' 'Conrad_Reynolds' 'Darnell_Goodman' 'Derrick_Mckenzie' 
'Erika_Miller' 'Tasha_Todd' 'Aaron_Nunez' 'Julio_Gomez' 'Tommie_Hunter' 'Darlene_Russell' 
'Monica_Abbott' 'Cassandra_Vargas' 'Gail_Obrien' 'Doug_Morales' 'Ian_James' 'Jean_Moran' 
'Carla_Ross' 'Marjorie_Hanson' 'Clark_Sullivan' 'Rick_Torres' 'Byron_Hardy' 'Ken_Chandler' 
'Brendan_Carr' 'Richard_Francis' 'Tyler_Mitchell' 'Edwin_Stevens' 'Paul_Santos' 
'Jesus_Griffith' 'Maggie_Maldonado' 'Isaac_Allen' 'Vanessa_Thompson' 'Jeremy_Barton' 
'Joey_Butler' 'Randy_Holmes' 'Loretta_Pittman' 'Essie_Johnston' 'Felix_Weber' 'Gary_Hawkins' 
'Vivian_Bowers' 'Dennis_Jefferson' 'Dale_Arnold' 'Joseph_Christensen' 'Billie_Norton' 
'Darla_Pope' 'Tommie_Dixon' 'Toby_Beck' 'Jodi_Payne' 'Marjorie_Lowe' 'Fernando_Ballard' 
'Jesse_Maldonado' 'Elsa_Burke' 'Jeanne_Vargas' 'Alton_Francis' 'Donald_Mitchell' 'Dianna_Perry' 
'Kristi_Stephens' 'Virgil_Goodwin' 'Edmund_Newton' 'Luther_Huff' 'Hannah_Anderson' 'Emmett_Gill' 
'Clayton_Wallace' 'Tracy_Mendez' 'Connie_Reeves' 'Jeanette_Hansen' 'Carole_Fox' 'Carmen_Fowler' 
'Alex_Diaz' 'Rick_Waters' 'Willis_Warren' 'Krista_Ferguson' 'Debra_Russell' 'Ellis_Christensen' 
'Freda_Johnston' 'Janis_Carpenter' 'Rosemary_Sherman' 'Earnest_Peters' 'Kelly_West' 
'Jorge_Caldwell' 'Moses_Norris' 'Erica_Riley' 'Ray_Gordon' 'Abel_Poole' 'Cary_Boone' 
'Grant_Gomez' 'Denise_Chapman' 'Vernon_Moran' 'Ben_Walker' 'Francis_Benson' 'Andrea_Sullivan' 
'Wayne_Rice' 'Jamie_Mason' 'Jane_Figueroa' 'Pat_Wade' 'Rudy_Bates' 'Clyde_Harris' 'Andre_Mathis' 
'Carlton_Oliver' 'Merle_Lee' 'Amber_Wright' 'Russell_Becker' 'Natalie_Wheeler' 'Maryann_Miller' 
'Lucia_Byrd' 'Jenny_Zimmerman' 'Kari_Mccarthy' 'Jeannette_Cain' 'Ian_Walsh' 'Herman_Martin' 
'Ginger_Farmer' 'Catherine_Williamson' 'Lorena_Henderson' 'Molly_Watkins' 'Sherman_Ford' 
'Adam_Gross' 'Alfred_Padilla' 'Dwayne_Gibson' 'Shawn_Hall' 'Anthony_Rios' 'Kelly_Thomas' 
'Allan_Owens' 'Duane_Malone' 'Chris_George' 'Dana_Holt' 'Muriel_Santiago' 'Shelley_Osborne' 
'Clinton_Ross' 'Kelley_Parsons' 'Sophia_Lewis' 'Sylvia_Cooper' 'Regina_Aguilar' 
'Sheila_Castillo' 'Sheri_Mcdonald' 'Lynn_Hodges' 'Patrick_Medina' 'Arlene_Tate' 'Minnie_Weber' 
'Geneva_Pena' 'Byron_Collier' 'Veronica_Higgins' 'Leo_Roy' 'Nelson_Lopez')

#This is the function for searching by the first name.
function optionOne
{
	#gathering info and title case
	echo
	read -p "Enter the first name or a partial start of the first name: " first

	first_initial=$(echo ${first:0:1} | tr [:lower:] [:upper:])
	first_remaining=${first:1}
	first_n="$first_initial$first_remaining"

	counter=0

	echo

	#for loop to loop through array and name match
	for i in ${name_array[*]};
	do
		if [[ $i == $first_n* ]];then
			counter=$(($counter + 1))
			echo $i | tr "_" " "

		fi

	done

	if [[ $counter -eq 0 ]];then
		echo "No first names were found starting with $first_n"

	fi	
}




#Function for searching by last name
function optionTwo
{
	counter=0
	
	#gathering input and title casing
	read -p "Enter the last name or a partial start of the last name: " last_search

	li=$(echo ${last_search:0:1} | tr [:lower:] [:upper:])
	lr=${last_search:1}
	last_name_s="_$li$lr"

	echo
	
	#for loop for checking last name from _
	for i in ${name_array[*]};
	do	
		if [[ $i == *$last_name_s* ]];then
			echo $i | tr "_" " "
			counter=$(($counter + 1))
		fi
	done

	if [[ $counter -eq 0 ]];then
		echo
		echo "No last names were found starting with $last_name_s"

	fi
}





#This is the function for adding a name to the array
function optionThree
{
	while true;
	do
		#Gathering input and title casing
		read -p "Enter the new first name: " nfirst
	
		if [[ $nfirst == *" "* ]];then
			echo "Just the first name, please. No Spaces."
			continue
		fi

		read -p "Enter the new last name: " nlast

		f_i=$(echo ${nfirst:0:1} | tr [:lower:] [:upper:])
		f_r=${nfirst:1}
		new_first="$f_i$f_r"

		l_i=$(echo ${nlast:0:1} | tr [:lower:] [:upper:])
		l_r=${nlast:1}
		new_last="$l_i$l_r"
	
		new_full="$new_first $new_last"
		echo
		echo "$new_full has been added to the array."
	
		
		#this line translates for the array and then we add to array
		newf=$(echo $new_full | tr " " "_")

		name_array+=($newf)
	
		break		

	done

}


#This is function to delete a name
function optionFour
{
	while true;
	do
		
		#here we gather the user input and then split it into first and last name
		#and make it title case

		echo "Delete a name by entering the full name ie: John Smith"
		read -p "Enter the full name (Q to return to the main menu, 1 to search first names): "\
		del_name
		
		del_name=$(echo $del_name | tr [:upper:] [:lower:])
		first_name=$(echo $del_name | cut -d " " -f 1)
		last_name=$(echo $del_name | cut -d " " -f2)

		first_initial=$(echo ${first_name:0:1} | tr [:lower:] [:upper:])
		first_remaining=${first_name:1}
		first_n="$first_initial$first_remaining"
		
		last_initial=$(echo ${last_name:0:1} | tr [:lower:] [:upper:])
		last_remaining=${last_name:1}
		last_n="$last_initial$last_remaining"

		full_name="${first_n}_${last_n}"	
		f_name="${first_n} ${last_n}"	
		


		count=0
		declare -a new_array=()


		if [[ $del_name == "Q" || $del_name == "q" ]];then
			break

		elif [[ $del_name -eq 1 ]] > /dev/null 2>&1 ;then
			optionOne
			echo
			continue

		fi

		#For loop for checking name and then adding everything else to a new array
		for i in ${name_array[*]};
			do
				if [[ $i == $full_name* ]];then
					count=$(($count+1))
				
				else
					new_array+=($i)
					
				fi
			done


		if [[ $count -eq 0 ]];then
			echo
			echo "Name is not in list. Try again."
			echo
		
		#Setting the old array = to new array without the one name
		else
			name_array=(${new_array[*]})
			echo
			echo "$f_name has been deleted from the array"
			break
		fi
	done
	
}

#This is the main menu
while true;
do
	echo
	echo "Please select from the following options:"
	echo
	echo "	1. List all names starting with one or more letters of the first name"
	echo "	2. List all names starting with one or more letters of the last name"
	echo "	3. Add a name"
	echo "	4. Delete a name"
	echo "	5. Exit"
	echo
	read -p "Option #: " choice

	if [ $choice -eq 1 ];then
		optionOne

	elif [ $choice -eq 2 ];then
		optionTwo

	elif [ $choice -eq 3 ];then
		optionThree

	elif [ $choice -eq 4 ];then
		optionFour

	elif [ $choice -eq 5 ];then
		break

	else
		echo
		echo "That is not a valid option"

	fi

done
