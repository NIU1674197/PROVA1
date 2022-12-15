#!/bin/bash

lin=`wc -l < $1`
i=0
trobat=0
 
clear
echo "Buscant..."
#Bucle per buscar peli
while [ $i -le $lin ] && [ "$trobat" = 0 ]
do
	any=`head -$i $1| tail -1| cut -d\; -f1`
	titol=`head -$i $1| tail -1| cut -d\; -f3`
	director=`head -$i $1| tail -1| cut -d\; -f7`
	if [ "$any" = "$3" ] && [ "$titol" = "$2" ] && [ "$director" = "$4" ];
	then
		trobat=1
		else 
		let i=i+1
	fi
	
done
clear
let abans=i-1
let despres=i+1

	
if [ "$trobat" = 1 ];
then
	
	head -$abans films.csv >> peli.csv
	tail +$despres films.csv >> peli.csv

	rm films.csv
	mv peli.csv films.csv
	echo "La pel·lícula ha estat donada de baixa amb èxit."
		else
		echo "No s'ha trobat cap pel·lícula amb aquesta cerca."
fi
echo " "
echo "Pressiona qulasevol tecla per tornar al mentu anterior"
