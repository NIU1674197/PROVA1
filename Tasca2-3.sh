#!/bin/bash

Imprimir(){
		any=`head -$i h.csv| tail -1| cut -d\; -f1`
		length=`head -$i h.csv| tail -1| cut -d\; -f2`
		titol=`head -$i h.csv| tail -1| cut -d\; -f3`
		subject=`head -$i h.csv| tail -1| cut -d\; -f4`
		popularitat=`head -$i h.csv| tail -1| cut -d\; -f8`
		premis=`head -$i h.csv| tail -1| cut -d\; -f9`

		echo "*******************************************************************************************************"	
		echo "Titol:              $titol" 
		echo "Any: $any  Longitud: $length Popularitat: $popularitat	 Premis: $premis  Tema: $subject"
		echo "Director: $director"
		echo "Actor:          $actor"
		echo "Actriu:         $actress"
		let i=i+1
		let comp=comp+1
}


#script principal
persona="$2"
bucle=1
 

while [ $bucle -eq 1 ]
do
	#Ordenar per popularitat en un arxiu
	tail +3 $1| sort -t ";" -k 8 -n -r >> h.csv

	lin=`wc -l < h.csv`
	i=1
	comp=0
	echo "Buscant..."
	echo "No sortir del programa"
	until [ $i -gt $lin ]
	do 
	#crea 3 fitxer on hi ha actor actiru i director
		actor=`head -$i h.csv| tail -1| cut -d\; -f5`
		actress=`head -$i h.csv| tail -1| cut -d\; -f6`
		director=`head -$i h.csv| tail -1| cut -d\; -f7`
		echo $actor > aux1.csv
		cerca1=`grep "$persona" aux1.csv`
		echo $actress > aux2.csv
		cerca2=`grep "$persona" aux2.csv`
		echo $director > aux3.csv
		cerca3=`grep "$persona" aux3.csv`
		#mira en els 3 arxius si esta la persona
		if [[ -n $cerca1 ]] || [[ -n $cerca2 ]] || [[ -n $cerca3 ]];
		then
			Imprimir
			bucle=0
		else
			let i=i+1		
		fi
		rm aux1.csv
		rm aux2.csv
		rm aux3.csv

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
				read persona
				clear
			fi
		fi
	else
		echo " "
		echo "Totes les pel·licules trobades "
		echo "Pressiona qualsevol tecla per tornar al menu principal"		
	fi
	

done
rm h.csv

