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

prix_repas = Integer(input[0])
tables = input[2,input.size].map { |number| Integer(number) }

accumulator = 0
tables.each do |table|
	pourcentage = 0
	if table >= 10
		pourcentage = 0.3
	elsif table >= 6
		pourcentage = 0.2
	elsif table >= 4
		pourcentage = 0.1
	end

	prix_fix = prix_repas * table
	accumulator += prix_fix - (prix_fix * pourcentage)
end

puts(accumulator.ceil)

#
# perform your processing and output your result...
#
