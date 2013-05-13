require './connect_to_db.rb'

puts "Enter student name or number to withdraw:"
name_or_number = readline.chomp

if name_or_number.to_i.to_s == name_or_number
  student = Student.where(student_number: name_or_number).first
else 
  student = Student.where(full_name: name_or_number).first
end
 
if student != nil
  student.destroy
  puts "#{name_or_number} removed."
else
  puts "#{name_or_number} is not registered."
end

# TODO: If they enter a number, look up that student by student_number.
#       (Hint: it's a number if you can convert it to a number and back to
#        a string and it's still the same).
# TODO: If they enter a name, look up that student by name.
# TODO: If no such student exists, print ____ is not registered.
# TODO: Otherwise, remove the student and print ____ removed.