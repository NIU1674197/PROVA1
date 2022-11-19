#!/bin/bash

Imprimir(){
		any=`head -$i h.csv| tail -1| cut -d\; -f1`
		length=`head -$i h.csv| tail -1| cut -d\; -f2`
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
cadena="$2"
bucle=1
 

while [ $bucle -eq 1 ]
do
	tail +3 $1 |sort -t ";" -k 3 >> h.csv

	lin=`wc -l < h.csv`
	i=1
	comp=0
	echo "Buscant..."
	echo "No sortir del programa"
	until [ $i -gt $lin ]
	do 
		titol=`head -$i h.csv| tail -1| cut -d\; -f3`
		echo $titol > aux.csv
	
		cerca=`grep "$cadena" aux.csv`
		if [[ -n $cerca ]];
		then
			Imprimir
			bucle=0
		else
			let i=i+1		
		fi
		rm aux.csv

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
				echo "Introduir cadena"
				read cadena
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
