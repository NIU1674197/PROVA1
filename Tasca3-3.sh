liniesarxiu=`cut -d: -f1 $1 | wc -l`	
let numrandom=$liniesarxiu-1
let random=$(($RANDOM%$numrandom))+1
		
		
		any=`head -$random $1| tail -1| cut -d\; -f1`
		length=`head -$random $1| tail -1| cut -d\; -f2`
		titol=`head -$random $1| tail -1| cut -d\; -f3`
		subject=`head -$random $1| tail -1| cut -d\; -f4`
		actor=`head -$random $1| tail -1| cut -d\; -f5`
		actress=`head -$random $1| tail -1| cut -d\; -f6`
		director=`head -$random $1| tail -1| cut -d\; -f7`
		popularitat=`head -$random $1| tail -1| cut -d\; -f8`
		premis=`head -$random $1| tail -1| cut -d\; -f9`

		echo "***********************************"	
		echo "Titol:              $titol" 
		echo "Any: $any  Longitud: $length Popularitat: $popularitat	 Premis: $premis  Tema: ???"
		echo "Director: $director"
		echo "Actor:          $actor"
		echo "Actriu:         $actress"
		echo "***********************************"
		echo "Temes possibles"
		awk -F ";" '{print $4}' $1 | tail +3  | sort -t ";" -k 4 | uniq >> temes.csv
		lintemes=`wc -l < temes.csv`
		i=1

		until [ $i -gt $lintemes ]
		do 
		Mostrar=`head -$i temes.csv | tail -1` 
		echo "$i - $Mostrar" 
		let i=i+1
		done
		echo "Selecciona una opció"
		read opcio
		
		resposta=`head -$opcio temes.csv | tail -1`
		
		
		if [[ "$resposta" = "$subject" ]]
		then
		echo "Felicitats has encertat el tema"
		else 
		echo "El tema seleccionat no es el correcte. Era $subject."
		fi
		rm temes.csv
