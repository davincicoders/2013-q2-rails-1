require './connect_to_db'

puts "Enter a year:"
entered_year = readline.chomp.to_i

# took_office
# left_office
# president



pres_all = President.order("id")

for pres in pres_all

entered = pres.took_office.split("/")
enteredi = entered[2].to_i

ended = pres.left_office.split("/")
exiti = ended[2].to_i

  if enteredi <= entered_year && entered_year <= exiti
    puts pres.president
  end
end  