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
	read select2
	if [ $select2 = 1 ];
	then
		bash Tasca1-1.sh $arxiu
		read -n1 n
		else
			if [ $select2 = 2 ];
			then
				bash Tasca1-2.sh $arxiu
				read -n1 n
				else
					if [ $select2 = 3 ];
					then
						bash Tasca1-3.sh $arxiu
						read -n1 n
					fi
			fi
	fi

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
	read select
	if [ $select = 1 ];
	then 
		Opcio1
		else
			if [[ $select > 1  &&  $select < 5 ]] ;
			then 
				enDesenvolupament

				read -n1 n
		
		
				else
					if [ $select = 0 ] ;
					then
					i=1
				
					else 	
						OpcioNoValida
						sleep 3
				
					fi
			fi
	fi
done
