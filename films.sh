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
function enDesenvolupament(){
	echo "En desenvolupament"
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
		enDesenvolupament
		read -n1 n
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
