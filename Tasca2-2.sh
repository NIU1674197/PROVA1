#!/bin/bash

Imprimir(){

		length=`head -$i h.csv| tail -1| cut -d\; -f2`
		titol=`head -$i h.csv| tail -1| cut -d\; -f3`
		subject=`head -$i h.csv| tail -1| cut -d\; -f4`
		actor=`head -$i h.csv| tail -1| cut -d\; -f5`
		actress=`head -$i h.csv| tail -1| cut -d\; -f6`
		director=`head -$i h.csv| tail -1| cut -d\; -f7`
		popularitat=`head -$i h.csv| tail -1| cut -d\; -f8`
		premis=`head -$i h.csv| tail -1| cut -d\; -f9`

		echo "***********************************"	
		echo "Titol:              $titol" 
		echo "Any: $any  Longitud: $length Popularitat: $popularitat	 Premis: $premis  Tema: $subject"
		echo "Director: $director"
		echo "Actor:          $actor"
		echo "Actriu:         $actress"
		let i=i+1
		let comp=comp+1
}


#script principal
bucle=1
anyp=$2
anyg=$3

while [ $bucle -eq 1 ]
do
	tail +3 $1| sort -t ";" -k 1 -n >> h.csv

	lin=`wc -l < h.csv`
	i=1
	comp=0
	echo "Buscant..."
	echo "No sortir del programa"
	until [ $i -gt $lin ]
	do 
		any=`head -$i h.csv| tail -1| cut -d\; -f1`
		
		if [[ $any -ge $anyp  &&  $any -le $anyg ]];
		then
			Imprimir
			bucle=0
		else
			let i=i+1		
		fi
		

	done
	if [ $comp -eq 0 ];
	then
		rm h.csv
		echo "Opcio no trobada"
		echo "Vols tornar a cercar amb un altre parametre? (S/N)"
		read reset
		if [ $reset = "N" ]
		then
			bucle=0
			else
			if [ $reset = "S" ]
			then
				echo "Introduir any petit"
				read anyp
				echo "Introduir any gran"
				read anyg
				clear
			fi
		fi
	else
		echo " "
		echo "Totes les pel·licules trobades "
		echo "Pressiona qualsevol tecla per tornar al menu principal"
		rm h.csv	
	fi
	

done
