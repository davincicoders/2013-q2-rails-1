require './connect_to_db.rb'

puts "Enter the course number (e.g. CS101):"
course_num = readline.chomp

# TODO: Look up the course by its number.  If there's no such course, print:
# "No such course." and exit.

puts "Enter the student number:"
student_num = readline.chomp

# TODO: Look up the student by their number.  If there's no such student, print:
# "No such student." and exit.

# TODO: add that student to that course.


person = Student.where(student_number: student_num).first

if person == nil
  puts "No such student."
else
  person.courses << Course.where(course_number: course_num).first
end
