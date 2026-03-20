#!/bin/bash

ARCHIVO="$FILENAME.txt"

while true;
do
  for file in $HOME/EPNro1/entrada/*.txt;
  do
	if [ -f "$file" ]; then
    	  cat "$file" >> $HOME/EPNro1/salida/$ARCHIVO
	  mv "$file" $HOME/EPNro1/procesado/
	fi
  done
  sleep 3
done
