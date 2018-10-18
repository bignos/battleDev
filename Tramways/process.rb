#*******
#* Read input from STDIN
#* Use puts to output your result
#* Use:
#*      local_print( variable ); 
#* to display simple variables in a dedicated area.
#* 
#* ***/

require 'pp'

matrice_ligne = Array.new
$stdin.gets
while i = $stdin.gets
	matrice_ligne << i.strip.split.map(&:to_i)
end

pp(matrice_ligne)
#
# perform your processing and output your result...
