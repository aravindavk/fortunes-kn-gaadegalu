Kannada Fortunes Cookies
========================

To Create Fortune Database
--------------------------
Add one Gaade per line to gaadegalu.txt and run following command

    make

Testing Generated Fortune Database
----------------------------------
To test above generated fortune database run following command

    fortune gaadegalu
    
    
Generating PHP file of Quotes    
-----------------------------
To convert the gaadegalu as PHP array, run

    make php
    
gaadegalu.php file will be created in the same directory with an array $gaadegalu

Generating JSON file of quotes
------------------------------
To convert the gaadegalu data as JSON, run

    make json
    
gaadegalu.json file will be created in the same directory.
