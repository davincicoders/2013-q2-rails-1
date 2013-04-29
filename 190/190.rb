require './connect_to_db'

puts "Enter a year:"
entered_year = readline.chomp.to_i

chiefs = President.order("id")

for chief in chiefs

entered = chief.took_office.split("/")
entered_y = entered[2].to_i  

exit = chief.left_office.split("/")
exit_year = exit[2].to_i  

  if entered_year <= exit_year && entered_year >= entered_y
    puts chief.president
  else
  end
end





=begin
require './connect_to_db'

puts "Enter a year:"
entered_year = readline.chomp.to_i

chiefs = President.order("presidents").first

entered = chiefs.took_office.split("/")
entered_y = entered[2].to_i  

exit = chiefs.left_office.split("/")
exit_year = exit[2].to_i  

# if entered_year <= exit && entered_year >= entered
=end
