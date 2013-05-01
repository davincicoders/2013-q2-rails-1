require './connect_to_db'

puts "Enter a year:"
entered_year = readline.chomp.to_i

for president in President.order('id')
president_took_office = president.took_office.split('/')[2].to_i
president_left_office = president.left_office.split('/')[2].to_i

	if entered_year >= president_took_office && entered_year <= president_left_office
    puts president.president
	end 
end 

