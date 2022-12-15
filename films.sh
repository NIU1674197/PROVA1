#!/bin/bash

i=0

arxiu=$1

function Menu(){
	clear
	echo "---------------------------------------------------"
	echo "Base de Dades de pel·lícules"
	echo "---------------------------------------------------"
	echo "1. Llistats de pel·lícules."
	echo "2. Cerca de pel·lícules."
	echo "3. Ets realment un Expert en pel·lícules?"
	echo "4. Altes, baixes i modificacions de la base de dades."
	echo "0. Sortir."
	
}

function Opcio1(){
	clear
	echo "---------------------------------------------------"
	echo "1 - Llistat de pel·licules"
	echo "---------------------------------------------------"
	echo "1 Mostrar llistat de pel·licules (alfabètic per títol)"
	echo "2 Mostrar llistat de pel·licules ordenats cronològicament per any."
	echo "3 Mostrar llistat de pel·licules ordenades per popularitat de més a menys."
	read -n1 select2
	echo " "
	case $select2 in
		1)
		bash Tasca1-1.sh $arxiu
		read -n1 n
		;;
		2)
		bash Tasca1-2.sh $arxiu
		read -n1 n
		;;
		3)
		bash Tasca1-3.sh $arxiu
		read -n1 n
		;;
	esac
}

function Opcio2(){
j=0
while [ $j = 0 ]
do
	clear
	echo "---------------------------------------------------"
	echo "2 - Cerca de pel·lícules"
	echo "---------------------------------------------------"
	echo "1 Cerca  pel·lícules per títol"
	echo "2 Cerca pel·lícules fetes entre dos anys"
	echo "3 Cerca de pel·licules on ha intervingut una determinada persona."
	echo "0 Tornar al menu anterior"
	read -n1 select3
	echo " "
	case $select3 in
		1)
		echo "Introduir cadena:"
		read cadena
		bash Tasca2-1.sh $arxiu "$cadena"
		read -n1 n
		;;
		2)
		echo "Introduir any petit"
		read anyp
		echo "Introduir any gran"
		read anyg
		bash Tasca2-2.sh $arxiu $anyp $anyg
		read -n1 n
		;;
		3)
		echo "Introduir nom persona"
		read persona
		bash Tasca2-3.sh $arxiu "$persona"
		read -n1 n
		;;
		*)
		j=1
		;;
	esac
done
}

function Opcio3(){
j=0
while [ $j = 0 ]
do
	clear
	echo "---------------------------------------------------"
	echo "3 - Ets realment un expert en pel·lícules?"
	echo "---------------------------------------------------"
	echo "1 De quin any és...?"
	echo "2 Qui va dirigir...?"
	echo "3 De quin tema és?"
	echo "0 Tornar al menu anterior"
	read -n1 select4
	case $select4 in
		1)
		bash Tasca3-1.sh $arxiu
		read -n1 n
		;;
		2)
		bash Tasca3-2.sh $arxiu
		read -n1 n
		;;
		3)
		bash Tasca3-3.sh $arxiu 
		read -n1 n
		;;
		*)
		j=1
		;;
	esac
done	
}

function Opcio4(){
j=0
while [ $j = 0 ]
do
	clear
	echo "---------------------------------------------------"
	echo "4 - Altes, baixes i modificacions de la base de 
	dades."
	echo "---------------------------------------------------"
	echo "1 Alta"
	echo "2 Baixa"
	echo "3 Modificació"
	echo "0 Tornar al menu anterior"
	read -n1 select5
	echo " "
	case $select5 in
		1)
		clear
		echo "---------------------------------------------------"
		echo "4.1 - Alta"
		echo "---------------------------------------------------"
		echo "Introduexi les següents dades:"
		echo "-Introduir el títol de la pel·lícula:"
		read titol
		echo "-Introduir l'any de la pel·lícula:"
		read any
		echo "-Introduir la longitud pel·lícula:"
		read longitud
		echo "-Introduir la popularitat de la pel·lícula:"
		read popularitat
		echo "-Introduir els premis de la pel·lícula"
		read premis
		echo "-Introduir el tema de la pel·lícula"
		read tema
		echo "-Introduir el director de la pel·lícula"
		read director
		echo "-Introduir l'actor de la pel·lícula"
		read actor
		echo "-Introduir l'actriu de la pel·lícula"
		read actriu
		bash Tasca4-1.sh "$arxiu" "$titol" "$any" "$longitud" "$popularitat" "$premis" "$tema" "$director" "$actor" "$actriu"
		read -n1 n
		;;
		2)
		clear
		echo "---------------------------------------------------"
		echo "4.2 - Baixa"
		echo "---------------------------------------------------"
		echo "Introduexi les següents dades:"
		echo "-Introduir el títol de la pel·lícula:"
		read titol
		echo "-Introduir l'any de la pel·lícula:"
		read any
		echo "-Introduir el director de la pel·lícula:"
		read director
		bash Tasca4-2.sh "$arxiu" "$titol" "$any" "$director"
		read -n1 n
		;;
		3)
		clear
		echo "---------------------------------------------------"
		echo "4.3 - Modificació"
		echo "---------------------------------------------------"
		echo "Introduexi les següents dades:"
		echo "-Introduir el títol de la pel·lícula:"
		read titol
		echo "-Introduir l'any de la pel·lícula:"
		read any
		echo "-Introduir el director de la pel·lícula"
		read director
		echo "A partir d'ara si vols modificar les dades escriu el canvi que vols fer i sinó vols modificar aquell apartat escriu un igual(=):"
		echo "-Introduir la longitud de la pel·lícula:"
		read longitud
		echo "-Introduir la popularitat de la pel·lícula:"
		read popularitat
		echo "-Introduir els premis de la pel·lícula"
		read premis
		echo "-Introduir el tema de la pel·lícula"
		read tema
		echo "-Introduir l'actor de la pel·lícula"
		read actor
		echo "-Introduir l'actriu de la pel·lícula"
		read actriu
		bash Tasca4-3.sh "$arxiu" "$titol" "$any" "$longitud" "$popularitat" "$premis" "$tema" "$director" "$actor" "$actriu"
		read -n1 n
		;;
		*)
		j=1
		;;
	esac
done
}


function OpcioNoValida(){
 	echo "ERROR"
}

while [ $i -eq 0 ]
do
	Menu
	read -n1 select
	echo " "
	case $select in
		1)
		Opcio1
		;;
		2)
		Opcio2
		;;
		3)
		Opcio3
		;;
		4)
		Opcio4
		;;
		0)
		i=1
		clear
		;;
		*)
		OpcioNoValida
		sleep 3
		;;
	esac
done
