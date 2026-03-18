comprobar_entorno() {
	[[ -d "EPNro1/entrada" && -d "EPNro1/salida" && -d "EPNro1/proceso" ]]
}

comprobar_filename() {
	[[ -n "$FILENAME" && -f "EPNro1/salida/$FILENAME.txt" ]]
}

  echo "⏔⏔⏔⏔⏔⏔ ꒰ MENÚ ꒱⏔⏔⏔⏔⏔⏔ "
  echo "╰┈➤. Opción 1) Crear entorno"
  echo "╰┈➤. Opción 2)  Correr proceso"
  echo "╰┈➤. Opción 3)  Alumnos ordenados"
  echo "╰┈➤. Opción 4)  Notas más altas"
  echo "╰┈➤. Opción 5)  Nro padrón"
  echo "╰┈➤. Opción 6)  Salir"
  echo "⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔"

while true
do

  echo ""
  read -p "Porfavor, elegí una opcion: " opcion
  echo ""


	if [[ $opcion != "1" && $opcion != "6"]]; then
	  if ! comprobar_entorno; then
	      echo "Error: el entorno esta incompleto, por favor seleccionar la opcion 1 primero."
	      continue
	  fi
	fi

  case $opcion in
	1)
	  if comprobar_entorno; then
	  	echo "El entorno EPNro1 y sus subcarpetas ya existen."
	  else
           	mkdir -p EPNro1/entrada EPNro1/procesado EPNro1/salida
            	echo "Creación de entorno EPNro1 exitoso."
	  fi
        ;;
	2)
	  if [ ! -f "EPNro1/consolidar.sh ]; then
		cat << 'EOF' > EPNro1/consolidar.sh
		#!/bin/bash
	
		EOF
		bash consolidar.sh
	  else
		bash consolidar.sh
	  fi
	3)
	  if comprobar_filename(); then
	    sort -n -k1 "EPNro1/salida/$FILENAME.txt"
	  else
	    echo "No existe el archivo $FILENAME. Por favor hacer el paso 2 primero."
	  fi
	;;
	4)
	  if comprobar_filename(); then
	    sort -k5 -n -z | head -10 "EPNro1/salida/$FILENAME.txt"
	  else
	    echo "No existe el archivo $FILENAME. Por favor hacer el paso 2 primero."
	  fi
	;;
	5)
	  if comprobar_filename(); then
	    while true
	    do
	    	echo "escribir un numero de padron: "
	    	read padron
		  
		  if padron 

	;;
        6)
          echo -e "Saliendo..."
          exit
          ;;
        *)
          echo -e "Opción no válida. Por favor, intentá de nuevo."
          ;;
    esac
done
