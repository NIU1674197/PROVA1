#!/bin/bash

lin=`wc -l < $1`
i=0
trobat=0
j=1
 
#Bucle per buscar peli
while [ "$i" = "$lin" ] || [ "$trobat" = 0 ]
do
	any=`head -$i $1| tail -1| cut -d\; -f1`
	titol=`head -$i $1| tail -1| cut -d\; -f3`
	director=`head -$i $1| tail -1| cut -d\; -f7`
	if [ "$any" = "$3" ] && [ "$titol" = "$2" ] && [ "$director" = "$8" ];
	then
		trobat=1
		else
			let i=i+1
	fi
done

let abans=i-1
let despres=i+1

	
if [ "$trobat" = 1 ];
then
	length=`head -$i $1| tail -1| cut -d\; -f2`	
	subject=`head -$i $1| tail -1| cut -d\; -f4`
	actor=`head -$i $1| tail -1| cut -d\; -f5`
	actress=`head -$i $1| tail -1| cut -d\; -f6`
	popularitat=`head -$i $1| tail -1| cut -d\; -f8`
	premis=`head -$i $1| tail -1| cut -d\; -f9`
	
	titol2="$2"
	any2="$3"
	
#Mira si s'ha de canviar o s'ha de deixar igual
	if [ "$4" = "=" ];
	then
		long2="$length"
		else
			long2="$4"
	fi
	
	if [ "$5" = "=" ];
	then
		pop2="$popularitat"
		else
			pop2="$5"
	fi
	
	if [ "$6" = "=" ];
	then
		premis2="$premis"
		else
			premis2="$6"
	fi
	
	if [ "$7" = "=" ];
	then
		tema2="$subject"
		else
			tema2="$7"
	fi
	
	director2="$8"
	
	if [ "$9" = "=" ];
	then
		actor2="$actor"
		else
			actor2="$9"
	fi
	
	if [ "${10}" = "=" ];
	then
		actriu2="$actress"
		else
			actriu2="${10}"
	fi
#Creació de fitxer amb la linea modifcada
	head -$abans films.csv >> peli.csv
	echo ""$any2";"$long2";"$titol2";"$tema2";"$actor2";"$actriu2";"$director2";"$pop2";"$premis2"" >> peli.csv
	tail +$despres films.csv >> peli.csv

	rm films.csv
	mv peli.csv films.csv
	
	#ImprimirModificacio
	any=`head -$i $1| tail -1| cut -d\; -f1`
	length=`head -$i $1| tail -1| cut -d\; -f2`
	titol=`head -$i $1| tail -1| cut -d\; -f3`
	subject=`head -$i $1| tail -1| cut -d\; -f4`
	actor=`head -$i $1| tail -1| cut -d\; -f5`
	actress=`head -$i $1| tail -1| cut -d\; -f6`
	director=`head -$i $1| tail -1| cut -d\; -f7`
	popularitat=`head -$i $1| tail -1| cut -d\; -f8`
	premis=`head -$i $1| tail -1| cut -d\; -f9`
	echo "--------------------------------------------------------------------------------------------------------"
	echo "4.3 - Modificacio"
	echo "--------------------------------------------------------------------------------------------------------"
	echo "Titol:              $titol" 
	echo "Any: $any  Longitud: $length Popularitat: $popularitat	 Premis: $premis  Tema: $subject"
	echo "Director: $director"
	echo "Actor:          $actor"
	echo "Actriu:         $actress"
	
	else
		echo "No s'ha pogut fer la modificació"
fi

echo "Pressiona qulasevol tecla per tornar al mentu anterior"

