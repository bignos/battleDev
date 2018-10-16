#*******
#* Read input from STDIN
#* Use echo or print to output your result, use the /n constant at the end of each result line.
#* Use:
#*      local_print (variable ); 
#* to display simple variables in a dedicated area.
#* ***/
import sys
import math

def moyenne(array):
    return math.ceil( (int(array[0]) + int(array[1]) + int(array[2])) / 3 )
    

lines = []
for line in sys.stdin:
	lines.append(line.rstrip('\n'))

result = max([ moyenne(note.split(' ')) for note in lines[1:]])
print(result)
