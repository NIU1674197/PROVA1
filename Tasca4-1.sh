#!/bin/bash



lin=`wc -l < $1`
i=0
trobat=0

while [ $i -le $lin ] && [ "$trobat" = 0 ]
do
	any=`head -$i $1| tail -1| cut -d\; -f1`
	titol=`head -$i $1| tail -1| cut -d\; -f3`
	director=`head -$i $1| tail -1| cut -d\; -f7`
	if [ "$any" = "$3" ] && [ "$titol" = "$2" ] && [ "$director" = "$8" ];
	then
		trobat=1
	fi
	let i=i+1
done
	
if [ "$trobat" = 1 ];
then
echo "La pel·licula que vols afegir ja esta al fitxer films.csv."
else
echo ""$3";"$4";"$2";"$7";"$9";"${10}";"$8";"$5";"$6"" >> films.csv
echo "La pel·licula ha estat donada d'alta amb èxit"
echo "*****"	
echo "Titol:              $2" 
echo "Any: $3  Longitud: $4 Popularitat: $5	 Premis: $6  Tema: $7"
echo "Director: $8"
echo "Actor:          $9"
echo "Actriu:         ${10}"
echo "*****"
fi
echo " "
echo "Pressiona qualsevol tecla per continuar"
