#!/bin/bash

echo 'prgdata autoupdate - start'
if [ ! -d ~/Dokumenty/prgdata/ ]; then
	echo 'brak prgdata - klonuje z github'
	cd ~/Dokumenty/
	git clone git@github.com:skowronskij/prgdata.git	
fi

cd ~/Dokumenty/lazyADP/R/
Rscript update.R "~/Dokumenty"

cd ~/Dokumenty/prgdata/
git add .
git commit . -m "Aktualizacja danych `date +'%Y-%m-%d'`"
git push

