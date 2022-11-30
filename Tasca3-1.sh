#!/bin/bash


#Crear valors per les 3 lineas
lin=`wc -l < $1`

rand1=$(( $RANDOM % $lin + 3 ))
any1=`head -$rand1 $1| tail -1| cut -d\; -f1`

rand2=$(( $RANDOM % $lin + 3 ))
any2=`head -$rand2 $1| tail -1| cut -d\; -f1`

while [ any1 = any2 ]
do
	rand2=$(( $RANDOM % $lin + 3 ))
	any2=`head -$rand2 $1| tail -1| cut -d\; -f1`
done

rand3=$(( $RANDOM % $lin + 3 ))
any3=`head -$rand3 $1| tail -1| cut -d\; -f1`
	
while [ any3 = any1 ] || [ any3 = any2 ]
do
	rand3=$(( $RANDOM % $lin + 3 ))
	
	any3=`head -$rand3 $1| tail -1| cut -d\; -f1`
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
echo "3.2 - De quin any és ...?"
echo "--------------------------------------------------------------------------------------------------------"
echo "Titol:              $titol" 
echo "Any: ????  Longitud: $length Popularitat: $popularitat	 Premis: $premis  Tema: $subject"
echo "Director: $director"
echo "Actor:          $actor"
echo "Actriu:         $actress"
echo "--------------------------------------------------------------------------------------------------------"
		
#Imprimir pregunta
posicio=$(( $RANDOM % 3 + 1 ))

echo "Anys Possibles: "
case $posicio in
	1)
	echo $any1 $any2 $any3
	;;
	2)
	echo $any3 $any1 $any2
	;;
	3)
	echo $any2 $any3 $any1
	;;
esac

echo "    Escriu l'any correcte:"
read any
#Comprovar si any correcte
if [ $any1 = $any ]
then
	echo "FELICITATS!!!!"
	else	
		echo "L'any correcte és $any1"
fi
echo " "
echo "Pressiona qualsevol tecla per continuar"



