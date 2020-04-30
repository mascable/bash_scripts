#! /bin/bash

lyrics_string="Quisiera:Ayer:cambiarle:conocí:el:un:final
:cielo:al:sin:cuento|Las:sol|Y:barras:un:y:hombre:los:sin
:tragos:suelo|Un:han:santo:sido:en:testigo|De:prision|Y:el
:una:dolor:canción:que:triste:me:sin:causaste:dueño|Y:y
:conocí:to':tus:lo:ojos:que:negros|Y:hciste:ahora:conmigo|Un
:sí:infeliz:que:en:no:el:puedo:amor,:vivir:que:sin:aun
:ellos:no:yo|Le:te:pido:supera|Que:al:ahora:cielo:camina
:solo:solo:un:sin:deseo|Que:nadie:en:por:tus:todas:ojos
:las:yo:aceras|Preguntándole:pueda:a:vivir|He:Dios:recorrido
:si:el:en:mundo:verad:entero|te:el:vengo:amor:a:existe|:decir|"

echo

#using sed to change | to a new line
songs=$(echo $lyrics_string | sed 's/|/\\n/g')


#declaration of new array and cutting
declare -a my_array=()
my_array=($(echo $songs | cut -d ":" -f 1-))

my_array=($(echo $songs | tr ":" " "))

#new arrays for the songs
declare -a song1=()
declare -a song2=()


#my while loop for adding the words to the correct arrays
len=0

while [ $len -lt ${#my_array[*]} ]
do 
	song1+=(${my_array[$len]})
	song2+=(${my_array[$len+1]})
	
	len=$(($len+2))

done


#printing the songs
echo -e ${song1[*]}
echo
echo -e ${song2[*]}


#while loops for changing to lower case and changing new line to a space
count=0

while [ $count -lt ${#song1[*]} ];
do
	song1[$count]=$(echo ${song1[$count]} | tr [:upper:] [:lower:])
	song1[$count]=$(echo ${song1[$count]} | sed 's/\\n/ /g')

	count=$(($count+1))
done

counter=0

while [ $counter -lt ${#song2[*]} ];
do
	song2[$counter]=$(echo ${song2[$counter]} | tr [:upper:] [:lower:])
	song2[$counter]=$(echo ${song2[$counter]} | sed 's/\\n/ /g')
	
	counter=$(($counter+1))
done

echo

declare -a multiple_words_in_both_songs=()

#for loop for adding same words to the new array.
for i in ${song1[*]};
do 
	for j in ${song2[*]};
	do
		if [ $i == $j ];then
			flag=0
			
			for k in ${multiple_words_in_both_songs[*]};
			do
				if [ $i == $k ];then
					flag=1
				fi	
			done
			
			if [ $flag -eq 0 ];then
				multiple_words_in_both_songs+=($i)
			fi
		fi	
	done

done

#sorting the words
multiple_words_in_both_songs=($(for i in ${multiple_words_in_both_songs[*]}; do echo $i; done | sort))

echo "Words that are in both songs ${multiple_words_in_both_songs[*]}"
echo

read -p "Press enter to exit the script" enter
