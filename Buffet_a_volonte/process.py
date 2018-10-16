#*******
#* Read input from STDIN
#* Use echo or print to output your result, use the /n constant at the end of each result line.
#* Use:
#*      local_print (variable ); 
#* to display simple variables in a dedicated area.
#* ***/
import sys
import math

lines = []
for line in sys.stdin:
	lines.append(line.rstrip('\n'))

prix_repas = int(lines[0])
prix_tables = list()
tables = [int(val) for val in lines[2:]]
for table in tables:
    reduction = 0
    if table >= 10:
        reduction = 0.3
    elif table >= 6:
        reduction = 0.2
    elif table >= 4:
        reduction = 0.1
    prix_table = table * prix_repas 
    prix_tables.append(prix_table - (reduction * prix_table))
resultat = math.ceil(sum(map(float,prix_tables)))
print(resultat)
