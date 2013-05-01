require './connect_to_db'

puts "Enter a year:"
entered_year = readline.chomp.to_i

for president in President.order('id')
  if entered_year >= president.took_office.split('/')[2].to_i &&
     entered_year <= president.left_office.split('/')[2].to_i
    puts president.president
  end
end