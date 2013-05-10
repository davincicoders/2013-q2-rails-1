
require './connect_to_db.rb'

puts "Enter new student number:"
new_student_number = readline.chomp
puts "Enter new student's full name:"
new_full_name = readline.chomp

# TODO: Add this student to the students table,
# unless the name or number are blank, or the number is already taken.
# If the save fails, print out each reason why it failed.
# Otherwise, print: Student successfully added.
 

new_student = Student.create(full_name: "#{new_full_name}", student_number: "#{new_student_number}")

if new_student.save
  puts "Student successfully added."
else
  for error in new_student.errors.full_messages
    puts error
  end
end