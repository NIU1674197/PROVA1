#!/bin/bash

i=3
lin=`wc -l < $1`  

awk -F ";" '{print $0}' $1 | sort -t ";" -k 8 -n -r >> h.csv

until [ $i -gt $lin ]
	do 

		any=`head -$i h.csv| tail -1| cut -d\; -f1`
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
	
	
	done
rm h.csv
