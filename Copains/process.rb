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
#
# perform your processing and output your result...
vos_notes = input[0].split.map { |note| note.to_i }
nb_meilleurs_copain = input[2].to_i
list_notes_copains = input[3, input.size].map{ |note_copains| note_copains.split.map { |note| note.to_i } }
puts("Vos note: #{vos_notes}")
puts("Notes des copain: #{list_notes_copains}")

list_zip = list_notes_copains.map do |notes|
    notes[0,4].zip(vos_notes)
end

puts("List notes: #{list_zip}")

list_diff = list_zip.map do |notes_diff_copain|
    differences = notes_diff_copain.map { |diff| (diff[1]-diff[0]).abs }
    differences.reduce(:+)
end

puts("List diff: #{list_diff}")

list_notes_meilleur_rocky6 = Array.new
taille_stop = list_notes_copains.size - nb_meilleurs_copain 

min_diff = list_diff.min(nb_meilleurs_copain)
min_diff.each do |diff|
    puts("diff: #{diff}")
    index = list_diff.index(diff)
    list_notes_meilleur_rocky6 << list_notes_copains[index][5]
end

puts("list_notes_meilleur_rocky6: #{list_notes_meilleur_rocky6}")
result = (list_notes_meilleur_rocky6.reduce(:+) / nb_meilleurs_copain).round
puts(result)
