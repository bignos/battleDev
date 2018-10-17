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
	input << i.strip.to_i
end
#
# perform your processing and output your result...

def retournement_spatule(index, tableau_crepe)
	partie = tableau_crepe[0, index+1]
	partie.reverse!
	return ( partie + tableau_crepe[index+1, tableau_crepe.size] )
end

def index_trie(tableau, tableau_pattern)
	result = tableau.size + 1
	for cell_index in tableau.size.downto(0)
		if tableau[cell_index] == tableau_pattern[cell_index]
			result -= 1
		else
			break
		end
	end
	return result
end

def get_max_index(tableau)
	return tableau.index( tableau.max )
end

tableau_crepes = input.clone
tableau_crepes_trie = tableau_crepes.sort
puts("tableau_crepes: #{tableau_crepes}")
puts("tableau_crepes_trie: #{tableau_crepes_trie}")
puts("--------------------------------------------------------------------------------")
accumulateur = 0

while tableau_crepes != tableau_crepes_trie
	exploit_slice = tableau_crepes[0, index_trie(tableau_crepes, tableau_crepes_trie)]
	# Trouver index valeur max non trié
	max_index = get_max_index(exploit_slice[1, exploit_slice.size]) + 1
	# Retourner à partir de l'index
	tableau_crepes = retournement_spatule(max_index, tableau_crepes)
	accumulateur += 1
	puts("tableau_crepes: #{tableau_crepes}")

	reverse_index = index_trie(tableau_crepes, tableau_crepes_trie)
	tableau_crepes = retournement_spatule(reverse_index-1, tableau_crepes)
	puts("tableau_crepes: #{tableau_crepes}")
	accumulateur += 1
	break if accumulateur > 10
end

puts("Resultat: #{accumulateur}")
