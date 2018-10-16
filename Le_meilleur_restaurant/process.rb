#*******
#* Read input from STDIN
#* Use puts to output your result
#* Use:
#*      local_print( variable ); 
#* to display simple variables in a dedicated area.
#* 
#* ***/
input = Array.new
while i = $stdin.gets
	input << i.strip
end

best_score = 0
tableau_note = input[1..Integer(input[0])]

tableau_note.each do |element|
	chiffres = element.split(" ").map { |str_num| Integer(str_num) }
	moyenne = (chiffres.reduce(:+).to_f / 3.to_f ).ceil
	best_score = moyenne if moyenne > best_score
end

puts(best_score)
#
# perform your processing and output your result...
#
