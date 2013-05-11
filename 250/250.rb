require './connect_to_db.rb'

puts "Enter student name or number to withdraw:"
entry = readline.chomp
while entry == ''
	puts "Enter student name or number to withdraw:"
	entry = readline.chomp
end
if entry.to_i != 0
  student = Student.where(student_number: entry.to_i).first 
else
  student = Student.where(full_name: entry).first 
end
if student == nil
		puts "#{entry} is not registered."
else student.destroy
    	puts "#{entry} removed."
end



# TODO: If they enter a number, look up that student by student_number.
#       (Hint: it's a number if you can convert it to a number and back to
#        a string and it's still the same).
# TODO: If they enter a name, look up that student by name.
# TODO: If no such student exists, print ____ is not registered.
# TODO: Otherwise, remove the student and print ____ removed.
