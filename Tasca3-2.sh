#!/bin/bash

#Crear valors per les 3 lineas
lin=`wc -l < $1`

rand1=$(( $RANDOM % $lin + 3 ))
dir1=`head -$rand1 $1| tail -1| cut -d\; -f7`

rand2=$(( $RANDOM % $lin + 3 ))
dir2=`head -$rand2 $1| tail -1| cut -d\; -f7`

while [ "dir1" = "dir2" ]
do
	rand2=$(( $RANDOM % $lin + 3 ))
	dir2=`head -$rand2 $1| tail -1| cut -d\; -f7`
done

rand3=$(( $RANDOM % $lin + 3 ))
dir3=`head -$rand3 $1| tail -1| cut -d\; -f7`
	
while [ "dir3" = "dir1" ] || [ "dir3" = "dir2" ]
do
	rand3=$(( $RANDOM % $lin + 3 ))
	
	dir3=`head -$rand3 $1| tail -1| cut -d\; -f7`
done
clear

#ImprimirIncognita
any=`head -$rand1 $1| tail -1| cut -d\; -f1`
length=`head -$rand1 $1| tail -1| cut -d\; -f2`
titol=`head -$rand1 $1| tail -1| cut -d\; -f3`
subject=`head -$rand1 $1| tail -1| cut -d\; -f4`
actor=`head -$rand1 $1| tail -1| cut -d\; -f5`
actress=`head -$rand1 $1| tail -1| cut -d\; -f6`
director=`head -$rand1 $1| tail -1| cut -d\; -f7`
popularitat=`head -$rand1 $1| tail -1| cut -d\; -f8`
premis=`head -$rand1 $1| tail -1| cut -d\; -f9`
echo "--------------------------------------------------------------------------------------------------------"	
echo "3.2 - Qui va dirigir ...?"
echo "--------------------------------------------------------------------------------------------------------"
echo "Titol:              $titol" 
echo "Any: $any  Longitud: $length Popularitat: $popularitat	 Premis: $premis  Tema: $subject"
echo "Director: ??? "
echo "Actor:          $actor"
echo "Actriu:         $actress"
echo "--------------------------------------------------------------------------------------------------------"
		
#Imprimir pregunta
posicio=$(( $RANDOM % 3 + 1 ))

echo "Directors possibles: "
case $posicio in
	1)
	echo "1- "$dir1" "
	echo "2- "$dir2" "
	echo "3- "$dir3""
	correcte=1
	;;
	2)
	echo "1- "$dir3""
	echo "2- "$dir1""
	echo "3- "$dir2""
	correcte=2
	;;
	3)
	echo "1- "$dir2""
	echo "2- "$dir3""
	echo "3- "$dir1""
	correcte=3
	;;
esac

echo "    Selecciona una opció [1,2,3]:"
read -n1 opcio
echo " "
#Comprovar si director correcte
if [ $opcio = $correcte ]
then
	echo "FELICITATS!!!!"
	else	
		echo "El director correcte és $dir1"
fi

echo " "
echo "Pressiona qualsevol tecla per continuar"

