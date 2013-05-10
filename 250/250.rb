require './connect_to_db.rb'

puts "Enter student name or number to withdraw:"
name_or_number = readline.chomp

# TODO: If they enter a number, look up that student by student_number.
#       (Hint: it's a number if you can convert it to a number and back to
#        a string and it's still the same).
# TODO: If they enter a name, look up that student by name.
# TODO: If no such student exists, print ____ is not registered.
# TODO: Otherwise, remove the student and print ____ removed.


if "#{name_or_number.to_i}" == "#{name_or_number.to_s}"
  student_lookup = Student.where(student_number: name_or_number).first
  if student_lookup == nil
    puts "#{name_or_number} is not registered."
  else
    student_lookup.destroy
    puts "#{name_or_number} removed."
  end
else
  student_lookup = Student.where(full_name: name_or_number).first
  if student_lookup == nil
    puts "#{name_or_number} is not registered."
  else
    student_lookup.destroy
    puts "#{student_lookup.full_name} removed."
  end
end