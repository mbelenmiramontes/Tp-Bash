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

  case $opcion in
	1)
	  if [ -d "EPNro1" ]; then
	  	echo "El entorno EPNro1 ya existe."
	  else
           	mkdir -p EPNro1/entrada EPNro1/procesado EPNro1/salida
            	echo "Creación de entorno EPNro1 exitoso."
	  fi
          ;;
	2)
	  if [! -f "EPNro1/consolidar.sh ]; then
	
        6)
          echo -e "Saliendo..."
          exit
          ;;
        *)
          echo -e "Opción no válida. Por favor, intentá de nuevo."
          ;;
    esac
done

