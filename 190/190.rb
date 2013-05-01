require './connect_to_db'

puts "Enter a year:"
entered_year = readline.chomp.to_i

#index 1 is name, index 3 is when office was taken, index 4 is when left office.
#can't use wildcard search took_office: "*/*/1861")
#split the date field by "/" character
#sort based on year
#need to search each record, for/while loop.

list, arrayPresis = "", President.order

for pres in arrayPresis
  pres.took_office = pres.took_office.split("/")
  pres.left_office = pres.left_office.split("/")
  
  if entered_year >= pres.took_office[2].to_i && entered_year <= pres.left_office[2].to_i
    list = pres.president + "\n" + list
  end
end

puts list
#www.udemi.com ruby lessons
