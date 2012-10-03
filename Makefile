#!/usr/bin/make -f

binaries = fortune-mod
fortune-mod = /usr/bin/strfile
file-exists = $(if $(wildcard $(firstword $($1))),,$(error Please install $1: aptitude instal $1))
quotes-file = gaadegalu

all: prep clean fortune

prep: $(binaries)

$(binaries):
	$(call file-exists,$@)

fortune: 
	while read line; do echo $$line >> gaadegalu; echo '%' >> $(quotes-file); done < $(quotes-file).txt
	strfile $(quotes-file) $(quotes-file).dat

php: clean $(quotes-file)
	echo '<?php' >> $(quotes-file).php
	echo '$$gaadegalu = Array(' >> $(quotes-file).php
	while read line; do echo '"'$$line'", ' >> $(quotes-file).php; done < $(quotes-file).txt
	echo ');' >> $(quotes-file).php

json: clean
	echo '[' >> temp.json
	while read line; do echo '"'$$line'", ' >> temp.json; done < $(quotes-file).txt
	sed '$$ s/,\s$$//' temp.json > $(quotes-file).json	
	echo ']' >> $(quotes-file).json
	rm -rf temp.json

clean:
	-rm -rf $(quotes-file).php $(quotes-file).json $(quotes-file).dat $(quotes-file)
