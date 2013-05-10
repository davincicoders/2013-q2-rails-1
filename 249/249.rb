require './connect_to_db.rb'

puts "Enter new student number:"
new_student_number = readline.chomp
puts "Enter new student's full name:"
new_full_name = readline.chomp

new_student = Student.new
new_student.full_name = new_full_name
new_student.student_number = new_student_number

if new_student.save
  puts "Student added successfully!"
else 
  for error in new_student.errors.full_messages
    puts error
  end 
end

# TODO: Add this student to the students table,
# unless the name or number are blank, or the number is already taken.
# If the save fails, print out each reason why it failed.
# Otherwise, print: Student successfully added.
