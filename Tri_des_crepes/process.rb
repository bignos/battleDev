#*******
#* Read input from STDIN
#* Use puts to output your result
#* Use:
#*      local_print( variable ); 
#* to display simple variables in a dedicated area.
#* 
#* ***/
def retournement_spatule(index, tableau_crepe)
	partie = tableau_crepe[0, index+1]
	partie.reverse!
	return ( partie + tableau_crepe[index+1, tableau_crepe.size] )
end

def is_sorted(crepes)
	(1..crepes.size-1).each do |i|
		return false if crepes[i] < crepes[i-1]
	end
	return true
end

def retournements(crepes, p = 0)
	return p if p > 7 || is_sorted(crepes)
	(0..crepes.size - 1).map do |i|
		retournements(retournement_spatule(i, crepes), p+1)
	end.min
end

tableau_crepes = Array.new
6.times { tableau_crepes << $stdin.gets.strip.to_i }

puts(retournements(tableau_crepes))
