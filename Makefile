default:
	rm -rf gaadegalu
	touch gaadegalu
	while read line; do echo $$line >> gaadegalu; echo '%' >> gaadegalu; done < gaadegalu.txt
	strfile gaadegalu gaadegalu.dat
fortune:
	rm -rf gaadegalu
	touch gaadegalu
	while read line; do echo $$line >> gaadegalu; echo '%' >> gaadegalu; done < gaadegalu.txt
	strfile gaadegalu gaadegalu.dat
php:
	rm -rf gaadegalu.php
	touch gaadegalu.php
	echo '<?php' >> gaadegalu.php
	echo '$$gaadegalu = Array(' >> gaadegalu.php
	while read line; do echo '"'$$line'", ' >> gaadegalu.php; done < gaadegalu.txt
	echo ');' >> gaadegalu.php
json:
	rm -rf temp.json gaadegalu.json
	touch temp.json
	echo '[' >> temp.json
	while read line; do echo '"'$$line'", ' >> temp.json; done < gaadegalu.txt
	sed '$$ s/,\s$$//' temp.json > gaadegalu.json	
	echo ']' >> gaadegalu.json
	rm -rf temp.json
clean:
	rm -rf gaadegalu.php gaadegalu.json gaadegalu.dat gaadegalu
