#!/bin/bash

#Si el usuario ejecuta el script con -d va a mostrar el mensaje "Borrando
# entorno" en pantalla y va a con rm va a eliminar la carpeta EPNro1 y con
# -r va a borrar lo que haya adentro de la carpeta  y el pkill mata todos 
# los programas en ejecución con -f busca en todo el comando

if [ "$1" == "-d" ]; then
    echo "Borrando el entorno"
    rm -r $HOME/EPNro1
    pkill -f consolidar.sh
    exit 0
fi

comprobar_entorno() {
	[[ -d "$HOME/EPNro1/entrada" && -d "$HOME/EPNro1/salida" && -d "$HOME/EPNro1/procesado" ]]
}

comprobar_filename() {
	[[ -n "$FILENAME" && -f "$HOME/EPNro1/salida/$FILENAME.txt" ]]
}

  echo "⏔⏔⏔⏔⏔⏔ ꒰ MENÚ ꒱⏔⏔⏔⏔⏔⏔ "
  echo "╰┈➤. Opción 1) Crear entorno"
  echo "╰┈➤. Opción 2)  Correr proceso"
  echo "╰┈➤. Opción 3)  Alumnos ordenados"
  echo "╰┈➤. Opción 4)  Notas más altas"
  echo "╰┈➤. Opción 5)  Nro padrón"
  echo "╰┈➤. Opción 6)  Salir"
  echo "⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔⏔"
  echo $FILENAME
while true
do

  echo ""
  read -p "Porfavor, elegí una opcion: " opcion
  echo ""


       # if [[ $opcion != "1" && $opcion != "6" ]]; then
	# if ! comprobar_entorno; then
	    #echo "Error: el entorno esta incompleto, por favor seleccionar la opcion 1 primero."
	 #    continue
	# fi
#	fi

  case $opcion in
	1)
	  if comprobar_entorno; then
	  	echo "El entorno EPNro1 y sus subcarpetas ya existen."
	  else
           	mkdir -p $HOME/EPNro1/entrada $HOME/EPNro1/procesado $HOME/EPNro1/salida
            	echo "Creación de entorno EPNro1 exitoso."
	  fi
        ;;
	2)

	  echo "proceso funcionando correctamente en el background."
          bash $HOME/EPNro1/consolidar.sh &
	;;
	3)
	  if comprobar_filename; then
	    sort -n -k1 "EPNro1/salida/$FILENAME.txt"
	  else
	    echo "No existe el archivo $FILENAME. Por favor hacer el paso 2 primero."
	  fi
       	  ;;
	4)
	  if comprobar_filename; then
	    sort -k5 -nr "EPNro1/salida/$FILENAME.txt" | head -10
	  else
	    echo "No existe el archivo $FILENAME. Por favor hacer el paso 2 primero."
	  fi
	  ;;
	5)
	#Solicitar al usuario un nro de padrón, y mostrar por pantalla, los datos del mismo
	#provenientes del archivo FILENAME.txt de la carpeta salida\
	 if comprobar_filename; then
	    echo "escribir un numero de padron: "
	    echo ""
	    read padron

		if grep -q -w "$padron" "EPNro1/salida/$FILENAME.txt"; then
			echo ""
			grep -w "$padron" "EPNro1/salida/$FILENAME.txt"
		else
			echo ""
		        echo "El padron no existe"
		fi
	  fi
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
